unit UnitLibroCajaDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pr_Common, pr_TxClasses, IBCustomDataSet, IBQuery, UnitdmGeneral,
  StdCtrls, Buttons, Mask, ExtCtrls, FR_Class, frOLEExl, FR_DSet, FR_DBSet;

type
  TfrmLibroRCajaDiario = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQTemp: TIBQuery;
    IBQTemp1: TIBQuery;
    Reporte: TprTxReport;
    frReport1: TfrReport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroRCajaDiario: TfrmLibroRCajaDiario;
  dmGeneral: TdmGeneral;
implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmLibroRCajaDiario.CmdAceptarClick(Sender: TObject);
begin
        with IBQTemp do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
        end;

        with IBQTemp1 do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
        end;

       {
        Reporte.Variables.ByName['MES'].AsString := CBMeses.Text;
        Reporte.Variables.ByName['ANOCORTE'].AsString := EdAno.Text;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
        }

        frReport1.LoadFromFile('ReportesCon\frLibroCajaDiario.frf');
        frReport1.Dictionary.Variables['MES'] := QuotedStr(CBMeses.Text);
        frReport1.Dictionary.Variables['ANHOCORTE'] := EdAno.Text;
        if frReport1.PrepareReport then
          frReport1.ShowPreparedReport;

end;

procedure TfrmLibroRCajaDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroRCajaDiario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        entertabs(Key,Self);
end;

procedure TfrmLibroRCajaDiario.FormCreate(Sender: TObject);
begin
      dmGeneral := TdmGeneral.Create(self);
      dmGeneral.getConnected;

      IBQTemp.Database := dmGeneral.IBDatabase1;
      IBQTemp1.Database := dmGeneral.IBDatabase1;

      IBQTemp.Transaction := dmGeneral.IBTransaction1;
      IBQTemp1.Transaction := dmGeneral.IBTransaction1;

      with IBQTemp do begin
        if Transaction.InTransaction then
           Transaction.Rollback;
        Transaction.StartTransaction;
      end;
      
end;

end.
