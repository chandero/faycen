unit UnitConsultaComprobantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, UnitDmGeneral,
  Buttons, pr_Classes, pr_Common, pr_TxClasses, Provider, DBClient;

type
  TfrmConsultaComprobantes = class(TForm)
    Gtipocomprobante: TDBGrid;
    IBQtipocomprobante: TIBQuery;
    IBQcomprobante: TIBQuery;
    IBAuxiliar: TIBQuery;
    Label1: TLabel;
    DStipocomprobante: TDataSource;
    DScomprobante: TDataSource;
    DSauxiliar: TDataSource;
    Gcomprobante: TDBGrid;
    Gauxiliar: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    IBQcomprobanteID_COMPROBANTE: TIntegerField;
    IBQcomprobanteID_AGENCIA: TSmallintField;
    IBQcomprobanteTIPO_COMPROBANTE: TIBStringField;
    IBQcomprobanteFECHADIA: TDateField;
    IBQcomprobanteDESCRIPCION: TMemoField;
    IBQcomprobanteTOTAL_DEBITO: TIBBCDField;
    IBQcomprobanteTOTAL_CREDITO: TIBBCDField;
    IBQcomprobanteESTADO: TIBStringField;
    IBQcomprobanteIMPRESO: TSmallintField;
    IBQcomprobanteANULACION: TMemoField;
    IBQcomprobanteID_EMPLEADO: TIBStringField;
    CmdCerrar: TBitBtn;
    Btnreporte: TBitBtn;
    BitBtn1: TBitBtn;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarID_CUENTA: TIBStringField;
    IBAuxiliarID_COLOCACION: TIBStringField;
    IBAuxiliarID_IDENTIFICACION: TSmallintField;
    IBAuxiliarID_PERSONA: TIBStringField;
    IBAuxiliarPRIMER_APELLIDO1: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO1: TIBStringField;
    IBAuxiliarNOMBRE1: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    IBAuxiliarASOCIADO: TIBStringField;
    Report1: TprTxReport;
    prReport1: TprReport;
    IBAuxiliar1: TIBQuery;
    CDSauxiliar: TClientDataSet;
    DSPauxiliar: TDataSetProvider;
    CDSauxiliarID_COMPROBANTE: TIntegerField;
    CDSauxiliarDESCRIPCION_AGENCIA: TStringField;
    CDSauxiliarTIPO: TStringField;
    CDSauxiliarFECHADIA: TDateField;
    CDSauxiliarDESCRIPCION: TMemoField;
    CDSauxiliarPRIMER_APELLIDO: TStringField;
    CDSauxiliarSEGUNDO_APELLIDO: TStringField;
    CDSauxiliarNOMBRE: TStringField;
    CDSauxiliarCODIGO: TStringField;
    CDSauxiliarCUENTA: TStringField;
    CDSauxiliarID_CUENTA: TStringField;
    CDSauxiliarID_COLOCACION: TStringField;
    CDSauxiliarID_IDENTIFICACION: TSmallintField;
    CDSauxiliarID_PERSONA: TStringField;
    CDSauxiliarPRIMER_APELLIDO1: TStringField;
    CDSauxiliarSEGUNDO_APELLIDO1: TStringField;
    CDSauxiliarNOMBRE1: TStringField;
    CDSauxiliarDEBITO: TBCDField;
    CDSauxiliarCREDITO: TBCDField;
    CDSauxiliarASOCIADO: TStringField;
    procedure IBQtipocomprobanteAfterScroll(DataSet: TDataSet);
    procedure IBQcomprobanteAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQcomprobanteDESCRIPCIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnreporteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaComprobantes: TfrmConsultaComprobantes;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmConsultaComprobantes.IBQtipocomprobanteAfterScroll(
  DataSet: TDataSet);
begin

        IBQcomprobante.Close;
        IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsString := DataSet.FieldByName('ID').AsString;
        IBQcomprobante.Open;

end;

procedure TfrmConsultaComprobantes.IBQcomprobanteAfterScroll(
  DataSet: TDataSet);
begin

        IBAuxiliar.Close;
        IBAuxiliar.ParamByName('TIPO_COMPROBANTE').AsString := DataSet.FieldByName('TIPO_COMPROBANTE').AsString;
        IBAuxiliar.ParamByName('ID_COMPROBANTE').AsInteger := DataSet.FieldByName('ID_COMPROBANTE').AsInteger;
        IBAuxiliar.Open;

end;

procedure TfrmConsultaComprobantes.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQtipocomprobante.Database := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar1.Database := dmGeneral.IBDatabase1;

        IBQtipocomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar1.Transaction := dmGeneral.IBTransaction1;

end;

procedure TfrmConsultaComprobantes.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IBQtipocomprobante.Open;
end;

procedure TfrmConsultaComprobantes.IBQcomprobanteDESCRIPCIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmConsultaComprobantes.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaComprobantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBAuxiliar.Close;
        IBQcomprobante.Close;
        IBQtipocomprobante.Close;

        dmGeneral.Free;
end;

procedure TfrmConsultaComprobantes.BtnreporteClick(Sender: TObject);
begin
          Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report1.Variables.ByName['NIT'].AsString := Nit;
          if Report1.PrepareReport then
            Report1.PreviewPreparedReport(True);
end;

procedure TfrmConsultaComprobantes.BitBtn1Click(Sender: TObject);
begin
          prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
          prReport1.Variables.ByName['NIT'].AsString := Nit;
          prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
          if prReport1.PrepareReport then
            prReport1.PreviewPreparedReport(True);
end;

end.
