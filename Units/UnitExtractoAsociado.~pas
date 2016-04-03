unit UnitExtractoAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, DBCtrls, StdCtrls, Buttons,
  DBClient, UnitDmGeneral, JvDBLookupTreeView, ExtCtrls, Grids, DBGrids, DateUtils,
  JvEdit, JvTypedEdit, ComCtrls, pr_TxClasses, pr_Common, pr_Classes,
  IBExtract;

type
  TfrmExtractoAsociado = class(TForm)
    DSasociado: TDataSource;
    IBQasociado: TIBQuery;
    CDSextracto: TClientDataSet;
    CDSextractoCBTE: TStringField;
    CDSextractoFECHA: TDateField;
    CDSextractoCONCEPTO: TStringField;
    CDSextractoID_COLOCACION: TStringField;
    CDSextractoVALOR_DESEMBOLSO: TCurrencyField;
    CDSextractoCUOTA_PERIODO: TIntegerField;
    CDSextractoTOTAL_CUOTAS: TIntegerField;
    CDSextractoSALDO_ANTERIOR: TCurrencyField;
    CDSextractoPAGOS: TCurrencyField;
    CDSextractoCAPITAL: TCurrencyField;
    CDSextractoINTERES: TCurrencyField;
    CDSextractoSEGURO: TCurrencyField;
    CDSextractoSALDO_SIGUIENTE: TCurrencyField;
    CDSotros: TClientDataSet;
    CDSotrosCXC: TCurrencyField;
    CDSotrosCARGOS: TCurrencyField;
    CDSotrosPAGOS: TCurrencyField;
    CDSotrosAPAGAR: TCurrencyField;
    CDSotrosSUELDO: TCurrencyField;
    CDSotrosALMACEN: TCurrencyField;
    CDSotrosMERCADO: TCurrencyField;
    IBQcartera: TIBQuery;
    IBQdeposito: TIBQuery;
    IBQmovimiento: TIBQuery;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label3: TLabel;
    EdNumeroIdentificacion: TMemo;
    EdNombre: TStaticText;
    btnBuscar: TBitBtn;
    btnProcesar: TBitBtn;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    DBGextracto: TDBGrid;
    DSgridextracto: TDataSource;
    CBMeses: TComboBox;
    Label1: TLabel;
    IBQdepositosaldomovimiento: TIBQuery;
    IBQdepositomovimiento: TIBQuery;
    IBQdepositosaldoinicial: TIBQuery;
    CDSextractoCSC: TIntegerField;
    IBQcargomes: TIBQuery;
    IBQcodigopuc: TIBQuery;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    EdCXCSaldoAnterior: TJvCurrencyEdit;
    Label4: TLabel;
    EdCXCCargoMes: TJvCurrencyEdit;
    Label6: TLabel;
    EdCXCAbonoMes: TJvCurrencyEdit;
    Label5: TLabel;
    EdCXCApagar: TJvCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edfechacorteini: TDateTimePicker;
    edfechacortefin: TDateTimePicker;
    edfechaini: TDateTimePicker;
    edfechafin: TDateTimePicker;
    prReport1: TprReport;
    btnPlano: TBitBtn;
    btnGrafico: TBitBtn;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edDireccion: TEdit;
    edTelefono: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edSueldo: TJvCurrencyEdit;
    edAlmacen: TJvCurrencyEdit;
    edMercado: TJvCurrencyEdit;
    IBQgenminimos: TIBQuery;
    Label16: TLabel;
    edCuenta: TEdit;
    prTxReport1: TprTxReport;
    IBQproceso: TIBQuery;
    IBQrevalorizacion: TIBQuery;
    IBQrevalorizacionmov: TIBQuery;
    IBExtract1: TIBExtract;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPlanoClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmExtractoAsociado: TfrmExtractoAsociado;
  dmGeneral: TdmGeneral;
  Sueldo: Currency;

implementation

{$R *.dfm}

uses UnitBuscarPersona, UnitGlobales;

procedure TfrmExtractoAsociado.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQasociado.Database := dmGeneral.IBDatabase1;
        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQdeposito.Database := dmGeneral.IBDatabase1;
        IBQmovimiento.Database := dmGeneral.IBDatabase1;
        IBQdepositomovimiento.Database := dmGeneral.IBDatabase1;
        IBQdepositosaldomovimiento.Database := dmGeneral.IBDatabase1;
        IBQdepositosaldoinicial.Database := dmGeneral.IBDatabase1;
        IBQcargomes.Database := dmGeneral.IBDatabase1;
        IBQcodigopuc.Database := dmGeneral.IBDatabase1;
        IBQgenminimos.Database := dmGeneral.IBDatabase1;
        IBQproceso.Database := dmGeneral.IBDatabase1;
        IBQrevalorizacion.Database := dmGeneral.IBDatabase1;
        IBQrevalorizacionmov.Database := dmGeneral.IBDatabase1;


        IBQasociado.Transaction := dmGeneral.IBTransaction1;
        IBQcartera.Transaction := dmGeneral.IBTransaction1;
        IBQdeposito.Transaction := dmGeneral.IBTransaction1;
        IBQmovimiento.Transaction := dmGeneral.IBTransaction1;
        IBQdepositomovimiento.Transaction := dmGeneral.IBTransaction1;
        IBQdepositosaldomovimiento.Transaction := dmGeneral.IBTransaction1;
        IBQdepositosaldoinicial.Transaction := dmGeneral.IBTransaction1;
        IBQcargomes.Transaction := dmGeneral.IBTransaction1;
        IBQcodigopuc.Transaction := dmGeneral.IBTransaction1;
        IBQgenminimos.Transaction := dmGeneral.IBTransaction1;
        IBQproceso.Transaction := dmGeneral.IBTransaction1;
        IBQrevalorizacion.Transaction := dmGeneral.IBTransaction1;
        IBQrevalorizacionmov.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmExtractoAsociado.FormShow(Sender: TObject);
begin
        if (dmGeneral.IBTransaction1.InTransaction) then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        btnProcesar.Enabled := False;
        IBQasociado.Open;
end;

procedure TfrmExtractoAsociado.btnBuscarClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
        frmBuscarPersona := TfrmBuscarPersona.Create(Self);
        if frmBuscarPersona.ShowModal = mrOK then
        begin
           EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
           EdNumeroIdentificacionExit(TObject(EdNumeroIdentificacion));
        end;
end;

procedure TfrmExtractoAsociado.EdNumeroIdentificacionExit(Sender: TObject);
begin
      if (EdNumeroIdentificacion.Text <> '') then
      begin
        IBQasociado.Close;
        IBQasociado.SQL.Clear;
        IBQasociado.SQL.Add('SELECT m.*, d.*, t.* FROM "gen$persona" m');
        IBQasociado.SQL.Add('LEFT JOIN "gen$direccion" d ON d.ID_IDENTIFICACION = m.ID_IDENTIFICACION and d.ID_PERSONA = m.ID_PERSONA and d.CONSECUTIVO = 1');
        IBQasociado.SQL.Add('LEFT JOIN "cap$maestrotitular" t ON t.ID_IDENTIFICACION = m.ID_IDENTIFICACION and t.ID_PERSONA = m.ID_PERSONA and t.ID_TIPO_CAPTACION = 1');
        IBQasociado.SQL.Add('WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION AND m.ID_PERSONA = :ID_PERSONA');
        IBQasociado.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQasociado.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQasociado.Open;
        if (IBQasociado.RecordCount > 0) then
        begin
         EdNombre.Caption := IBQasociado.FieldByName('NOMBRE').AsString + ' ' + IBQasociado.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQasociado.FieldByName('SEGUNDO_APELLIDO').AsString;
         edDireccion.Text := IBQasociado.FieldByName('DIRECCION').AsString + ' ' + IBQasociado.FieldByName('BARRIO').AsString;
         edTelefono.Text := IBQasociado.FieldByName('TELEFONO1').AsString;
         edCuenta.Text := FormatFloat('0000',IBQasociado.FieldByName('NUMERO_CUENTA').AsFloat);
         Sueldo := IBQasociado.FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency;
         edSueldo.Value := Sueldo;
         IBQgenminimos.Close;
         IBQgenminimos.SQL.Clear;
         IBQgenminimos.SQL.Add('SELECT * FROM "gen$minimos" WHERE ID_MINIMO = :ID_MINIMO');
         // Almacen
         IBQgenminimos.ParamByName('ID_MINIMO').AsInteger := 101;
         IBQgenminimos.Open;
         edAlmacen.Value := Round(Sueldo * (IBQgenminimos.FieldByName('VALOR_MINIMO').AsCurrency / 100));




         // Mercado
         IBQgenminimos.Close;
         IBQgenminimos.ParamByName('ID_MINIMO').AsInteger := 102;
         IBQgenminimos.Open;
         edMercado.Value := Round(Sueldo * (IBQgenminimos.FieldByName('VALOR_MINIMO').AsCurrency / 100));


         btnProcesar.Enabled := True;
         btnBuscar.Enabled := False;
         EdNumeroIdentificacion.Enabled := False;
        end
        else
        begin
            ShowMessage('Persona No Existe!!!');
            CmdNuevo.Click;
        end;
      end
end;

procedure TfrmExtractoAsociado.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmExtractoAsociado.Inicializar;
begin
            if (dmGeneral.IBTransaction1.InTransaction) then
              dmGeneral.IBTransaction1.Rollback;
            dmGeneral.IBTransaction1.StartTransaction;
            EdNumeroIdentificacion.Enabled := True;
            EdNumeroIdentificacion.Text := '';
            btnBuscar.Enabled := True;
            EdNombre.Enabled := True;
            EdNombre.Caption := '';
            CDSextracto.EmptyDataSet;
            CDSextracto.Close;
            IBQasociado.Close;
            IBQcartera.Close;
            IBQdeposito.Close;
            IBQmovimiento.Close;
            IBQdepositosaldomovimiento.Close;
            IBQdepositomovimiento.Close;
            IBQdepositosaldoinicial.Close;
            IBQgenminimos.Close;
            IBQrevalorizacion.Close;
            IBQrevalorizacionmov.Close;
            EdCXCSaldoAnterior.Value := 0;
            EdCXCCargoMes.Value := 0;
            EdCXCAbonoMes.Value := 0;
            EdCXCApagar.Value := 0;
            edSueldo.Value := 0;
            edAlmacen.Value := 0;
            edMercado.Value := 0;
            edDireccion.Text := '';
            edTelefono.Text := '';
            edCuenta.Text :='';


end;

procedure TfrmExtractoAsociado.btnProcesarClick(Sender: TObject);
var
  fechainicialcorte, fechacorte, fechainicial, fechafinal : TDateTime;
  fechainicialant, fechafinalant : TDateTime;
  mes: Integer;
  mesant, mesrep: Integer;
  ano: Integer;
  anoant: Integer;
  saldoinicial,saldoanterior:Currency;
  movimiento,movimientoanterior:Currency;
  saldo, valortmp:Currency;
  csc : Integer;
  cxcinicial, cxcanterior, cxc, abonocxc, cxcapagar: Currency;
  codigonomina: String;
  codigocaja: String;
  Cuota: integer;
  revalorizacion: Currency;
  fecharevalorizacion: TDate;
begin

        btnProcesar.Enabled := False;

        CDSextracto.Open;
        CDSextracto.EmptyDataSet;

        fechacorte := fFechaActual;
        fechainicial := fechacorte;
        mesant := CBMeses.ItemIndex + 1;
        mesrep := CBMeses.ItemIndex + 1;
        anoant := YearOf(fechacorte);
        ano := anoant;

        csc := 0;

        mesant := mesant - 1;
        if (mesant < 1) then
        begin
          mesant := 12;
          anoant := anoant -1;
        end;

        if mesant <> 2 then
        begin
            TryEncodeDate(anoant,mesant,30,fechacorte);
        end
        else
            TryEncodeDate(anoant,mesant,DaysInAMonth(anoant,mesant),fechacorte);

        TryEncodeDate(YearOf(fechacorte),MonthOf(fechacorte),01,fechainicialcorte);

        TryEncodeDateTime(YearOf(fechainicial),01,01,00,00,00,00,fechainicialant);
        if (mesrep > 1) then
          TryEncodeDateTime(YearOf(fechainicialant),mesrep-1,DaysInAMonth(YearOf(fechainicialant),mesrep-1),23,59,59,00,fechafinalant)
        else
          TryEncodeDateTime(YearOf(fechainicial),01,01,00,00,00,00,fechafinalant);


        TryEncodeDate(YearOf(fechainicial),mesrep,01,fechainicial);
        TryEncodeDate(YearOf(fechainicial),mesrep,DaysInAMonth(YearOf(fechainicial),mesrep),fechafinal);

        edfechacorteini.Date := fechainicialcorte;
        edfechacortefin.Date := fechacorte;
        edfechaini.Date := fechainicial;
        edfechafin.Date := fechafinal;

        // Procesar Revalorizacion de Aportes si Aplica
        revalorizacion := 0;
        saldoinicial := 0;
        movimientoanterior := 0;
        IBQrevalorizacion.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQrevalorizacion.Open;

        while not IBQrevalorizacion.Eof do
        begin
            IBQrevalorizacionmov.Close;
            IBQrevalorizacionmov.SQL.Clear;
            IBQrevalorizacionmov.SQL.Add('SELECT * FROM "cap$extracto" e WHERE ');
            IBQrevalorizacionmov.SQL.Add('e.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            IBQrevalorizacionmov.SQL.Add('e.ID_AGENCIA = :ID_AGENCIA and');
            IBQrevalorizacionmov.SQL.Add('e.NUMERO_CUENTA = :NUMERO_CUENTA and');
            IBQrevalorizacionmov.SQL.Add('e.DIGITO_CUENTA = :DIGITO_CUENTA and');
            IBQrevalorizacionmov.SQL.Add('e.FECHA_MOVIMIENTO BETWEEN :FECHA_INI and :FECHA_FIN');
            IBQrevalorizacionmov.ParamByName('ID_AGENCIA').AsInteger := IBQrevalorizacion.FieldByName('ID_AGENCIA').AsInteger;
            IBQrevalorizacionmov.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQrevalorizacion.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQrevalorizacionmov.ParamByName('NUMERO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQrevalorizacionmov.ParamByName('DIGITO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQrevalorizacionmov.ParamByName('FECHA_INI').AsDate := fechainicial;
            IBQrevalorizacionmov.ParamByName('FECHA_FIN').AsDate := fechafinal;
            IBQrevalorizacionmov.Open;

            while not IBQrevalorizacionmov.Eof do
            begin
                if (IBQrevalorizacionmov.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 29) then
                begin
                   revalorizacion := revalorizacion + IBQrevalorizacionmov.FieldByName('VALOR_DEBITO').AsCurrency - IBQrevalorizacionmov.FieldByName('VALOR_CREDITO').AsCurrency;
                   fecharevalorizacion := IBQrevalorizacionmov.FieldByName('FECHA_MOVIMIENTO').AsDateTime;
                end;
                IBQrevalorizacionmov.Next;
            end;
            IBQdepositosaldoinicial.Close;
            IBQdepositosaldoinicial.ParamByName('ID_AGENCIA').AsInteger := IBQrevalorizacion.FieldByName('ID_AGENCIA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQrevalorizacion.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQdepositosaldoinicial.ParamByName('NUMERO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('DIGITO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('ANO').AsInteger := YearOf(fechainicial);
            IBQdepositosaldoinicial.Open;
            saldoinicial := saldoinicial + IBQdepositosaldoinicial.FieldByName('SALDOAHORROS').AsCurrency;

            if (mesrep > 1) then
            begin
              IBQdepositosaldomovimiento.Close;
              IBQdepositosaldomovimiento.ParamByName('ID_AGENCIA').AsInteger := IBQrevalorizacion.FieldByName('ID_AGENCIA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQrevalorizacion.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('NUMERO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('DIGITO_CUENTA').AsInteger := IBQrevalorizacion.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('FECHA_INICIAL').AsDate := fechainicialant;
              IBQdepositosaldomovimiento.ParamByName('FECHA_FINAL').AsDate := fechafinalant;
              IBQdepositosaldomovimiento.Open;

              movimientoanterior := movimientoanterior + IBQdepositosaldomovimiento.FieldByName('MOVIMIENTO').AsCurrency;
            end
            else
            begin
              movimientoanterior := movimientoanterior + 0;
            end;

            IBQrevalorizacion.Next;
        end;

        saldoanterior := saldoinicial + movimientoanterior;
        saldo := saldoanterior + revalorizacion;

        if (revalorizacion <> 0 ) then
        begin
            csc := csc + 1;
            CDSextracto.Insert;
            CDSextractoCSC.Value := csc;
            CDSextractoCBTE.Clear;
            CDSextractoFECHA.Value := fechafinal;
            CDSextractoCONCEPTO.Value := 'APORTES REVALORIZACION';
            CDSextractoID_COLOCACION.Clear;
            CDSextractoVALOR_DESEMBOLSO.Clear;
            CDSextractoCUOTA_PERIODO.Clear;
            CDSextractoTOTAL_CUOTAS.Clear;
            CDSextractoPAGOS.Value := revalorizacion;
            CDSextractoCAPITAL.Clear;
            CDSextractoINTERES.Clear;
            CDSextractoSEGURO.Clear;
            CDSextractoSALDO_ANTERIOR.Value := saldoanterior;
            CDSextractoSALDO_SIGUIENTE.Value := saldo;
            if ((saldoanterior <> 0) or (saldo <> 0)) then
               CDSextracto.Post;
        end;

        // Procesar Depositos
        IBQdeposito.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQdeposito.Open;

        while not IBQdeposito.Eof do
        begin
            IBQdepositosaldoinicial.Close;
            IBQdepositosaldoinicial.ParamByName('ID_AGENCIA').AsInteger := IBQdeposito.FieldByName('ID_AGENCIA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQdepositosaldoinicial.ParamByName('NUMERO_CUENTA').AsInteger := IBQdeposito.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('DIGITO_CUENTA').AsInteger := IBQdeposito.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQdepositosaldoinicial.ParamByName('ANO').AsInteger := YearOf(fechainicial);
            IBQdepositosaldoinicial.Open;

            saldoinicial := IBQdepositosaldoinicial.FieldByName('SALDOAHORROS').AsCurrency;

            if (mesrep > 1) then
            begin
              IBQdepositosaldomovimiento.Close;
              IBQdepositosaldomovimiento.ParamByName('ID_AGENCIA').AsInteger := IBQdeposito.FieldByName('ID_AGENCIA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('NUMERO_CUENTA').AsInteger := IBQdeposito.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('DIGITO_CUENTA').AsInteger := IBQdeposito.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQdepositosaldomovimiento.ParamByName('FECHA_INICIAL').AsDate := fechainicialant;
              IBQdepositosaldomovimiento.ParamByName('FECHA_FINAL').AsDate := fechafinalant;
              IBQdepositosaldomovimiento.Open;

              movimientoanterior := IBQdepositosaldomovimiento.FieldByName('MOVIMIENTO').AsCurrency;
            end
            else
            begin
              movimientoanterior := 0;
            end;

            saldoanterior := saldoinicial+ movimientoanterior;
            if (IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger = 1)
            then
            begin
                saldoanterior := saldoanterior + revalorizacion;
            end;

            IBQdepositomovimiento.Close;
            IBQdepositomovimiento.ParamByName('ID_AGENCIA').AsInteger := IBQdeposito.FieldByName('ID_AGENCIA').AsInteger;
            IBQdepositomovimiento.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQdepositomovimiento.ParamByName('NUMERO_CUENTA').AsInteger := IBQdeposito.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQdepositomovimiento.ParamByName('DIGITO_CUENTA').AsInteger := IBQdeposito.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQdepositomovimiento.ParamByName('FECHA_INICIAL').AsDate := fechainicial;
            IBQdepositomovimiento.ParamByName('FECHA_FINAL').AsDate := fechafinal;
            IBQdepositomovimiento.Open;

            movimiento := IBQdepositomovimiento.FieldByName('MOVIMIENTO').AsCurrency;
            if (IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger = 1) then
            begin
                movimiento := movimiento - revalorizacion;
            end;
            saldo := saldoanterior + movimiento;

            csc := csc + 1;
            CDSextracto.Insert;
            CDSextractoCSC.Value := csc;
            CDSextractoCBTE.Clear;
            CDSextractoFECHA.Value := fechafinal;
            CDSextractoCONCEPTO.Value := IBQdeposito.FieldByName('DESCRIPCION').AsString;
            CDSextractoID_COLOCACION.Clear;
            CDSextractoVALOR_DESEMBOLSO.Clear;
            CDSextractoCUOTA_PERIODO.Clear;
            CDSextractoTOTAL_CUOTAS.Clear;
            CDSextractoPAGOS.Clear;
            CDSextractoCAPITAL.Value := movimiento;
            CDSextractoINTERES.Clear;
            CDSextractoSEGURO.Clear;
            if (IBQdeposito.FieldByName('ID_FORMA').AsInteger = 7) then
            begin
               CDSextractoSALDO_ANTERIOR.Clear;
               CDSextractoSALDO_SIGUIENTE.Clear;
            end
            else
            begin
               CDSextractoSALDO_ANTERIOR.Value := saldoanterior;
               CDSextractoSALDO_SIGUIENTE.Value := saldo;
            end;
            if ((saldoanterior <> 0) or (saldo <> 0)) then
               CDSextracto.Post;

            IBQdeposito.Next;


        end;

        // Procesar Cartera

        IBQcartera.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQcartera.ParamByName('FECHA_CORTE').AsDate := fechacorte;
        IBQcartera.Open;


        while not IBQcartera.Eof do
        begin
                Cuota := 0;
             // buscar cuota del corte
                IBQproceso.Close;
                IBQproceso.SQL.Clear;
                IBQproceso.SQL.Add('SELECT * FROM "col$tablaliquidacion" t WHERE t.ID_COLOCACION = :ID_COLOCACION ORDER BY t.CUOTA_NUMERO');
                IBQproceso.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQproceso.Open;
                IBQproceso.Last;
                IBQproceso.First;
                while not IBQproceso.Eof do
                begin
                    if (fechainicial <= IBQproceso.FieldByName('FECHA_A_PAGAR').AsDateTime) and (IBQproceso.FieldByName('FECHA_A_PAGAR').AsDateTime <= fechafinal) then
                    begin
                        Cuota := IBQproceso.FieldByName('CUOTA_NUMERO').AsInteger;
                        break;
                    end;
                    IBQproceso.Next;
                end;
             //

             csc := csc + 1;
             CDSextracto.Insert;
             CDSextractoCSC.Value := csc;
             CDSextractoCBTE.Value := IBQcartera.FieldByName('NOTA_CONTABLE').AsString;
             CDSextractoFECHA.Value := IBQcartera.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
             CDSextractoCONCEPTO.Value := IBQcartera.FieldByName('DESCRIPCION_LINEA').AsString + ' ' +IBQcartera.FieldByName('DESCRIPCION').AsString;
             CDSextractoID_COLOCACION.Value := IBQcartera.FieldByName('ID_COLOCACION').AsString;
             CDSextractoVALOR_DESEMBOLSO.Value := IBQcartera.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
             CDSextractoCUOTA_PERIODO.Value := Cuota;
             CDSextractoTOTAL_CUOTAS.Value := IBQcartera.FieldByName('PLAZO_COLOCACION').AsInteger div IBQcartera.FieldByname('AMORTIZA_INTERES').AsInteger;
             CDSextractoSALDO_ANTERIOR.Value := IBQcartera.FieldByName('SALDO_ANTERIOR').AsCurrency;
             CDSextractoPAGOS.Value := 0;
             CDSextractoCAPITAL.Value := IBQcartera.FieldByName('CAPITAL').AsCurrency;
             CDSextractoINTERES.Value := IBQcartera.FieldByName('INTERES').AsCurrency;
             CDSextractoSEGURO.Value := IBQcartera.FieldByName('DESCUENTO').AsCurrency;
             CDSextractoSALDO_SIGUIENTE.Value := IBQcartera.FieldByName('SALDO_SIGUIENTE').AsCurrency;
             CDSextracto.Post;

             IBQcartera.Next;
        end;


        // Procesar Abonos Mes

        IBQmovimiento.Close;
        IBQmovimiento.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQmovimiento.ParamByName('FECHA_INICIAL').AsDate := fechainicial;
        IBQmovimiento.ParamByName('FECHA_FINAL').AsDate := fechafinal;
        IBQmovimiento.Open;

        while not IBQmovimiento.Eof do
        begin
             csc := csc + 1;
             CDSextracto.Insert;
             CDSextractoCSC.Value := csc;
             CDSextractoCBTE.Value := IBQmovimiento.FieldByName('ABREVIATURA').AsString + IBQmovimiento.FieldByName('COMPROBANTE').AsString;
             CDSextractoFECHA.Clear;
             CDSextractoCONCEPTO.Value := 'VR. DESCUENTO MES';
             CDSextractoID_COLOCACION.Clear;
             CDSextractoVALOR_DESEMBOLSO.Clear;
             CDSextractoCUOTA_PERIODO.Clear;
             CDSextractoTOTAL_CUOTAS.Clear;
             CDSextractoSALDO_ANTERIOR.Clear;
             CDSextractoPAGOS.Value := IBQmovimiento.FieldByName('CREDITO').AsCurrency;
             CDSextractoCAPITAL.Clear;
             CDSextractoINTERES.Clear;
             CDSextractoSEGURO.Clear;
             CDSextractoSALDO_SIGUIENTE.Clear;
             CDSextracto.Post;

             IBQmovimiento.Next;
        end;

        cxcinicial := 0;
        cxcanterior := 0;
        cxc := 0;
        abonocxc := 0;
        cxc := 0;
        // Procesar Cuentas x Cobrar y Otros

        IBQcodigopuc.Close;
        IBQcodigopuc.SQL.Clear;
        IBQcodigopuc.SQL.Add('SELECT CODIGO FROM "col$codigospucbasicos"');
        IBQcodigopuc.SQL.Add('WHERE ID_CODIGOPUCBASICO = 98');
        IBQcodigopuc.Open;
        codigocaja := IBQcodigopuc.FieldByName('CODIGO').AsString;



        IBQcodigopuc.Close;
        IBQcodigopuc.SQL.Clear;
        IBQcodigopuc.SQL.Add('SELECT CODIGO FROM "col$codigospucbasicos"');
        IBQcodigopuc.SQL.Add('WHERE ID_CODIGOPUCBASICO = 99');
        IBQcodigopuc.Open;
        codigonomina := IBQcodigopuc.FieldByName('CODIGO').AsString;


        IBQcargomes.Close;
        IBQcargomes.SQL.Clear;
        IBQcargomes.SQL.Add('SELECT SALDO_INICIAL FROM "con$auxiliarterceroinicial" s');
        IBQcargomes.SQL.Add('WHERE s.ID_IDENTIFICACION = :ID_IDENTIFICACION and s.ID_PESONA = :ID_PERSONA and ');
        IBQcargomes.SQL.Add('s.CODIGO = :CODIGO and s.ANYO = :ANYO');
        IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQcargomes.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQcargomes.ParamByName('CODIGO').AsString := codigocaja;
        IBQcargomes.ParamByName('ANYO').AsInteger := ano;
        if (IBQcargomes.RecordCount > 0 ) then
        begin
                valortmp := IBQcargomes.FieldByName('SALDO_INICIAL').AsCurrency;
        end
        else
                valortmp := 0;
                
        cxcinicial := cxcinicial + valortmp;

        IBQcargomes.Close;
        IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQcargomes.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQcargomes.ParamByName('CODIGO').AsString := codigonomina;

        if (IBQcargomes.RecordCount > 0 ) then
        begin
                valortmp := IBQcargomes.FieldByName('SALDO_INICIAL').AsCurrency;
        end
        else
                 valortmp := 0;

        cxcinicial := cxcinicial + valortmp;

        if (mesrep > 1) then
        begin
         IBQcargomes.Close;
         IBQcargomes.SQL.Clear;
         IBQcargomes.SQL.Add('SELECT SUM(DEBITO - CREDITO) AS MOVIMIENTO FROM GEN$PERSONAMOVIMIENTO m');
         IBQcargomes.SQL.Add(' WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION and ');
         IBQcargomes.SQL.Add(' m.ID_PERSONA = :ID_PERSONA and m.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL');
         IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
         IBQcargomes.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
         IBQcargomes.ParamByName('FECHA_INICIAL').AsDate := fechainicialant;
         IBQcargomes.ParamByName('FECHA_FINAL').AsDate := fechafinalant;
         IBQcargomes.Open;

         if (IBQcargomes.RecordCount > 0 ) then
         begin
            valortmp := IBQcargomes.FieldByName('MOVIMIENTO').AsCurrency;
         end
         else
            valortmp := 0;

         cxcanterior := cxcinicial + valortmp;

        end;
        
        IBQcargomes.Close;
        IBQcargomes.SQL.Clear;
        IBQcargomes.SQL.Add('SELECT SUM(DEBITO) AS DEBITO, SUM(CREDITO) AS CREDITO FROM GEN$PERSONAMOVIMIENTO m');
        IBQcargomes.SQL.Add(' WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION and ');
        IBQcargomes.SQL.Add(' m.ID_PERSONA = :ID_PERSONA and m.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL');
        IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQcargomes.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQcargomes.ParamByName('FECHA_INICIAL').AsDate := fechainicial;
        IBQcargomes.ParamByName('FECHA_FINAL').AsDate := fechafinal;
        IBQcargomes.Open;

        if (IBQcargomes.RecordCount > 0 ) then
        begin
          cxc := IBQcargomes.FieldByName('DEBITO').AsCurrency;
          abonocxc := IBQcargomes.FieldByName('CREDITO').AsCurrency;
        end
        else
        begin
            cxc := 0;
            abonocxc := 0;
        end;

        cxcapagar := cxcanterior + cxc - abonocxc;

        EdCXCSaldoAnterior.Value := cxcanterior;
        EdCXCCargoMes.Value := cxc;
        EdCXCAbonoMes.Value := abonocxc;
        EdCXCApagar.Value := cxcapagar;

        btnPlano.Enabled := True;

        dmGeneral.IBTransaction1.Commit;

end;

procedure TfrmExtractoAsociado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmExtractoAsociado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Inicializar;
        dmGeneral.Free;
end;

procedure TfrmExtractoAsociado.btnPlanoClick(Sender: TObject);
begin
        prTxReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
        prTxReport1.Variables.ByName['DESCRIPCION_EMPRESA'].AsString := Descripcion_Empresa;
        prTxReport1.Variables.ByName['TELEFONO'].AsString := Telefono;
        prTxReport1.Variables.ByName['CELULAR'].AsString := Movil;
        prTxReport1.Variables.ByName['ASOCIADO'].AsString := EdNombre.Caption;
        prTxReport1.Variables.ByName['CUENTA'].AsString := edCuenta.Text;
        prTxReport1.Variables.ByName['DIRECCION'].AsString := edDireccion.Text;
        prTxReport1.Variables.ByName['TELEFONO'].AsString := edTelefono.Text;
        prTxReport1.Variables.ByName['PERIODO'].AsString := CBMeses.Text;


        prTxReport1.Variables.ByName['CXCSALDOANTERIOR'].AsDouble := EdCXCSaldoAnterior.Value;
        prTxReport1.Variables.ByName['CXCCARGOMES'].AsDouble := EdCXCCargoMes.Value;
        prTxReport1.Variables.ByName['CXCPAGOS'].AsDouble := EdCXCAbonoMes.Value;
        prTxReport1.Variables.ByName['CXCAPAGAR'].AsDouble := EdCXCApagar.Value;


        prTxReport1.Variables.ByName['SUELDO'].AsDouble := Sueldo;
        prTxReport1.Variables.ByName['ALMACEN'].AsDouble := edAlmacen.Value;
        prTxReport1.Variables.ByName['MERCADO'].AsDouble := edMercado.Value;

        if prTxReport1.PrepareReport then
           prTxReport1.PreviewPreparedReport(true);


end;

end.
