unit UnitMantenimientoDescuentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, UnitDmGeneral,
  DBClient, Provider, StdCtrls, Buttons;

type
  TfrmMantenimientoDescuentos = class(TForm)
    grPersona: TDBGrid;
    panel1: TPanel;
    dsGridPersona: TDataSource;
    IBQPersona: TIBQuery;
    grProducto: TDBGrid;
    dsProducto: TDataSource;
    cdsProducto: TClientDataSet;
    IBQProducto: TIBQuery;
    cdsPersona: TClientDataSet;
    dsPersona: TDataSource;
    dsGridProducto: TDataSource;
    cdsProductoID_PRODUCTO: TIntegerField;
    cdsProductoDESCRIPCION_PRODUCTO: TStringField;
    cdsProductoVALOR_DESCUENTO: TCurrencyField;
    dspPersona: TDataSetProvider;
    btnCerrar: TBitBtn;
    cdsProductoNUMERO: TStringField;
    Panel2: TPanel;
    btnAplicar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grPersonaTitleClick(Column: TColumn);
    procedure btnCerrarClick(Sender: TObject);
    procedure cdsPersonaAfterScroll(DataSet: TDataSet);
    procedure cdsProductoAfterScroll(DataSet: TDataSet);
    procedure grProductoCellClick(Column: TColumn);
    procedure btnAplicarClick(Sender: TObject);
    procedure cdsProductoAfterEdit(DataSet: TDataSet);
    procedure cdsPersonaBeforeScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmMantenimientoDescuentos: TfrmMantenimientoDescuentos;
  dmGeneral: TdmGeneral;
  enEdicion: Boolean;
  hayCambios: Boolean;

implementation

{$R *.dfm}

procedure TfrmMantenimientoDescuentos.FormCreate(Sender: TObject);
begin
         dmGeneral := TdmGeneral.Create(self);
         dmGeneral.getConnected;
         IBQPersona.Database := dmGeneral.IBDatabase1;
         IBQPersona.Transaction := dmGeneral.IBTransaction1;
         IBQProducto.Database := dmGeneral.IBDatabase1;
         IBQProducto.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmMantenimientoDescuentos.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmMantenimientoDescuentos.Inicializar();
begin
        if (IBQPersona.Transaction.InTransaction ) then
        begin
            IBQPersona.Transaction.Rollback;
        end;

        IBQPersona.Transaction.StartTransaction;

        IBQPersona.SQL.Clear;
        IBQPersona.SQL.Add('SELECT p.ID_PERSONA, t.NUMERO_CUENTA, p.NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO from ');
        IBQPersona.SQL.Add('"gen$persona" p');
        IBQPersona.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_IDENTIFICACION = p.ID_IDENTIFICACION and t.ID_PERSONA = p.ID_PERSONA ');
        IBQPersona.SQL.Add('WHERE t.ID_TIPO_CAPTACION = 1 ORDER BY NUMERO_CUENTA ASC');
        IBQPersona.Open;
        cdsPersona.Open;
        enEdicion := false;
end;

procedure TfrmMantenimientoDescuentos.grPersonaTitleClick(Column: TColumn);
begin

      case Column.Index of
        0: cdsPersona.IndexName := 'cdsPersonaIndex1';
        1: cdsPersona.IndexName := 'cdsPersonaIndex2';
        2: cdsPersona.IndexName := 'cdsPersonaIndex3';
        3: cdsPersona.IndexName := 'cdsPersonaIndex4';
        4: cdsPersona.IndexName := 'cdsPersonaIndex5';
      end;
end;

procedure TfrmMantenimientoDescuentos.btnCerrarClick(Sender: TObject);
begin
       self.Close;
end;

procedure TfrmMantenimientoDescuentos.cdsPersonaAfterScroll(
  DataSet: TDataSet);
begin
        enEdicion := false;
        btnAplicar.Enabled := false;
        hayCambios := False;
 // Abrir DataSet cdsProducto
        cdsProducto.Close;
        cdsProducto.Open;
        cdsProducto.EmptyDataSet;
 // Leer información de la persona actualmente seleccionada
        IBQProducto.Close;
        IBQProducto.SQL.Clear;
        IBQProducto.SQL.Add('SELECT INGRESOS_A_PRINCIPAL FROM "gen$persona"');
        IBQProducto.SQL.Add('WHERE ID_PERSONA = :ID_PERSONA');
        IBQProducto.ParamByName('ID_PERSONA').AsString := DataSet.FieldByName('ID_PERSONA').AsString;
        IBQProducto.Open;
        cdsProducto.Insert;
        cdsProductoID_PRODUCTO.Value := 0;
        cdsProductoNUMERO.Value := '';
        cdsProductoDESCRIPCION_PRODUCTO.Value := 'INGRESO ACTIVIDAD PRINCIPAL';
        cdsProductoVALOR_DESCUENTO.Value := IBQProducto.FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency;
        cdsProducto.Post;

        IBQProducto.Close;
        IBQProducto.SQL.Clear;
        IBQProducto.SQL.Add('SELECT 999 AS ID, c.ID_COLOCACION, l.DESCRIPCION_LINEA, c.VALOR_CUOTA FROM "col$colocacion" c');
        IBQProducto.SQL.Add('INNER JOIN "col$lineas" l ON l.ID_LINEA = c.ID_LINEA ');
        IBQProducto.SQL.Add('WHERE c.ID_PERSONA = :ID_PERSONA and c.VALOR_DESEMBOLSO <> c.ABONOS_CAPITAL');
        IBQProducto.ParamByName('ID_PERSONA').AsString := DataSet.FieldByName('ID_PERSONA').AsString;
        IBQProducto.Open;
        While not IBQProducto.Eof do
        begin
          cdsProducto.Insert;
          cdsProductoID_PRODUCTO.Value := 999;
          cdsProductoNUMERO.Value := IBQProducto.FieldByName('ID_COLOCACION').AsString;
          cdsProductoDESCRIPCION_PRODUCTO.Value := IBQProducto.FieldByName('DESCRIPCION_LINEA').AsString;
          cdsProductoVALOR_DESCUENTO.Value := IBQProducto.FieldByName('VALOR_CUOTA').AsCurrency;
          cdsProducto.Post;
          IBQProducto.Next;
        end;

        IBQProducto.Close;
        IBQProducto.SQL.Clear;
        IBQProducto.SQL.Add('select c.ID_TIPO_CAPTACION, c.DESCRIPCION, t.NUMERO_CUENTA, l.VALOR FROM "cap$tipocaptacion" c ');
        IBQProducto.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_TIPO_CAPTACION = c.ID_TIPO_CAPTACION ');
        IBQProducto.SQL.Add('LEFT JOIN GEN$PERSONALIBRANZA l on l.ID_PERSONA = t.ID_PERSONA and l.ID_TIPO_CAPTACION = c.ID_TIPO_CAPTACION');
        IBQProducto.SQL.Add('WHERE t.ID_PERSONA = :ID_PERSONA ');
        IBQProducto.SQL.Add('ORDER BY c.ID_TIPO_CAPTACION ASC');
        IBQProducto.ParamByName('ID_PERSONA').AsString := DataSet.FieldByName('ID_PERSONA').AsString;
        IBQProducto.Open;
        while not IBQProducto.Eof do
        begin
          cdsProducto.Insert;
          cdsProductoID_PRODUCTO.Value := IBQProducto.FieldByName('ID_TIPO_CAPTACION').AsInteger;
          cdsProductoNUMERO.Value := IBQProducto.FieldByName('NUMERO_CUENTA').AsString;
          cdsProductoDESCRIPCION_PRODUCTO.Value := IBQProducto.FieldByName('DESCRIPCION').AsString;
          cdsProductoVALOR_DESCUENTO.Value := IBQProducto.FieldByName('VALOR').AsCurrency;
          cdsProducto.Post;
          IBQProducto.Next;
        end;
        enEdicion := true;
end;

procedure TfrmMantenimientoDescuentos.cdsProductoAfterScroll(
  DataSet: TDataSet);
begin
        if (DataSet.FieldByName('ID_PRODUCTO').AsInteger = 999) then
        begin

            cdsProducto.ReadOnly := True;
            grProducto.Columns.Items[3].ReadOnly := True;
        end
        else
        begin
            cdsProducto.ReadOnly := False;
            grProducto.Columns.Items[3].ReadOnly := False;
        end;

end;

procedure TfrmMantenimientoDescuentos.grProductoCellClick(Column: TColumn);
begin
      //TODO
end;

procedure TfrmMantenimientoDescuentos.btnAplicarClick(Sender: TObject);
begin
// Aplicar Cambios Sobre el cdsProducto
        cdsProducto.First;
        while not cdsProducto.Eof do
        begin
          case (cdsProducto.FieldByName('ID_PRODUCTO').AsInteger) of
          0: begin
               IBQProducto.Close;
               IBQProducto.SQL.Clear;
               IBQProducto.SQL.Add('UPDATE "gen$persona" p SET p.INGRESOS_A_PRINCIPAL = :VALOR WHERE p.ID_PERSONA = :ID_PERSONA');
               IBQProducto.ParamByName('ID_PERSONA').AsString := cdsPersona.FieldByName('ID_PERSONA').AsString;
               IBQProducto.ParamByName('VALOR').AsCurrency := cdsProducto.FieldByName('VALOR_DESCUENTO').AsCurrency;
               IBQProducto.ExecSQL;
               IBQProducto.Transaction.CommitRetaining;
             end;
          1..998: begin
                     IBQProducto.Close;
                     IBQProducto.SQL.Clear;
                     IBQProducto.SQL.Add('SELECT COUNT(*) AS TOTAL FROM GEN$PERSONALIBRANZA l WHERE l.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and l.ID_PERSONA = :ID_PERSONA');
                     IBQProducto.ParamByName('ID_TIPO_CAPTACION').AsInteger := cdsProducto.FieldByName('ID_PRODUCTO').AsInteger;
                     IBQProducto.ParamByName('ID_PERSONA').AsString := cdsPersona.FieldByName('ID_PERSONA').AsString;
                     IBQProducto.Open;
                     if (IBQProducto.FieldByName('TOTAL').AsInteger > 0) then
                     begin
                        IBQProducto.Close;
                        IBQProducto.SQL.Clear;
                        IBQProducto.SQL.Add('UPDATE GEN$PERSONALIBRANZA l SET l.VALOR = :VALOR WHERE l.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and l.ID_PERSONA = :ID_PERSONA');
                        IBQProducto.ParamByName('VALOR').AsCurrency := cdsProducto.FieldByName('VALOR_DESCUENTO').AsCurrency;
                        IBQProducto.ParamByName('ID_TIPO_CAPTACION').AsInteger := cdsProducto.FieldByName('ID_PRODUCTO').AsInteger;
                        IBQProducto.ParamByName('ID_PERSONA').AsString := cdsPersona.FieldByName('ID_PERSONA').AsString;
                        IBQProducto.ExecSQL;
                        IBQProducto.Transaction.CommitRetaining;
                     end
                     else
                     begin
                        IBQProducto.Close;
                        IBQProducto.SQL.Clear;
                        IBQProducto.SQL.Add('INSERT INTO GEN$PERSONALIBRANZA VALUES(3,:ID_PERSONA,:ID_TIPO_CAPTACION,:VALOR)');
                        IBQProducto.ParamByName('VALOR').AsCurrency := cdsProducto.FieldByName('VALOR_DESCUENTO').AsCurrency;
                        IBQProducto.ParamByName('ID_TIPO_CAPTACION').AsInteger := cdsProducto.FieldByName('ID_PRODUCTO').AsInteger;
                        IBQProducto.ParamByName('ID_PERSONA').AsString := cdsPersona.FieldByName('ID_PERSONA').AsString;
                        IBQProducto.ExecSQL;
                        IBQProducto.Transaction.CommitRetaining;
                     end;
                  end;
          end;
          cdsProducto.Next;
        end;
        btnAplicar.Enabled := false;
        hayCambios := false;
        ShowMessage('Cambios Aplicados Correctamente!!!');

end;

procedure TfrmMantenimientoDescuentos.cdsProductoAfterEdit(
  DataSet: TDataSet);
begin
 if (enEdicion) then
 begin
   btnAplicar.Enabled := true;
   hayCambios := True;
 end;
end;

procedure TfrmMantenimientoDescuentos.cdsPersonaBeforeScroll(
  DataSet: TDataSet);
begin
        if (hayCambios) then
        begin
          if (MessageDlg('Desea perder los cambios realizados?',mtWarning,[mbYes, mbNo],0) = mrNo) then
          begin
            SysUtils.Abort
          end;
        end;
end;

end.
