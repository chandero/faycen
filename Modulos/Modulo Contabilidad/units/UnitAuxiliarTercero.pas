unit UnitAuxiliarTercero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, ComCtrls, DB,
  IBCustomDataSet, IBQuery, UnitDmGeneral, DBClient, FR_Class, DateUtils,
  FR_DSet, FR_DBSet;

type
  TfrmAuxiliarTercero = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdCodigoInicial: TMaskEdit;
    EdCodigoFinal: TMaskEdit;
    EdCtaI: TStaticText;
    EdCtaF: TStaticText;
    GBDocumento: TGroupBox;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    Panel2: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQcomprobante: TIBQuery;
    IBQpuc: TIBQuery;
    CDSdata: TClientDataSet;
    CDSdataID_IDENTIFICACION: TIntegerField;
    CDSdataNOMBRE: TStringField;
    CDSdataCODIGO: TStringField;
    CDSdataSALDO_ANTERIOR: TCurrencyField;
    CDSdataDEBITO: TCurrencyField;
    CDSdataCREDITO: TCurrencyField;
    CDSdataSALDO_SIGUIENTE: TCurrencyField;
    ReportAuxiliar: TfrReport;
    IBQmaestro: TIBQuery;
    IBQsaldoinicial: TIBQuery;
    Label3: TLabel;
    CBMeses: TComboBox;
    frDBDataSet1: TfrDBDataSet;
    DSdata: TDataSource;
    CDSdataCUENTA: TStringField;
    IBQtmp: TIBQuery;
    btnCodigo1: TSpeedButton;
    btnCodigo2: TSpeedButton;
    pbCuenta: TProgressBar;
    pbAsociado: TProgressBar;
    CDSdataID_PERSONA: TIntegerField;
    btnNuevo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure EdCodigoInicialExit(Sender: TObject);
    procedure EdCodigoFinalExit(Sender: TObject);
    procedure btnCodigo1Click(Sender: TObject);
    procedure btnCodigo2Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxiliarTercero: TfrmAuxiliarTercero;
  dmGeneral : TdmGeneral;
  CodigoInicial : String;
  CodigoFinal   : String;
  FechaInicial  : TDate;
  FechaFinal    : TDate;
  Cadena        : String;

implementation

{$R *.dfm}

uses UnitGlobales, Unit_Mantenimientopuc, JclStrings;

procedure TfrmAuxiliarTercero.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQpuc.Database := dmGeneral.IBDatabase1;
        IBQmaestro.Database := dmGeneral.IBDatabase1;
        IBQsaldoinicial.Database := dmGeneral.IBDatabase1;
        IBQtmp.Database := dmGeneral.IBDatabase1;

        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQpuc.Transaction := dmGeneral.IBTransaction1;
        IBQmaestro.Transaction := dmGeneral.IBTransaction1;
        IBQsaldoinicial.Transaction := dmGeneral.IBTransaction1;
        IBQtmp.Transaction := dmGeneral.IBTransaction1;
        
end;

procedure TfrmAuxiliarTercero.btnProcesarClick(Sender: TObject);
var
   FechaInicialAnt,FechaFinalAnt : TDateTime;
   FechaInicial, FechaFinal: TDateTime;
   FechaInicialCorte,FechaCorte: TDateTime;
   anho,anhoant, mesrep,mesant : Integer;
   SaldoInicial, Movimiento, Debito, Credito : Currency;
begin
        btnProcesar.Enabled := False;
        // Calcular Fechas
        FechaCorte := fFechaActual;
        anho := YearOf(FechaCorte);
        mesant := CBMeses.ItemIndex + 1;
        mesrep := CBMeses.ItemIndex + 1;
        anhoant := anho;

        mesant := mesant - 1;
        if (mesant < 1) then
        begin
          mesant := 12;
          anhoant := anhoant - 1;
        end;

        TryEncodeDate(anhoant,mesant,DaysInAMonth(anhoant,mesant),fechafinalant);

        TryEncodeDate(YearOf(fechafinalant),01,01,fechainicialant);

        TryEncodeDate(anho,mesrep,01,fechainicial);
        TryEncodeDate(anho,mesrep,DaysInAMonth(YearOf(fechainicial),mesrep),fechafinal);


        CDSdata.Open;
        CDSdata.EmptyDataSet;


        IBQpuc.Close;
        IBQpuc.SQL.Clear;
        IBQpuc.SQL.Add('SELECT * FROM "con$puc" p WHERE p.CODIGO BETWEEN :CODIGO_INI and :CODIGO_FIN');
        IBQpuc.ParamByName('CODIGO_INI').AsString := CodigoInicial;
        IBQpuc.ParamByName('CODIGO_FIN').AsString := CodigoFinal;
        IBQpuc.Open;
        IBQpuc.Last;
        IBQpuc.First;

        IBQmaestro.Close;
        IBQmaestro.SQL.Clear;
        IBQmaestro.SQL.Add('select m.ID_IDENTIFICACION, m.ID_PERSONA, (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS NOMBRE from "cap$maestrotitular" m ');
        IBQmaestro.SQL.Add('inner join "gen$persona" p ON m.ID_IDENTIFICACION = p.ID_IDENTIFICACION and m.ID_PERSONA = p.ID_PERSONA');
        IBQmaestro.SQL.Add('WHERE m.ID_TIPO_CAPTACION = 1');
        IBQmaestro.SQL.Add('order by ID_IDENTIFICACION ASC, ID_PERSONA ASC');
        IBQmaestro.Open;
        IBQmaestro.Last;
        IBQmaestro.First;

        pbCuenta.Min := 0;
        pbCuenta.Max := IBQpuc.RecordCount;
        pbCuenta.Position := 0;

        while not IBQpuc.Eof do
        begin
             pbCuenta.Position := IBQpuc.RecNo;

             pbAsociado.Min := 0;
             pbAsociado.Max := IBQmaestro.RecordCount;
             pbAsociado.Position := 0;
             IBQmaestro.First;
             while not IBQmaestro.Eof do
             begin
                  pbAsociado.Position := IBQmaestro.RecNo;
                  SaldoInicial := 0;
                  IBQsaldoinicial.Close;
                  IBQsaldoinicial.SQL.Clear;
                  IBQsaldoinicial.SQL.Add('SELECT s.SALDO_INICIAL FROM "con$auxiliarterceroinicial" s');
                  IBQsaldoinicial.SQL.Add('WHERE s.ID_IDENTIFICACION = :ID_IDENTIFICACION and s.ID_PERSONA = :ID_PERSONA and ');
                  IBQsaldoinicial.SQL.Add('s.CODIGO = :CODIGO and s.ANHO = :ANHO');
                  IBQsaldoinicial.ParamByName('ID_IDENTIFICACION').AsInteger := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
                  IBQsaldoinicial.ParamByName('ID_PERSONA').AsString := IBQmaestro.FieldByName('ID_PERSONA').AsString;
                  IBQsaldoinicial.ParamByName('CODIGO').AsString := IBQpuc.FieldByName('CODIGO').AsString;
                  IBQsaldoinicial.ParamByName('ANHO').AsInteger := anho;
                  IBQsaldoinicial.Open;
                  if (IBQsaldoinicial.RecordCount > 0) then
                    SaldoInicial := IBQsaldoinicial.FieldByName('SALDO_INICIAL').AsCurrency;

                  // Movimiento Anterior al Periodo

                  Movimiento := 0;

                  if (anhoant = anho) then
                  begin
                    IBQcomprobante.Close;
                    IBQcomprobante.SQL.Clear;
                    IBQcomprobante.SQL.Add('SELECT SUM(DEBITO - CREDITO) AS MOVIMIENTO FROM "con$auxiliar" a ');
                    IBQcomprobante.SQL.Add('WHERE a.CODIGO = :CODIGO and a.ID_IDENTIFICACION = :ID_IDENTIFICACION and ');
                    IBQcomprobante.SQL.Add('a.ID_PERSONA = :ID_PERSONA and a.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL and a.ESTADOAUX IN (''O'',''C'')');
                    IBQcomprobante.ParamByName('CODIGO').AsString := IBQpuc.FieldByName('CODIGO').AsString;
                    IBQcomprobante.ParamByName('ID_IDENTIFICACION').AsInteger := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
                    IBQcomprobante.ParamByName('ID_PERSONA').AsString := IBQmaestro.FieldByName('ID_PERSONA').AsString;
                    IBQcomprobante.ParamByName('FECHA_INICIAL').AsDate := FechaInicialAnt;
                    IBQcomprobante.ParamByName('FECHA_FINAL').AsDate := FechaFinalAnt;
                    IBQcomprobante.Open;
                    if (IBQcomprobante.RecordCount > 0) then
                       Movimiento :=  IBQcomprobante.FieldByName('MOVIMIENTO').AsCurrency;
                  end;


                  // Movimiento del Periodo
                  Debito := 0;
                  Credito := 0;
                  IBQcomprobante.Close;
                  IBQcomprobante.SQL.Clear;
                  IBQcomprobante.SQL.Add('SELECT SUM(DEBITO) AS DEBITO, SUM(CREDITO) AS CREDITO FROM "con$auxiliar" a ');
                  IBQcomprobante.SQL.Add('WHERE a.CODIGO = :CODIGO and a.ID_IDENTIFICACION = :ID_IDENTIFICACION and ');
                  IBQcomprobante.SQL.Add('a.ID_PERSONA = :ID_PERSONA and a.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL and a.ESTADOAUX IN (''O'',''C'')');
                  IBQcomprobante.ParamByName('CODIGO').AsString := IBQpuc.FieldByName('CODIGO').AsString;
                  IBQcomprobante.ParamByName('ID_IDENTIFICACION').AsInteger := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
                  IBQcomprobante.ParamByName('ID_PERSONA').AsString := IBQmaestro.FieldByName('ID_PERSONA').AsString;
                  IBQcomprobante.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
                  IBQcomprobante.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
                  IBQcomprobante.Open;
                  if (IBQcomprobante.RecordCount > 0 ) then
                  begin
                      Debito := IBQcomprobante.FieldByName('DEBITO').AsCurrency;
                      Credito := IBQcomprobante.FieldByName('CREDITO').AsCurrency;
                  end;

                  CDSdata.Insert;
                  CDSdataID_IDENTIFICACION.Value := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
                  CDSdataID_PERSONA.Value := IBQmaestro.FieldByName('ID_PERSONA').AsInteger;
                  CDSdataNOMBRE.Value := IBQmaestro.FieldByName('NOMBRE').AsString;
                  CDSdataCODIGO.Value := IBQpuc.FieldByName('CODIGO').AsString;
                  CDSdataCUENTA.Value := IBQpuc.FieldByName('NOMBRE').AsString;
                  CDSdataSALDO_ANTERIOR.Value := SaldoInicial + Movimiento;
                  CDSdataDEBITO.Value := Debito;
                  CDSdataCREDITO.Value := Credito;
                  CDSdataSALDO_SIGUIENTE.Value := SaldoInicial + Movimiento + Debito - Credito;
                  if (CDSdataSALDO_ANTERIOR.Value <> 0) or (CDSdataDEBITO.Value <> 0) or
                      (CDSdataCREDITO.Value <> 0) or (CDSdataSALDO_SIGUIENTE.Value <> 0) then
                      CDSdata.Post
                  else
                      CDSdata.Cancel;

                  Application.ProcessMessages;
                  IBQmaestro.Next;
             end;
             Application.ProcessMessages;
             IBQpuc.Next;
        end;


          CDSdata.First;

          ReportAuxiliar.LoadFromFile('ReportesCon\AuxiliarTercero.frf');
          ReportAuxiliar.Dictionary.Variables['EMPRESA']:= QuotedStr(Empresa);
          ReportAuxiliar.Dictionary.Variables['DESCRIPCION'] := QuotedStr(Description);
          ReportAuxiliar.Dictionary.Variables['PERIODO'] := QuotedStr(CBMeses.Text);
          ReportAuxiliar.Dictionary.Variables['ANHO'] := QuotedStr(IntToStr(anho));
          ReportAuxiliar.Dictionary.Variables['CODIGOINICIAL'] := QuotedStr(StrTrimCharsRight(CodigoInicial,['0']));
          ReportAuxiliar.Dictionary.Variables['CODIGOFINAL'] := QuotedStr(StrTrimCharsRight(CodigoFinal,['0']));
          ReportAuxiliar.Dictionary.Variables['CUENTAINICIAL'] := QuotedStr(EdCtaI.Caption);
          ReportAuxiliar.Dictionary.Variables['CUENTAFINAL'] := QuotedStr(EdCtaF.Caption);


          if ReportAuxiliar.PrepareReport then
          begin
             ReportAuxiliar.ShowPreparedReport;
          end;
end;

procedure TfrmAuxiliarTercero.EdCodigoInicialExit(Sender: TObject);
begin
        Cadena := EdCodigoInicial.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoInicial := Cadena;
        with IBQtmp do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT NOMBRE, MOVIMIENTO FROM "con$puc" p WHERE p.CODIGO = :CODIGO');
         ParamByName('CODIGO').AsString := CodigoInicial;
         Open;
         if RecordCount > 0 then
            EdCtaI.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaI.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure TfrmAuxiliarTercero.EdCodigoFinalExit(Sender: TObject);
begin
        Cadena := EdCodigoFinal.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoFinal := Cadena;
        with IBQtmp do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT NOMBRE, MOVIMIENTO FROM "con$puc" p WHERE p.CODIGO = :CODIGO');
         ParamByName('CODIGO').AsString := CodigoFinal;
         Open;
         if RecordCount > 0 then
            EdCtaF.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaF.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure TfrmAuxiliarTercero.btnCodigo1Click(Sender: TObject);
var
   frmPUC: TfrmMantenimientopuc;
begin
        frmPUC := TfrmMantenimientopuc.Create(self);
        frmPUC.CodigoSeleccionado := EdCodigoInicial.Text;
        frmPUC.btnSeleccionar.Enabled := true;
        if ( frmPUC.ShowModal = mrOK ) then
        begin
            frmPUC.btnSeleccionar.Enabled := false;
            EdCodigoInicial.Text := frmPUC.CodigoSeleccionado;
            EdCodigoInicial.OnExit(self);
        end;
        frmPUC.Free;
end;

procedure TfrmAuxiliarTercero.btnCodigo2Click(Sender: TObject);
var
   frmPUC: TfrmMantenimientopuc;
begin
        frmPUC := TfrmMantenimientopuc.Create(self);
        frmPUC.CodigoSeleccionado := EdCodigoFinal.Text;
        frmPUC.btnSeleccionar.Enabled := true;
        if ( frmPUC.ShowModal = mrOK ) then
        begin
            frmPUC.btnSeleccionar.Enabled := false;
            EdCodigoFinal.Text := frmPUC.CodigoSeleccionado;
            EdCodigoFinal.OnExit(self);
        end;
        frmPUC.Free;
end;

procedure TfrmAuxiliarTercero.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAuxiliarTercero.btnNuevoClick(Sender: TObject);
begin
        if (IBQpuc.Transaction.InTransaction) then
        begin
            IBQpuc.Transaction.Commit;
        end;
        IBQpuc.Transaction.StartTransaction;
        btnProcesar.Enabled := True;
end;

end.
