unit UnitComparativoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBQuery, DB, DBClient, Grids, DBGrids,
  StdCtrls, Buttons, DBCtrls, ExtCtrls, UnitDmGeneral;

type
  TfrmComparativoCartera = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBLCBproducto: TDBLookupComboBox;
    CBMeses: TComboBox;
    cmdProcesar: TBitBtn;
    Panel2: TPanel;
    cmdCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    DBGdatos: TDBGrid;
    CDSdatos: TClientDataSet;
    CDSdatosID_PERSONA: TStringField;
    CDSdatosNOMBRE: TStringField;
    CDSdatosMODALIDAD: TStringField;
    CDSdatosCARTERA: TCurrencyField;
    CDSdatosCONTABLE: TCurrencyField;
    CDSdatosDIFERENCIA: TCurrencyField;
    DSdatos: TDataSource;
    IBQproducto: TIBQuery;
    DSproducto: TDataSource;
    SD1: TSaveDialog;
    IBQpersona: TIBQuery;
    IBQcartera: TIBQuery;
    IBQauxiliar: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure CDSdatosCalcFields(DataSet: TDataSet);
    procedure CBMesesSelect(Sender: TObject);
    procedure DBGdatosTitleClick(Column: TColumn);
    procedure cmdProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComparativoCartera: TfrmComparativoCartera;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses DateUtils,DataSetToExcel, UnitGlobales;

procedure TfrmComparativoCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.IBTransaction1.Commit;
        dmGeneral.Free;
end;

procedure TfrmComparativoCartera.btnAExcelClick(Sender: TObject);
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

procedure TfrmComparativoCartera.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQpersona.Database := dmGeneral.IBDatabase1;
        IBQpersona.Transaction := dmGeneral.IBTransaction1;
        IBQproducto.Database := dmGeneral.IBDatabase1;
        IBQproducto.Transaction := dmGeneral.IBTransaction1;
        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQcartera.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;


        IBQproducto.Open;
        IBQproducto.Last;
        IBQproducto.First;

        DBLCBproducto.KeyValue := -1;
end;

procedure TfrmComparativoCartera.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmComparativoCartera.CDSdatosCalcFields(DataSet: TDataSet);
begin
        CDSdatosDIFERENCIA.Value := Abs(CDSdatosCARTERA.Value) - Abs(CDSdatosCONTABLE.Value);
end;

procedure TfrmComparativoCartera.CBMesesSelect(Sender: TObject);
begin
        if cbmeses.ItemIndex > -1 then cmdProcesar.Enabled := True;
end;

procedure TfrmComparativoCartera.DBGdatosTitleClick(Column: TColumn);
begin
        case Column.Index of
        0: CDSdatos.IndexName := 'IndexID_PERSONA';
        1: CDSdatos.IndexName := 'IndexNOMBRE';
        2: CDSdatos.IndexName := 'IndexMODALIDAD';
        end;
end;

procedure TfrmComparativoCartera.cmdProcesarClick(Sender: TObject);
var
  Anho: Integer;
  Mes : Integer;
  FechaInicial: TDateTime;
  FechaFinal: TDateTime;
  Saldo_Actual : Currency;
begin

        Anho := YearOf(fFechaActual);
        Mes := CBMeses.ItemIndex + 1;
        TryEncodeDate(Anho,01,01, FechaInicial);
        TryEncodeDate(Anho,Mes, DaysInAMonth(Anho, Mes), FechaFinal);

        IBQpersona.Close;
        IBQpersona.SQL.Clear;
        IBQpersona.SQL.Add('SELECT DISTINCT');
        IBQpersona.SQL.Add('c.ID_IDENTIFICACION,');
        IBQpersona.SQL.Add('c.ID_PERSONA,');
        IBQpersona.SQL.Add('p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO  AS NOMBRE,');
        IBQpersona.SQL.Add('b.COD_CAPITAL_CP,');
        IBQpersona.SQL.Add('l.DESCRIPCION_LINEA AS MODALIDAD,');
        IBQpersona.SQL.Add('c.ID_LINEA');
        IBQpersona.SQL.Add('FROM "col$colocacion" c');
        IBQpersona.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = c.ID_IDENTIFICACION and p.ID_PERSONA = c.ID_PERSONA');
        IBQpersona.SQL.Add('INNER JOIN "col$lineas" l ON c.ID_LINEA = l.ID_LINEA');
        IBQpersona.SQL.Add('INNER JOIN "col$codigospuc" b ON b.ID_LINEA = c.ID_LINEA and b.ID_GARANTIA = c.ID_GARANTIA');
        if (DBLCBproducto.KeyValue > 0) then
        begin
                IBQpersona.SQL.Add('WHERE c.ID_LINEA = :ID_LINEA');
                IBQpersona.ParamByName('ID_LINEA').AsInteger := IBQproducto.FieldByName('ID_LINEA').AsInteger;
        end;
        IBQpersona.SQL.Add('ORDER BY c.ID_LINEA, p.ID_IDENTIFICACION, p.ID_PERSONA');
        IBQpersona.Open;
        CDSdatos.Open;
        CDSdatos.EmptyDataSet;
        while not IBQpersona.Eof do begin

            Application.ProcessMessages;
            // buscar saldos de la persona
            IBQcartera.Close;
            IBQcartera.ParamByName('ID_LINEA').AsInteger := IBQpersona.FieldByName('ID_LINEA').AsInteger;
            IBQcartera.ParamByName('ID_IDENTIFICACION').AsInteger := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
            IBQcartera.ParamByName('ID_PERSONA').AsInteger := IBQpersona.FieldByName('ID_PERSONA').AsInteger;
            IBQcartera.ParamByName('ANHO').AsInteger := Anho;
            IBQcartera.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
            IBQcartera.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
            IBQcartera.Open;

            IBQauxiliar.Close;
            IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
            IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
            IBQauxiliar.ParamByName('CODIGO').AsString := IBQpersona.FieldByName('COD_CAPITAL_CP').AsString;
            IBQauxiliar.ParamByName('ANHO').AsInteger := Anho;
            IBQauxiliar.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
            IBQauxiliar.ParamByName('FECHA_FINAL').AsDate := FechaFinal;

            IBQauxiliar.Open;

            CDSdatos.Insert;
            CDSdatosID_PERSONA.Value := IBQpersona.FieldByName('ID_PERSONA').AsString;
            CDSdatosNOMBRE.Value := IBQpersona.FieldByName('NOMBRE').AsString;
            CDSdatosMODALIDAD.Value := IBQpersona.FieldByName('MODALIDAD').AsString;
            CDSdatosCARTERA.Value := Abs(IBQcartera.FieldByName('SALDO_ACTUAL').AsCurrency);
            CDSdatosCONTABLE.Value := Abs(IBQauxiliar.FieldByName('SALDO_ACTUAL').AsCurrency);
            CDSdatos.Post;

            IBQpersona.Next;

        end;
end;

end.
