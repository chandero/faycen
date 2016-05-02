unit UnitComparativoDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, Grids, DBGrids, DB,
  DBClient, UnitDmGeneral, IBCustomDataSet, IBQuery;

type
  TfrmComparativoDepositos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBLCBproducto: TDBLookupComboBox;
    Label2: TLabel;
    CBMeses: TComboBox;
    cmdProcesar: TBitBtn;
    Panel2: TPanel;
    cmdCerrar: TBitBtn;
    DBGdatos: TDBGrid;
    CDSdatos: TClientDataSet;
    DSdatos: TDataSource;
    btnAExcel: TBitBtn;
    IBQproducto: TIBQuery;
    DSproducto: TDataSource;
    CDSdatosID_PERSONA: TStringField;
    CDSdatosNOMBRE: TStringField;
    CDSdatosDEPOSITO: TCurrencyField;
    CDSdatosCONTABLE: TCurrencyField;
    CDSdatosMODALIDAD: TStringField;
    SD1: TSaveDialog;
    IBQpersona: TIBQuery;
    IBQdeposito: TIBQuery;
    IBQauxiliar: TIBQuery;
    CDSdatosDIFERENCIA: TCurrencyField;
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure CDSdatosCalcFields(DataSet: TDataSet);
    procedure CBMesesSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComparativoDepositos: TfrmComparativoDepositos;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses DateUtils,DataSetToExcel, UnitGlobales;

procedure TfrmComparativoDepositos.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmComparativoDepositos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.IBTransaction1.Commit;
        dmGeneral.Free;
end;

procedure TfrmComparativoDepositos.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSdatos.First;
           ExcelFile := TDataSetToExcel.Create(CDSdatos,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmComparativoDepositos.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQpersona.Database := dmGeneral.IBDatabase1;
        IBQpersona.Transaction := dmGeneral.IBTransaction1;
        IBQproducto.Database := dmGeneral.IBDatabase1;
        IBQproducto.Transaction := dmGeneral.IBTransaction1;
        IBQdeposito.Database := dmGeneral.IBDatabase1;
        IBQdeposito.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;


        IBQproducto.Open;
end;

procedure TfrmComparativoDepositos.cmdProcesarClick(Sender: TObject);
var
  Anho: Integer;
  Mes : Integer;
  FechaInicial: TDateTime;
  FechaFinal: TDateTime;

begin

        Anho := YearOf(fFechaActual);
        Mes := CBMeses.ItemIndex + 1;
        TryEncodeDate(Anho,01,01, FechaInicial);
        TryEncodeDate(Anho,Mes, DaysInAMonth(Anho, Mes), FechaFinal);

        IBQpersona.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQproducto.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQpersona.Open;
        CDSdatos.Open;
        CDSdatos.EmptyDataSet;
        while not IBQpersona.Eof do begin
            // buscar saldos de la persona
            IBQdeposito.Close;
            IBQdeposito.ParamByName('ID_AGENCIA').AsInteger := IBQpersona.FieldByName('ID_AGENCIA').AsInteger;
            IBQdeposito.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQpersona.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQdeposito.ParamByName('NUMERO_CUENTA').AsInteger := IBQpersona.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQdeposito.ParamByName('DIGITO_CUENTA').AsInteger := IBQpersona.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQdeposito.ParamByName('ANHO').AsInteger := Anho;
            IBQdeposito.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
            IBQdeposito.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
            IBQdeposito.Open;

            IBQauxiliar.Close;
            IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
            IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
            IBQauxiliar.ParamByName('CODIGO').AsString := IBQpersona.FieldByName('CODIGO_CONTABLE').AsString;
            IBQauxiliar.ParamByName('ANHO').AsInteger := Anho;
            IBQauxiliar.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
            IBQauxiliar.ParamByName('FECHA_FINAL').AsDate := FechaFinal;

            IBQauxiliar.Open;

            CDSdatos.Insert;
            CDSdatosID_PERSONA.Value := IBQpersona.FieldByName('ID_PERSONA').AsString;
            CDSdatosNOMBRE.Value := IBQpersona.FieldByName('NOMBRE').AsString;
            CDSdatosDEPOSITO.Value := Abs(IBQdeposito.FieldByName('SALDO_ACTUAL').AsCurrency);
            CDSdatosCONTABLE.Value := Abs(IBQauxiliar.FieldByName('SALDO_ACTUAL').AsCurrency);
            CDSdatos.Post;

            IBQpersona.Next;

        end;
end;

procedure TfrmComparativoDepositos.CDSdatosCalcFields(DataSet: TDataSet);
begin
        CDSdatosDIFERENCIA.Value := Abs(CDSdatosDEPOSITO.Value) - Abs(CDSdatosCONTABLE.Value);
end;

procedure TfrmComparativoDepositos.CBMesesSelect(Sender: TObject);
begin
        if cbmeses.ItemIndex > -1 then cmdProcesar.Enabled := True;
end;

end.
