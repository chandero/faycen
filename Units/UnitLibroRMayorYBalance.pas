unit UnitLibroRMayorYBalance;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DBClient, FR_Class, FR_DSet, FR_DBSet, frOLEExl, UnitdmGeneral;

type
  TfrmLibroMayorYBalance = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQPuc: TIBQuery;
    IBQSaldoAct: TIBQuery;
    IBQSaldoActDEBITO: TIBBCDField;
    IBQSaldoActCREDITO: TIBBCDField;
    IBQuery1: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaNIVEL: TIntegerField;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQTablaDEBITOANT: TCurrencyField;
    IBQTablaCREDITOANT: TCurrencyField;
    IBQTablaDEBITOMOV: TCurrencyField;
    IBQTablaCREDITOMOV: TCurrencyField;
    IBQTabla1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IBQTablaDEBITOACT: TCurrencyField;
    IBQTablaCREDITOACT: TCurrencyField;
    IBQTabla1DEBITOACT: TCurrencyField;
    IBQTabla1CREDITOACT: TCurrencyField;
    ReportBalance: TprTxReport;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    IBQTablaSALDOANT: TCurrencyField;
    IBQTablaSALDOACT: TCurrencyField;
    IBQTabla1SALDOACT: TCurrencyField;
    IBQTabla1SALDOANT: TCurrencyField;
    frOLEExcelExport1: TfrOLEExcelExport;
    IBQSaldoAnt: TIBQuery;
    IBBCDField1: TIBBCDField;
    IBBCDField2: TIBBCDField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroMayorYBalance: TfrmLibroMayorYBalance;
  dmGeneral: TDmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales,UnitPantallaProgreso;

procedure TfrmLibroMayorYBalance.CmdAceptarClick(Sender: TObject);
var
Tabla:String;
SaldoAnterior:Currency;
begin
       if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
       dmGeneral.IBTransaction1.StartTransaction;
       Empleado;
       CmdAceptar.Enabled := false;
       IBQTabla.EmptyDataSet;
       IBQTabla1.EmptyDataSet;
       with IBQPuc do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('"con$puc".ID_AGENCIA,');
          SQL.Add('"con$puc".NOMBRE,');
          SQL.Add('"con$puc".SALDOINICIAL,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("con$puc".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('("con$puc".ID_AGENCIA = :ID_AGENCIA) and');
          SQL.Add('("con$puc".NIVEL = :"NIVEL")');
          SQL.Add('order by "con$puc".CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NIVEL').AsInteger := 3;
          Open;
       end;

       with IBQSaldoAnt do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('SUM("con$saldoscuenta".DEBITO) AS DEBITO,');
          SQL.Add('SUM("con$saldoscuenta".CREDITO) AS CREDITO');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "con$saldoscuenta" ON ("con$puc".CODIGO = "con$saldoscuenta".CODIGO and "con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('"con$puc".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('("con$puc".CODIGO = :"CODIGO") and');
          SQL.Add('("con$saldoscuenta".MES < :"MES") ');
          SQL.Add('GROUP BY "con$puc".CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

       with IBQSaldoAct do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('"con$saldoscuenta".DEBITO,');
          SQL.Add('"con$saldoscuenta".CREDITO');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "con$saldoscuenta" ON ("con$puc".CODIGO = "con$saldoscuenta".CODIGO and "con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('"con$puc".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('("con$puc".CODIGO = :"CODIGO") and');
          SQL.Add('("con$saldoscuenta".MES = :"MES")');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

           with IBQTabla do
            begin
              While (not IBQPuc.Eof) do
               begin
                 Open;
                 Insert;
                 IBQSaldoAnt.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAnt.Open;
                 IBQSaldoAct.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.Open;
                 FieldByName('CODIGO').AsString := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,4);
                 FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
                 SaldoAnterior := IBQPuc.FieldByName('SALDOINICIAL').AsCurrency + IBQSaldoAnt.FieldByName('DEBITO').AsCurrency - IBQSaldoAnt.FieldByName('CREDITO').AsCurrency;
                 FieldByName('SALDOANT').AsCurrency := SaldoAnterior;
                 if SaldoAnterior > 0 then
                  begin
                    FieldByName('DEBITOANT').AsCurrency := SaldoAnterior;
                    FieldByName('CREDITOANT').AsCurrency := 0;
                  end
                 else
                  begin
                    FieldByName('DEBITOANT').AsCurrency := 0;
                    FieldByName('CREDITOANT').AsCurrency := -SaldoAnterior;
                  end;
                 FieldByName('DEBITOMOV').AsCurrency := IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
                 FieldByName('CREDITOMOV').AsCurrency := IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 FieldByName('SALDOACT').AsCurrency := SaldoAnterior + IBQSaldoAct.FieldByName('DEBITO').AsCurrency - IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 FieldByName('DESCRIPCION_AGENCIA').AsString := IBQPuc.FieldByName('DESCRIPCION_AGENCIA').AsString;
                 if (FieldByName('SALDOANT').AsCurrency = 0) and
                    (FieldByName('DEBITOMOV').AsCurrency = 0) and
                    (FieldByName('CREDITOMOV').AsCurrency = 0) and
                    (FieldByName('SALDOACT').AsCurrency = 0) then
                    Cancel
                 else
                    Post;
                 Close;

                 IBQSaldoAnt.Close;
                 IBQSaldoAct.Close;
                 IBQPuc.Next;

               end;
             end;

             IBQPuc.Close;
             IBQSaldoAct.Close;

             IBQTabla.Filter := 'CODIGO >=' + QuotedStr('8000');
             IBQTabla.Filtered := True;

             IBQTabla.Open;
             IBQTabla.First;

             while not IBQTabla.Eof do
             begin
                IBQTabla1.Open;
                IBQTabla1.Insert;
                IBQTabla1.FieldByName('CODIGO').AsString := IBQTabla.FieldByName('CODIGO').AsString;
                IBQTabla1.FieldByName('NOMBRE').AsString := IBQTabla.FieldByName('NOMBRE').AsString;
                IBQTabla1.FieldByName('SALDOANT').AsCurrency := IBQTabla.FieldByName('SALDOANT').AsCurrency;
                IBQTabla1.FieldByName('DEBITOANT').AsCurrency := IBQTabla.FieldByName('DEBITOANT').AsCurrency;
                IBQTabla1.FieldByName('CREDITOANT').AsCurrency := IBQTabla.FieldByName('CREDITOANT').AsCurrency;
                IBQTabla1.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency;
                IBQTabla1.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency;
                IBQTabla1.FieldByName('SALDOACT').AsCurrency := IBQTabla.FieldByName('SALDOACT').AsCurrency;
                IBQTabla1.Post;
                IBQTabla1.Close;

                IBQTabla.Next;
             end;
             IBQTabla.Close;

             IBQTabla.Filter := 'CODIGO <' + QuotedStr('8000');
             IBQTabla.Filtered := True;


               {
                ReportBalance.Variables.ByName['EMPRESA'].AsString := Empresa;
                ReportBalance.Variables.ByName['NIT'].AsString := Nit;
                ReportBalance.Variables.ByName['Mes'].AsString := CBMeses.Text;
                ReportBalance.Variables.ByName['AnoCorte'].AsString := EdAno.Text;
                if ReportBalance.PrepareReport then
                   ReportBalance.PreviewPreparedReport(True);
                }

                frReport1.LoadFromFile('ReportesCon\frLibroMayorBalance.frf');
                frReport1.Dictionary.Variables['MES'] := QuotedStr(CBMeses.Text);
                frReport1.Dictionary.Variables['ANHOCORTE'] := QuotedStr(EdAno.Text);
                if frReport1.PrepareReport then
                   frReport1.ShowPreparedReport;
                


end;

procedure TfrmLibroMayorYBalance.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLibroMayorYBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroMayorYBalance.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQSaldoAct.Database := dmGeneral.IBDatabase1;
        IBQSaldoAnt.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;

        IBQPuc.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAct.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAnt.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;

     with IBQPuc do begin
       if Transaction.InTransaction then
          Transaction.Rollback;
       Transaction.StartTransaction;
     end;
end;

end.
