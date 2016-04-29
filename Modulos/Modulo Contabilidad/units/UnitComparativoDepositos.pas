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
    DataSource1: TDataSource;
    CDSdatosID_PERSONA: TStringField;
    CDSdatosNOMBRE: TStringField;
    CDSdatosDEPOSITO: TCurrencyField;
    CDSdatosCONTABLE: TCurrencyField;
    CDSdatosMODALIDAD: TStringField;
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

uses DataSetToExcel;

procedure TfrmComparativoDepositos.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmComparativoDepositos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.IBTransacion1.Commit;
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

        IBQproducto.Database := dmGeneral.IBDatabase1;
        IBQproducto.Transaction := dmGeneral.IBTransaction1;


        IBQproducto.Open;
end;

end.
