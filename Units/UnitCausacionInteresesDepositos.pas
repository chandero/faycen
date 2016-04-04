unit UnitCausacionInteresesDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, UnitDmGeneral,
  ComCtrls, DBClient, Grids, DBGrids, IBDatabase, IBSQL, ExtCtrls;

type
  TfrmCausacionInteresesDepositos = class(TForm)
    Label1: TLabel;
    CBMeses: TComboBox;
    btnProcesar: TBitBtn;
    IBQcuentas: TIBQuery;
    IBQproceso: TIBQuery;
    pgb: TProgressBar;
    Label2: TLabel;
    CDScausacion: TClientDataSet;
    CDScausacionID_AGENCIA: TIntegerField;
    CDScausacionID_TIPO_CAPTACION: TIntegerField;
    CDScausacionNUMERO_CUENTA: TIntegerField;
    CDScausacionDIGITO_CUENTA: TIntegerField;
    CDScausacionASOCIADO: TStringField;
    CDScausacionSALDO_BASE: TCurrencyField;
    CDScausacionTASAEFECTIVA: TFloatField;
    CDScausacionDIAS: TIntegerField;
    CDScausacionANHO: TIntegerField;
    CDScausacionMES: TIntegerField;
    CDScausacionCAUSACION_MENSUAL: TCurrencyField;
    CDScausacionRETEFUENTE_MENSUAL: TCurrencyField;
    CDScausacionNETO_MENSUAL: TCurrencyField;
    CDScausacionCODIGO_CAUSACION: TStringField;
    CDScausacionCODIGO_GASTO: TStringField;
    DBGrid1: TDBGrid;
    DSgrid: TDataSource;
    CDScausacionTIPO_CAPTACION: TStringField;
    edAsociado: TEdit;
    CDScontab: TClientDataSet;
    CDScontabCODIGO: TStringField;
    CDScontabDEBITO: TCurrencyField;
    CDScontabCREDITO: TCurrencyField;
    IBQcomprobante: TIBQuery;
    IBQauxiliar: TIBQuery;
    IBSQLcomprobante: TIBSQL;
    IBTcomprobante: TIBTransaction;
    Panel1: TPanel;
    btnAplicar: TBitBtn;
    CmdCerrar: TBitBtn;
    CDScausacionID_IDENTIFICACION: TIntegerField;
    CDScausacionID_PERSONA: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCausacionInteresesDepositos: TfrmCausacionInteresesDepositos;
  dmGeneral: TdmGeneral;
  FechaInicial, FechaFinal: TDateTime;
  Anho, Mes: Integer;

implementation

{$R *.dfm}

uses Math, DateUtils, StrUtils, UnitGlobales, UnitGlobalesCol;

procedure TfrmCausacionInteresesDepositos.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcuentas.Database := dmGeneral.IBDatabase1;
        IBQproceso.Database := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBSQLcomprobante.Database := dmGeneral.IBDatabase1;
        IBTcomprobante.DefaultDatabase := dmGeneral.IBDatabase1;


        IBQcuentas.Transaction := dmGeneral.IBTransaction1;
        IBQcuentas.Transaction := dmGeneral.IBTransaction1;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBSQLcomprobante.Transaction := IBTcomprobante;

        
end;

procedure TfrmCausacionInteresesDepositos.btnProcesarClick(
  Sender: TObject);
  var
    CodigoCausacion, CodigoRecursos: String;
    Causacion:Currency;

begin
        btnProcesar.Enabled := False;
        Application.ProcessMessages;

        Anho := YearOf(fFechaActual);
        Mes := CBMeses.ItemIndex + 1;
        TryEncodeDate(Anho, 01, 01, FechaInicial);
        TryEncodeDate(Anho, Mes, DaysInAMonth(Anho, Mes), FechaFinal);


        IBQcuentas.Close;
        IBQcuentas.SQL.Clear;
        IBQcuentas.SQL.Add('SELECT p.ID_IDENTIFICACION, p.ID_PERSONA, (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS ASOCIADO, m.ID_AGENCIA, m.ID_TIPO_CAPTACION, m.NUMERO_CUENTA, m.DIGITO_CUENTA, tc.DESCRIPCION, tc.CODIGO_CAUSACION, tc.CODIGO_GASTO,');
        IBQcuentas.SQL.Add(' (SELECT SALDO_ACTUAL FROM SALDO_ACTUAL(m.ID_AGENCIA, m.ID_TIPO_CAPTACION, m.NUMERO_CUENTA, m.DIGITO_CUENTA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL)) AS BASELIQUIDACION, tc.INTERES_EFECTIVO');
        IBQcuentas.SQL.Add('FROM "cap$maestro" m');
        IBQcuentas.SQL.Add('INNER JOIN "cap$maestrotitular" t ON m.ID_AGENCIA = t.ID_AGENCIA and m.ID_TIPO_CAPTACION = t.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = t.NUMERO_CUENTA and m.DIGITO_CUENTA = t.DIGITO_CUENTA');
        IBQcuentas.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = t.ID_IDENTIFICACION and p.ID_PERSONA = t.ID_PERSONA');
        IBQcuentas.SQL.Add('INNER JOIN "cap$tipocaptacion" tc ON m.ID_TIPO_CAPTACION = tc.ID_TIPO_CAPTACION');
        IBQcuentas.SQL.Add('WHERE tc.PAGA_INTERES = 1');
        IBQcuentas.SQL.Add('ORDER BY t.ID_IDENTIFICACION ASC, t.ID_PERSONA ASC');
        IBQcuentas.ParamByName('ANHO').AsInteger := Anho;
        IBQcuentas.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
        IBQcuentas.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
        IBQcuentas.Open;
        IBQcuentas.Last;
        IBQcuentas.First;

        pgb.Min := 0;
        pgb.Max := IBQcuentas.RecordCount;
        pgb.Position := 0;
        CDScausacion.EmptyDataSet;

        while not  IBQcuentas.Eof do
        begin
           pgb.Position := IBQcuentas.RecNo;
           edAsociado.Text := IBQcuentas.FieldByName('ASOCIADO').AsString;

           Application.ProcessMessages;

           Causacion :=  RoundTo((IBQcuentas.FieldByName('BASELIQUIDACION').AsCurrency * TasaNominalVencida(IBQcuentas.FieldByName('INTERES_EFECTIVO').AsFloat, 30))*30/(360*100),0);
           if (Causacion > 0) then
           begin
                CDScausacion.Insert;
                CDScausacionID_IDENTIFICACION.Value := IBQcuentas.FieldByName('ID_IDENTIFICACION').AsInteger;
                CDScausacionID_PERSONA.Value := StrToInt(IBQcuentas.FieldByName('ID_PERSONA').AsString);
                CDScausacionID_AGENCIA.Value := IBQcuentas.FieldByName('ID_AGENCIA').AsInteger;
                CDScausacionID_TIPO_CAPTACION.Value := IBQcuentas.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                CDScausacionNUMERO_CUENTA.Value := IBQcuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                CDScausacionDIGITO_CUENTA.Value := IBQcuentas.FieldByName('DIGITO_CUENTA').AsInteger;
                CDScausacionASOCIADO.Value := IBQcuentas.FieldByName('ASOCIADO').AsString;
                CDScausacionSALDO_BASE.Value := IBQcuentas.FieldByName('BASELIQUIDACION').AsCurrency;
                CDScausacionTASAEFECTIVA.Value := IBQcuentas.FieldByName('INTERES_EFECTIVO').AsFloat;
                CDScausacionDIAS.Value := 30;
                CDScausacionANHO.Value := Anho;
                CDScausacionMES.Value := Mes;
                CDScausacionCAUSACION_MENSUAL.Value := Causacion;
                CDScausacionRETEFUENTE_MENSUAL.Value := 0;
                CDScausacionNETO_MENSUAL.Value := Causacion;
                CDScausacionCODIGO_CAUSACION.Value := IBQcuentas.FieldByName('CODIGO_CAUSACION').AsString;
                CDScausacionCODIGO_GASTO.Value := IBQcuentas.FieldByName('CODIGO_GASTO').AsString;
                CDScausacionTIPO_CAPTACION.Value := IBQcuentas.FieldByName('DESCRIPCION').AsString;
                CDScausacion.Post;

                CDScontab.Filter := 'CODIGO = ' + QuotedStr(IBQcuentas.FieldByName('CODIGO_GASTO').AsString);
                CDScontab.Filtered := True;
                if (CDScontab.RecordCount > 0) then
                begin
                    CDScontab.Edit;
                    CDScontabDEBITO.Value := CDScontabDEBITO.Value + Causacion;
                    CDScontabCREDITO.Value := 0;
                    CDScontab.Post;
                end
                else
                begin
                    CDScontab.Insert;
                    CDScontabCODIGO.Value := IBQcuentas.FieldByName('CODIGO_GASTO').AsString;
                    CDScontabDEBITO.Value := Causacion;
                    CDScontabCREDITO.Value := 0;
                    CDScontab.Post;
                end;

           end;
         IBQcuentas.Next;
        end;

        btnAplicar.Enabled := True;

end;

procedure TfrmCausacionInteresesDepositos.btnAplicarClick(Sender: TObject);
var
    Consec: Integer;
    TotalComprobante : Currency;
begin
        btnAplicar.Enabled := False;
        Application.ProcessMessages;

        // Contabilizar
        TotalComprobante := 0;

        Consec := ObtenerConsecutivo(IBSQLcomprobante, 17);
        // IBQproceso inserstar a tabla de intereses causados
        with IBQproceso do
        begin
           SQL.Clear;
           SQL.Add('INSERT INTO "cap$causacionintereses" VALUES(');
           SQL.Add(':ID_AGENCIA,');
           SQL.Add(':ID_TIPO_CAPTACION,');
           SQL.Add(':NUMERO_CUENTA,');
           SQL.Add(':DIGITO_CUENTA,');
           SQL.Add(':SALDO_BASE,');
           SQL.Add(':TASA_EFECTIVA,');
           SQL.Add(':DIAS,');
           SQL.Add(':ANO,');
           SQL.Add(':MES,');
           SQL.Add(':CAUSACION_MENSUAL');
           SQL.Add(')');
        end;
        // IBQcomprobante
        with IBQcomprobante do
        begin
         sql.Clear;
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');
        end;

        // IBQauxiliar
        with IBQauxiliar do
        begin
         SQL.Clear;
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
        end;

        CDScausacion.First;
        while not CDScausacion.Eof do
        begin
              IBQproceso.Close;
              IBQproceso.ParamByName('ID_AGENCIA').AsInteger := CDScausacionID_AGENCIA.Value;
              IBQproceso.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDScausacionID_TIPO_CAPTACION.Value;
              IBQproceso.ParamByName('NUMERO_CUENTA').AsInteger := CDScausacionNUMERO_CUENTA.Value;
              IBQproceso.ParamByName('DIGITO_CUENTA').AsInteger := CDScausacionDIGITO_CUENTA.Value;
              IBQproceso.ParamByName('SALDO_BASE').AsCurrency := CDScausacionSALDO_BASE.Value;
              IBQproceso.ParamByName('TASA_EFECTIVA').AsFloat := CDScausacionTASAEFECTIVA.Value;
              IBQproceso.ParamByName('DIAS').AsInteger := CDScausacionDIAS.Value;
              IBQproceso.ParamByName('ANO').AsInteger :=  CDScausacionANHO.Value;
              IBQproceso.ParamByName('MES').AsInteger := CDScausacionMES.Value;
              IBQproceso.ParamByName('CAUSACION_MENSUAL').AsCurrency := CDScausacionCAUSACION_MENSUAL.Value;
              IBQproceso.ExecSQL;

              IBQauxiliar.Close;
              IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := Consec;
              IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := CDScausacionID_AGENCIA.Value;
              IBQauxiliar.ParamByName('FECHA').AsDate := FechaFinal;
              IBQauxiliar.ParamByName('CODIGO').AsString := CDScausacionCODIGO_CAUSACION.Value;
              IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
              IBQauxiliar.ParamByName('CREDITO').AsCurrency := CDScausacionCAUSACION_MENSUAL.Value;
              IBQauxiliar.ParamByName('ID_CUENTA').AsInteger := CDScausacionNUMERO_CUENTA.Value;
              IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
              IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := CDScausacionID_IDENTIFICACION.Value;
              IBQauxiliar.ParamByname('ID_PERSONA').AsString := IntToStr(CDScausacionID_PERSONA.Value);
              IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
              IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
              IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
              IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger := 17;
              IBQauxiliar.ExecSQL;

              TotalComprobante := TotalComprobante + CDScausacionCAUSACION_MENSUAL.Value;

              CDScausacion.Next;
        end;

        CDScontab.Filtered := False;
        CDScontab.First;

        while not CDScontab.Eof do
        begin
              IBQauxiliar.Close;
              IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := Consec;
              IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBQauxiliar.ParamByName('FECHA').AsDate := FechaFinal;
              IBQauxiliar.ParamByName('CODIGO').AsString := CDScontabCODIGO.Value;
              IBQauxiliar.ParamByName('DEBITO').AsCurrency := CDScontabDEBITO.Value;
              IBQauxiliar.ParamByName('CREDITO').AsCurrency := CDScontabCREDITO.Value;
              IBQauxiliar.ParamByName('ID_CUENTA').AsInteger := 0;
              IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
              IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              IBQauxiliar.ParamByname('ID_PERSONA').Clear;
              IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
              IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
              IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
              IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger := 17;
              IBQauxiliar.ExecSQL;

              CDScontab.Next;
        end;

        IBQcomprobante.Close;
        IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger := Consec;
        IBQcomprobante.ParamByName('FECHADIA').AsDate := FechaFinal;
        IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsInteger := 17;
        IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQcomprobante.ParamByName('DESCRIPCION').AsString := 'CAUSACION DE INTERESES DE DEPOSITO, PERIODO : ' + CBmeses.Text + ', Año: ' + IntToStr(Anho);
        IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency := TotalComprobante;
        IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency := TotalComprobante;
        IBQcomprobante.ParamByName('ESTADO').AsString := 'O';
        IBQcomprobante.ParamByName('IMPRESO').AsInteger := 0;
        IBQcomprobante.ParamByName('ANULACION').Clear;
        IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
        IBQcomprobante.ExecSQL;

        dmGeneral.IBTransaction1.Commit;

        ShowMessage('Causación Aplicada con Exito!!');
end;

procedure TfrmCausacionInteresesDepositos.CmdCerrarClick(Sender: TObject);
begin
        dmGeneral.Free;
        Close;
end;

procedure TfrmCausacionInteresesDepositos.DBGrid1TitleClick(
  Column: TColumn);
begin
        case Column.Index of
        0: CDScausacion.IndexName := 'CDScausacionIndex1';
        1: CDScausacion.IndexName := 'CDScausacionIndex2';
        3: CDScausacion.IndexName := 'CDScausacionIndex3';
        end;
end;

end.
