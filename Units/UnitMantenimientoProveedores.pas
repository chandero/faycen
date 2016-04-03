unit UnitMantenimientoProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, Buttons, ExtCtrls;

type
  TfrmMantenimientoProveedores = class(TForm)
    DBgrid: TDBGrid;
    DSgrid: TDataSource;
    EdId: TDBEdit;
    EdDescripcion: TDBEdit;
    EdCodigo: TDBEdit;
    CmdPUC: TSpeedButton;
    EdComision: TDBEdit;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    IBQproveedor: TIBQuery;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Btnlimpiar: TBitBtn;
    procedure CmdPUCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure BtnlimpiarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure IBQproveedorAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantenimientoProveedores: TfrmMantenimientoProveedores;

implementation

{$R *.dfm}

uses Unit_Mantenimientopuc, UnitDmGeneral;

procedure TfrmMantenimientoProveedores.CmdPUCClick(Sender: TObject);
var
   frmPUC: TfrmMantenimientopuc;
begin
        frmPUC := TfrmMantenimientopuc.Create(self);
        frmPUC.CodigoSeleccionado := EdCodigo.Text;
        frmPUC.btnSeleccionar.Enabled := true;
        if ( frmPUC.ShowModal = mrOK ) then
        begin
            frmPUC.btnSeleccionar.Enabled := false;
            EdCodigo.Text := frmPUC.CodigoSeleccionado;
            dmGeneral.IBTransaction1.Commit;
            dmGeneral.IBTransaction1.StartTransaction;
        end;
        frmPUC.Free;
end;

procedure TfrmMantenimientoProveedores.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQproveedor.Database := dmGeneral.IBDatabase1;
        IBQproveedor.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmMantenimientoProveedores.FormShow(Sender: TObject);
begin
        if (IBQproveedor.Transaction.InTransaction) then
          IBQproveedor.Transaction.Commit;
        IBQproveedor.Transaction.StartTransaction;
        IBQproveedor.Open;
end;

procedure TfrmMantenimientoProveedores.CmdCerrarClick(Sender: TObject);
begin
        IBQproveedor.Transaction.Commit;
        dmGeneral.Free;
        Close;
end;

procedure TfrmMantenimientoProveedores.BtnlimpiarClick(Sender: TObject);
begin
        IBQproveedor.Append;
end;

procedure TfrmMantenimientoProveedores.BitBtn1Click(Sender: TObject);
begin
        IBQproveedor.Post;
end;

procedure TfrmMantenimientoProveedores.BitBtn3Click(Sender: TObject);
begin
        if MessageDlg('Seguro de Eliminar el Proveedor?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
        begin
                IBQproveedor.Delete;
        end;
end;

procedure TfrmMantenimientoProveedores.IBQproveedorAfterScroll(
  DataSet: TDataSet);
begin
        IBQproveedor.Edit;
end;

end.
