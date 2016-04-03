unit UnitCausacionInteresesDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, UnitDmGeneral,
  ComCtrls, DBClient, Grids, DBGrids;

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
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCausacionInteresesDepositos: TfrmCausacionInteresesDepositos;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses Math, DateUtils, StrUtils, UnitGlobales, UnitGlobalesCol;

procedure TfrmCausacionInteresesDepositos.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcuentas.Database := dmGeneral.IBDatabase1;
        IBQproceso.Database := dmGeneral.IBDatabase1;


        IBQcuentas.Transaction := dmGeneral.IBTransaction1;
        IBQcuentas.Transaction := dmGeneral.IBTransaction1;

        
end;

procedure TfrmCausacionInteresesDepositos.btnProcesarClick(
  Sender: TObject);
  var
    CodigoCausacion, CodigoRecursos: String;
    Anho, Mes: Integer;
    FechaInicial, FechaFinal: TDateTime;
    Causacion:Currency;
begin
        btnProcesar.Enabled := False;

        Anho := YearOf(fFechaActual);
        Mes := CBMeses.ItemIndex + 1;
        TryEncodeDate(Anho, 01, 01, FechaInicial);
        TryEncodeDate(Anho, Mes, DaysInAMonth(Anho, Mes), FechaFinal);


        IBQcuentas.Close;
        IBQcuentas.SQL.Clear;
        IBQcuentas.SQL.Add('SELECT (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS ASOCIADO, m.ID_AGENCIA, m.ID_TIPO_CAPTACION, m.NUMERO_CUENTA, m.DIGITO_CUENTA, tc.DESCRIPCION, tc.CODIGO_CAUSACION, tc.CODIGO_GASTO,');
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
           pgb.Position := IBQcuentas.RecordCount;
           Application.ProcessMessages;

           Causacion :=  RoundTo(IBQcuentas.FieldByName('BASELIQUIDACION').AsCurrency * TasaNominalVencida(IBQcuentas.FieldByName('INTERES_EFECTIVO').AsFloat, 30),0);
           if (Causacion > 0) then
           begin
                CDScausacion.Insert;
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
           end;
         IBQcuentas.Next;
        end;

end;

end.
