unit UnitAplicarDescuentosLibranza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, UnitDmGeneral, UnitGlobales, UnitGlobalesCol,
  StdCtrls, Buttons, ComCtrls, DateUtils, JvEdit, JvTypedEdit, IBSQL,
  IBDatabase;

type
  TfrmAplicarDescuentosLibranza = class(TForm)
    DBgrid: TDBGrid;
    DSgrid: TDataSource;
    CDSdata: TClientDataSet;
    CDSdataID_PERSONA: TStringField;
    CDSdataID_TIPO_RELACION: TIntegerField;
    CDSdataPRIMER_APELLIDO: TStringField;
    CDSdataSEGUNDO_APELLIDO: TStringField;
    CDSdataNOMBRE: TStringField;
    CDSdataID_PRODUCTO: TIntegerField;
    CDSdataPRODUCTO: TStringField;
    CDSdataNUMERO: TStringField;
    CDSdataCAPITAL: TCurrencyField;
    CDSdataINTERES: TCurrencyField;
    CDSdataOTROS: TCurrencyField;
    CDSdataDEPOSITO: TCurrencyField;
    CDSdataID_CLASIFICACION: TIntegerField;
    CDSdataID_GARANTIA: TIntegerField;
    CDSdataID_CATEGORIA: TStringField;
    CDSdataID_LINEA: TIntegerField;
    CDSdataVALOR: TCurrencyField;
    CDSdataAMORTIZACION: TIntegerField;
    CDSgrid: TClientDataSet;
    CDSgridNOMBRE: TStringField;
    CDSgridVALOR: TCurrencyField;
    CDSgridPRIMER_APELLIDO: TStringField;
    CDSgridSEGUNDO_APELLIDO: TStringField;
    CDSgridRECIBIDO: TCurrencyField;
    Panel1: TPanel;
    IBQcartera: TIBQuery;
    IBQdeposito: TIBQuery;
    CDSgridID_TIPO_RELACION: TIntegerField;
    btnAplicar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label1: TLabel;
    EDfecha: TDateTimePicker;
    btnProcesar: TBitBtn;
    Label2: TLabel;
    edTotal: TJvCurrencyEdit;
    Label3: TLabel;
    EdRecibido: TJvCurrencyEdit;
    IBSQL3: TIBSQL;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQLComp: TIBSQL;
    IBTComp: TIBTransaction;
    Label4: TLabel;
    EdFechaAplicacion: TDateTimePicker;
    CDSgridID_PERSONA: TIntegerField;
    IBQcomprobante: TIBQuery;
    IBQauxiliar: TIBQuery;
    IBQmovimiento: TIBQuery;
    btnRecalcular: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CDSdataCalcFields(DataSet: TDataSet);
    procedure DBgridTitleClick(Column: TColumn);
    procedure CmdCerrarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRecalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
   type
    PList = ^AList;
    AList = record
     codigo   : string;
     nomcuenta: string;
     debito   : currency;
     credito  : currency;
     nocuenta : integer;
     nocredito: string;
     tipoide  : integer;
     idpersona: string;
     monto    : currency;
     tasa     : single;
     estado   : string;
   end;

var
  frmAplicarDescuentosLibranza: TfrmAplicarDescuentosLibranza;
  dmGeneral : TdmGeneral;

implementation

{$R *.dfm}



procedure TfrmAplicarDescuentosLibranza.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQdeposito.Database := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQmovimiento.Database := dmGeneral.IBDatabase1;

        IBQcartera.Transaction := dmGeneral.IBTransaction1;
        IBQdeposito.Transaction := dmGeneral.IBTransaction1;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQmovimiento.Transaction := dmGeneral.IBTransaction1;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;


        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBSQL3.Transaction := dmGeneral.IBTransaction1;

        IBTComp.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSQLComp.Database := dmGeneral.IBDatabase1;
        IBSQLComp.Transaction := IBTComp;



        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmAplicarDescuentosLibranza.CDSdataCalcFields(
  DataSet: TDataSet);
begin
        CDSdataVALOR.Value := CDSdataCAPITAL.Value + CDSdataINTERES.Value + CDSdataOTROS.Value + CDSdataDEPOSITO.Value;
end;

procedure TfrmAplicarDescuentosLibranza.DBgridTitleClick(Column: TColumn);
begin
      case Column.Index of
        0: CDSgrid.IndexName := 'CDSgridIndex1';
        1: CDSgrid.IndexName := 'CDSgridIndex2';
        2: CDSgrid.IndexName := 'CDSgridIndex3';
        3: CDSgrid.IndexName := 'CDSgridIndex4';
      end;
end;

procedure TfrmAplicarDescuentosLibranza.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAplicarDescuentosLibranza.btnAplicarClick(Sender: TObject);
var
   ValorPersona: Currency;
   IdPersona: String;
   FechaSiguiente: TDate;
   Comprobante : Integer;
   CuotaNumero: Integer;
   SaldoActual: Currency;
   TipoOperacion: Integer;
   HoraActual : TTime;
   Lista:TList;
   AR:PList;
   TotalRecibido : Currency;
   CodigoCargoMesNomina: String;
   CodigoNomina: String;
begin
        //Procesar aplicación a la fecha de corte
        IBSQL3.Close;
        IBSQL3.SQL.Clear;
        IBSQL3.SQL.Add('select *');
        IBSQL3.SQL.Add('from "col$codigospucbasicos" c ');
        IBSQL3.SQL.Add('where c.ID_CODIGOPUCBASICO = :ID');

        IBSQL3.ParamByName('ID').AsInteger := 99;
        IBSQL3.ExecQuery;

        CodigoCargoMesNomina := IBSQL3.FieldByName('CODIGO').AsString;

        IBSQL3.Close;
        IBSQL3.ParamByName('ID').AsInteger := 100;
        IBSQL3.ExecQuery;

        CodigoNomina := IBSQL3.FieldByName('CODIGO').AsString;

        Comprobante := ObtenerConsecutivo(IBSQLComp,8);
        HoraActual := fHoraActual;



        TotalRecibido := 0;
        CDSgrid.First;
        while not CDSgrid.Eof do
        begin
            IdPersona := IntToStr(CDSgridID_PERSONA.Value);
            ValorPersona := CDSgridRECIBIDO.Value;
            CDSdata.Filtered := False;
            CDSdata.Filter := 'ID_PERSONA = ' + QuotedStr(IdPersona);
            CDSdata.Filtered := True;
            if (CDSgridRECIBIDO.Value > 0) then
            begin
              while not CDSdata.Eof do
              begin

              //Si es Cartera

              
              if (CDSdataID_PRODUCTO.Value = 999) then
              begin
                 // Actualizar GEN$DESCUENTOCARTERA
                 IBSQL1.Close;
                 IBSQL1.SQL.Clear;
                 IBSQL1.SQL.Add('UPDATE GEN$DESCUENTOCARTERA d SET d.APLICADO = 1 WHERE d.ID_COLOCACION = :ID_COLOCACION and d.FECHA_CORTE = :FECHA_CORTE');
                 IBSQL1.ParamByName('ID_COLOCACION').AsString := CDSdataNUMERO.Value;
                 IBSQL1.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
                 IBSQL1.ExecQuery;

              end
              else
              // Si es deposito
              if (CDSdataID_PRODUCTO.Value <> 999) then
              begin
                 IBSQL1.Close;
                 IBSQL1.SQL.Clear;
                 IBSQL1.SQL.Add('UPDATE GEN$DESCUENTODEPOSITO d SET d.APLICADO = 1 WHERE d.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and d.NUMERO_CUENTA = :NUMERO_CUENTA and d.FECHA_CORTE = :FECHA_CORTE');
                 IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDSdataID_PRODUCTO.Value;
                 IBSQL1.ParamByName('NUMERO_CUENTA').AsString := CDSdataNUMERO.Value;
                 IBSQL1.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
                 IBSQL1.ExecQuery;
              end;



                Application.ProcessMessages;
                CDSdata.Next;
            end;

              // Contabilización

              IBQauxiliar.Close;
              IBQauxiliar.SQL.Clear;
              IBQauxiliar.SQL.Add('INSERT INTO "con$auxiliar" VALUES(');
              IBQauxiliar.SQL.Add(':ID_COMPROBANTE,');
              IBQauxiliar.SQL.Add(':ID_AGENCIA,');
              IBQauxiliar.SQL.Add(':FECHA,');
              IBQauxiliar.SQL.Add(':CODIGO,');
              IBQauxiliar.SQL.Add(':DEBITO,');
              IBQauxiliar.SQL.Add(':CREDITO,');
              IBQauxiliar.SQL.Add(':ID_CUENTA,');
              IBQauxiliar.SQL.Add(':ID_COLOCACION,');
              IBQauxiliar.SQL.Add(':ID_IDENTIFICACION,');
              IBQauxiliar.SQL.Add(':ID_PERSONA,');
              IBQauxiliar.SQL.Add(':MONTO_RETENCION,');
              IBQauxiliar.SQL.Add(':TASA_RETENCION,');
              IBQauxiliar.SQL.Add(':ESTADOAUX,');
              IBQauxiliar.SQL.Add(':TIPO_COMPROBANTE');
              IBQauxiliar.SQL.Add(')');

              IBQmovimiento.Close;
              IBQmovimiento.SQL.Clear;
              IBQmovimiento.SQL.Add('INSERT INTO GEN$PERSONAMOVIMIENTO VALUES(');
              IBQmovimiento.SQL.Add(':ID_IDENTIFICACION,');
              IBQmovimiento.SQL.Add(':ID_PERSONA,');
              IBQmovimiento.SQL.Add(':FECHA,');
              IBQmovimiento.SQL.Add(':HORA,');
              IBQmovimiento.SQL.Add(':DEBITO,');
              IBQmovimiento.SQL.Add(':CREDITO,');
              IBQmovimiento.SQL.Add(':TIPO_COMPROBANTE,');
              IBQmovimiento.SQL.Add(':COMPROBANTE');
              IBQmovimiento.SQL.Add(')');
              IBQmovimiento.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
              IBQmovimiento.ParamByName('ID_PERSONA').AsString := CDSgridID_PERSONA.AsString;
              IBQmovimiento.ParamByName('FECHA').AsDate := EdFechaAplicacion.Date;
              IBQmovimiento.ParamByName('HORA').AsTime := HoraActual;
              IBQmovimiento.ParamByName('DEBITO').AsCurrency := 0;
              IBQmovimiento.ParamByName('CREDITO').AsCurrency := CDSgridRECIBIDO.Value;
              IBQmovimiento.ParamByName('TIPO_COMPROBANTE').AsString := '8';
              IBQmovimiento.ParamByName('COMPROBANTE').AsInteger := Comprobante;
              IBQmovimiento.ExecSQL;

              IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaAplicacion.Date;
              IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCargoMesNomina;
              IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
              IBQauxiliar.ParamByName('CREDITO').AsCurrency := CDSgridRECIBIDO.Value;
              IBQauxiliar.ParamByName('ID_CUENTA').Clear;
              IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
              IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
              IBQauxiliar.ParamByName('ID_PERSONA').AsString := IntToStr(CDSgridID_PERSONA.Value);
              IBQauxiliar.ParamByName('MONTO_RETENCION').AsInteger := 0;
              IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
              IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
              IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsString := '8';
              IBQauxiliar.ExecSQL;

              TotalRecibido := TotalRecibido + CDSgridRECIBIDO.Value;
            end;

            Application.ProcessMessages;
            CDSgrid.Next;
        end;

              IBQauxiliar.Close;
              IBQauxiliar.SQL.Clear;
              IBQauxiliar.SQL.Add('INSERT INTO "con$auxiliar" VALUES(');
              IBQauxiliar.SQL.Add(':ID_COMPROBANTE,');
              IBQauxiliar.SQL.Add(':ID_AGENCIA,');
              IBQauxiliar.SQL.Add(':FECHA,');
              IBQauxiliar.SQL.Add(':CODIGO,');
              IBQauxiliar.SQL.Add(':DEBITO,');
              IBQauxiliar.SQL.Add(':CREDITO,');
              IBQauxiliar.SQL.Add(':ID_CUENTA,');
              IBQauxiliar.SQL.Add(':ID_COLOCACION,');
              IBQauxiliar.SQL.Add(':ID_IDENTIFICACION,');
              IBQauxiliar.SQL.Add(':ID_PERSONA,');
              IBQauxiliar.SQL.Add(':MONTO_RETENCION,');
              IBQauxiliar.SQL.Add(':TASA_RETENCION,');
              IBQauxiliar.SQL.Add(':ESTADOAUX,');
              IBQauxiliar.SQL.Add(':TIPO_COMPROBANTE');
              IBQauxiliar.SQL.Add(')');
              IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaAplicacion.Date;
              IBQauxiliar.ParamByName('CODIGO').AsString := CodigoNomina;
              IBQauxiliar.ParamByName('DEBITO').AsCurrency := TotalRecibido;
              IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
              IBQauxiliar.ParamByName('ID_CUENTA').Clear;
              IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
              IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              IBQauxiliar.ParamByName('ID_PERSONA').AsString := '';
              IBQauxiliar.ParamByName('MONTO_RETENCION').AsInteger := 0;
              IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
              IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
              IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsString := '8';
              IBQauxiliar.ExecSQL;

        IBQcomprobante.Close;
        IBQcomprobante.SQL.Clear;
        IBQcomprobante.SQL.Add('insert into "con$comprobante" VALUES (');
        IBQcomprobante.SQL.Add(':ID_COMPROBANTE,');
        IBQcomprobante.SQL.Add(':ID_AGENCIA,');
        IBQcomprobante.SQL.Add(':TIPO_COMPROBANTE,');
        IBQcomprobante.SQL.Add(':FECHADIA,');
        IBQcomprobante.SQL.Add(':DESCRIPCION,');
        IBQcomprobante.SQL.Add(':TOTAL_DEBITO,');
        IBQcomprobante.SQL.Add(':TOTAL_CREDITO,');
        IBQcomprobante.SQL.Add(':ESTADO,');
        IBQcomprobante.SQL.Add(':IMPRESO,');
        IBQcomprobante.SQL.Add(':ANULACION,');
        IBQcomprobante.SQL.Add(':ID_EMPLEADO');
        IBQcomprobante.SQL.Add(')');

        IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
        IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsString := '8';
        IBQcomprobante.ParamByName('FECHADIA').AsDate := EdFechaAplicacion.Date;
        IBQcomprobante.ParamByName('DESCRIPCION').AsString := 'DESCUENTO DEL PERIODO';
        IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency := TotalRecibido;
        IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency := TotalRecibido;
        IBQcomprobante.ParamByName('ESTADO').AsString := 'O';
        IBQcomprobante.ParamByName('IMPRESO').AsInteger := 0;
        IBQcomprobante.ParamByName('ANULACION').Clear;
        IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
        IBQcomprobante.ExecSQL;


        dmGeneral.IBTransaction1.Commit;
        btnAplicar.Enabled := False;
        ShowMessage('Proceso Aplicado con Exito!!!');

end;

procedure TfrmAplicarDescuentosLibranza.btnProcesarClick(Sender: TObject);
var
   Total: Currency;
   FechaDeposito: TDateTime;
begin

        FechaDeposito := IncMonth(EDfecha.Date,1);
        if (MonthOf(FechaDeposito) = 2) then
           TryEncodeDate(YearOf(FechaDeposito),MonthOf(FechaDeposito),DaysInAMonth(YearOf(FechaDeposito),MonthOf(FechaDeposito)),FechaDeposito)
        else
           TryEncodeDate(YearOf(FechaDeposito),MonthOf(FechaDeposito),30,FechaDeposito);

        Total := 0;
        CDSdata.Open;
        CDSdata.EmptyDataSet;
        // Leer Datos
        IBQcartera.Close;
        IBQcartera.SQL.Clear;
        IBQcartera.SQL.Add('SELECT p.ID_PERSONA, p.ID_TIPO_RELACION, p.NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO,');
        IBQcartera.SQL.Add('c.ID_COLOCACION, d.CAPITAL, d.INTERES, d.DESCUENTO');
        IBQcartera.SQL.Add('FROM GEN$DESCUENTOCARTERA d ');
        IBQcartera.SQL.Add('INNER JOIN "col$colocacion" c ON c.ID_COLOCACION = d.ID_COLOCACION');
        IBQcartera.SQL.Add('INNER JOIN "gen$persona" p ON c.ID_IDENTIFICACION = p.ID_IDENTIFICACION and c.ID_PERSONA = p.ID_PERSONA');
        IBQcartera.SQL.Add('WHERE d.APLICADO = 0 and d.FECHA_CORTE = :FECHA_CORTE and ID_GARANTIA = 1');
        IBQcartera.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
        IBQcartera.Open;


        while not IBQcartera.Eof do
        begin
           CDSdata.Insert;
           CDSdataID_PERSONA.Value := IBQcartera.FieldByName('ID_PERSONA').AsString;
           CDSdataID_TIPO_RELACION.Value := IBQcartera.FieldByName('ID_TIPO_RELACION').AsInteger;
           CDSdataPRIMER_APELLIDO.Value := IBQcartera.FieldByName('PRIMER_APELLIDO').AsString;
           CDSdataSEGUNDO_APELLIDO.Value := IBQcartera.FieldByName('SEGUNDO_APELLIDO').AsString;
           CDSdataNOMBRE.Value := IBQcartera.FieldByName('NOMBRE').AsString;
           CDSdataID_PRODUCTO.Value := 999;
           CDSdataPRODUCTO.Value := '';
           CDSdataNUMERO.Value := IBQcartera.FieldByName('ID_COLOCACION').AsString;
           CDSdataCAPITAL.Value := IBQcartera.FieldByName('CAPITAL').AsCurrency;
           CDSdataINTERES.Value := IBQcartera.FieldByName('INTERES').AsCurrency;
           CDSdataOTROS.Value := IBQcartera.FieldByName('DESCUENTO').AsCurrency;
           CDSdataDEPOSITO.Value := 0;
           CDSdata.Post;
           Application.ProcessMessages;
           IBQcartera.Next;
        end;


        // Leer depositos

        IBQdeposito.Close;
        IBQdeposito.SQL.Clear;
        IBQdeposito.SQL.Add('SELECT p.ID_PERSONA, p.ID_TIPO_RELACION, p.NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO,');
        IBQdeposito.SQL.Add('d.ID_TIPO_CAPTACION, d.NUMERO_CUENTA, d.VALOR');
        IBQdeposito.SQL.Add('FROM GEN$DESCUENTODEPOSITO d');
        IBQdeposito.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_TIPO_CAPTACION = d.ID_TIPO_CAPTACION and t.NUMERO_CUENTA = d.NUMERO_CUENTA');
        IBQdeposito.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = t.ID_IDENTIFICACION and p.ID_PERSONA = t.ID_PERSONA');
        IBQdeposito.SQL.Add('WHERE d.APLICADO = 0 and FECHA_CORTE = :FECHA_CORTE and ID_TIPO_RELACION <> 2');
        IBQdeposito.ParamByName('FECHA_CORTE').AsDate := FechaDeposito;
        IBQdeposito.Open;

        while not IBQdeposito.Eof do
        begin
           CDSdata.Insert;
           CDSdataID_PERSONA.Value := IBQdeposito.FieldByName('ID_PERSONA').AsString;
           CDSdataID_TIPO_RELACION.Value := IBQdeposito.FieldByName('ID_TIPO_RELACION').AsInteger;
           CDSdataPRIMER_APELLIDO.Value := IBQdeposito.FieldByName('PRIMER_APELLIDO').AsString;
           CDSdataSEGUNDO_APELLIDO.Value := IBQdeposito.FieldByName('SEGUNDO_APELLIDO').AsString;
           CDSdataNOMBRE.Value := IBQdeposito.FieldByName('NOMBRE').AsString;
           CDSdataID_PRODUCTO.Value := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
           CDSdataPRODUCTO.Value := '';
           CDSdataNUMERO.Value := IBQdeposito.FieldByName('NUMERO_CUENTA').AsString;
           CDSdataCAPITAL.Value := 0;
           CDSdataINTERES.Value := 0;
           CDSdataOTROS.Value := 0;
           CDSdataDEPOSITO.Value := IBQdeposito.FieldByName('VALOR').AsCurrency;
           CDSdata.Post;
           Application.ProcessMessages;
           IBQdeposito.Next;
        end;

        CDSgrid.Close;
        CDSgrid.Open;
        CDSgrid.EmptyDataSet;
       // CDSdata.Filtered := False;
       // CDSdata.Filter := '(ID_PRODUCTO = 999 AND ID_GARANTIA = 1) OR (ID_PRODUCTO <> 999 AND ID_TIPO_RELACION = 1)';
       // CDSdata.Filtered := True;
        CDSdata.First;
        while not CDSdata.Eof do
        begin
         if (CDSdataVALOR.Value > 0) then
         begin
           CDSgrid.Filtered := False;
           CDSgrid.Filter := 'ID_PERSONA = ' + QuotedStr(CDSdataID_PERSONA.Value);
           CDSgrid.Filtered := True;
           if (CDSgrid.RecordCount > 0) then
           begin
               CDSgrid.Edit;
               CDSgridVALOR.Value := CDSgridVALOR.Value + CDSdataVALOR.Value;
               CDSgridRECIBIDO.Value := CDSgridVALOR.Value;
               CDSgrid.Post;
           end
           else
           begin
               CDSgrid.Insert;
               CDSgridID_PERSONA.Value := StrToInt(CDSdataID_PERSONA.Value);
               CDSgridID_TIPO_RELACION.Value := CDSdataID_TIPO_RELACION.Value;
               CDSgridNOMBRE.Value := CDSdataNOMBRE.Value;
               CDSgridPRIMER_APELLIDO.Value := CDSdataPRIMER_APELLIDO.Value;
               CDSgridSEGUNDO_APELLIDO.Value := CDSdataSEGUNDO_APELLIDO.Value;
               CDSgridVALOR.Value := CDSdataVALOR.Value;
               CDSgridRECIBIDO.Value := CDSgridVALOR.Value;
               CDSgrid.Post;
           end;
           Total := Total + CDSdataVALOR.Value;
           EdTotal.Value := Total;
           EdRecibido.Value := Total;
           Application.ProcessMessages;
           end;
           CDSdata.Next;
        end;
        CDSgrid.Filter := '';
        CDSgrid.Filtered := False;
        EdTotal.Value := Total;
        btnAplicar.Enabled := True;

end;

procedure TfrmAplicarDescuentosLibranza.FormShow(Sender: TObject);
var
  Fecha: TDateTime;
begin
        if MonthOf(EdFecha.Date) <> 2 then
        begin
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),30,Fecha) then EdFecha.Date := Fecha;
        end
        else
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),DaysInAMonth(YearOf(EdFecha.Date),MonthOf(EdFecha.Date)),Fecha) then EdFecha.Date := Fecha;
        EdFechaAplicacion.Date := fFechaActual;
end;

procedure TfrmAplicarDescuentosLibranza.btnRecalcularClick(
  Sender: TObject);
  var
     TotalReportado: Currency;
     TotalRecibido : Currency;
begin

        TotalReportado := 0;
        TotalRecibido := 0;
        CDSgrid.First;
        while not CDSgrid.Eof do
        begin
              TotalReportado := TotalReportado + CDSgridVALOR.Value;
              TotalRecibido := TotalRecibido + CDSgridRECIBIDO.Value;
              CDSgrid.Next;
        end;
        edTotal.Value := TotalReportado;
        EdRecibido.Value := TotalRecibido;
end;

end.
