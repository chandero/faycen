unit UnitMantenimientoProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, Buttons, ExtCtrls, IBTable;

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
    IBTproveedor: TIBTable;
    procedure CmdPUCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure BtnlimpiarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure IBQproveedorAfterScroll(DataSet: TDataSet);
    procedure IBTproveedorAfterScroll(DataSet: TDataSet);
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
        end;
        frmPUC.Free;
end;

procedure TfrmMantenimientoProveedores.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQproveedor.Database := dmGeneral.IBDatabase1;
        IBQproveedor.Transaction := dmGeneral.IBTransaction1;
        IBTproveedor.Database := dmGeneral.IBDatabase1;
        IBTproveedor.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmMantenimientoProveedores.FormShow(Sender: TObject);
begin
        if (IBTproveedor.Transaction.InTransaction) then
          IBTproveedor.Transaction.Commit;
        IBTproveedor.Transaction.StartTransaction;
        IBTproveedor.Open;
end;

procedure TfrmMantenimientoProveedores.CmdCerrarClick(Sender: TObject);
begin
        IBTproveedor.Transaction.Commit;
        dmGeneral.Free;
        Close;
end;

procedure TfrmMantenimientoProveedores.BtnlimpiarClick(Sender: TObject);
begin
        IBTproveedor.Append;
end;

procedure TfrmMantenimientoProveedores.BitBtn1Click(Sender: TObject);
begin
        IBTproveedor.Post;
end;

procedure TfrmMantenimientoProveedores.BitBtn3Click(Sender: TObject);
begin
        if MessageDlg('Seguro de Eliminar el Proveedor?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
        begin
                IBTproveedor.Delete;
        end;
end;

procedure TfrmMantenimientoProveedores.IBQproveedorAfterScroll(
  DataSet: TDataSet);
begin
        IBTproveedor.Edit;
end;

procedure TfrmMantenimientoProveedores.IBTproveedorAfterScroll(
  DataSet: TDataSet);
begin
        IBTproveedor.Edit;
end;

end.
