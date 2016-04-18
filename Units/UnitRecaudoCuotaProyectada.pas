unit UnitRecaudoCuotaProyectada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBSQL, IBCustomDataSet, IBQuery, ExtCtrls, ComCtrls,
  StdCtrls, JvEdit, JvTypedEdit, DBCtrls, Buttons, UnitDmGeneral, UnitDmColocacion,
  DBClient, IBDatabase, pr_Common, pr_TxClasses;

type
  TfrmRecaudoCuotaProyectada = class(TForm)
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label3: TLabel;
    Label31: TLabel;
    EdNumeroIdentificacion: TMemo;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    GroupBox3: TGroupBox;
    Label37: TLabel;
    GrupoEfectivo: TGroupBox;
    Label36: TLabel;
    EdEfectivo: TJvCurrencyEdit;
    GrupoNal: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    EdNacional: TJvCurrencyEdit;
    DBLCBBancos: TDBLookupComboBox;
    EdFechaConsignacion: TDateTimePicker;
    GrupoAbono: TRadioGroup;
    EdFechaNota: TDateTimePicker;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    IBQcartera: TIBQuery;
    IBQdeposito: TIBQuery;
    Label1: TLabel;
    EdDeudaActual: TJvCurrencyEdit;
    GrupoContable: TRadioGroup;
    IBQbancos: TIBQuery;
    DSbancos: TDataSource;
    IBQcomprobante: TIBQuery;
    IBQauxiliar: TIBQuery;
    IBQmovimiento: TIBQuery;
    Label2: TLabel;
    EdNumeroNota: TEdit;
    IBQpuc: TIBQuery;
    IBScsc: TIBSQL;
    IBTcsc: TIBTransaction;
    IBAuxiliar1: TIBQuery;
    IBAuxiliar: TIBQuery;
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
    IBQuery1: TIBQuery;
    Report1: TprTxReport;
    Btnreporte: TBitBtn;
    procedure CmdBuscarClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrupoAbonoClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdNacionalKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaNotaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNacionalEnter(Sender: TObject);
    procedure EdEfectivoEnter(Sender: TObject);
    procedure EdEfectivoKeyPress(Sender: TObject; var Key: Char);
    procedure Report1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure CmdNuevoClick(Sender: TObject);
    procedure BtnreporteClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
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
    Tp       :Integer;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
    gmf      : Boolean;
    banco    : Boolean;
    esRetiroCheque : Boolean;
  end;

var
  frmRecaudoCuotaProyectada: TfrmRecaudoCuotaProyectada;
  dmGeneral : TdmGeneral;
  dmColocacion: TdmColocacion;
  TipoCuota:string;
  colocacion : string;
  vcolocacion : string;
  Estado : Integer;
  vTipoId : Integer;
  vNumeroId : String;
  vTotalLiquidacion:Currency;
  DescImpuesto : Currency;
  vDiasProrroga:Integer;
  CredFallecido:Boolean;
  CredPagoTotal:Boolean;
  CredIncapacitado:Boolean;
  CredLibranza:Boolean;
  vNacional:Currency;
  vLibranza:Currency;
  vComisionNal:Currency;
  vComisionLocal:Currency;
  vConsignaAhorros:Currency;
  Banco:Integer;
  FechaCosignacion : TDate;
  Consec: String;

implementation

{$R *.dfm}

uses UnitBuscarPersona, UnitGlobales, UnitGlobalesCol;

procedure TfrmRecaudoCuotaProyectada.Inicializar;
begin
            if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
            dmGeneral.IBTransaction1.StartTransaction;
            EdNumeroIdentificacion.Enabled := True;
            EdNumeroIdentificacion.Text := '';
            EdNombre.Enabled := True;
            EdNombre.Caption := '';
            EdDeudaActual.Value := 0;
            EdFechaNota.Date := fFechaActual;
            EdFechaConsignacion.Date := fFechaActual;
            IBQAgencia.Open;
            EdAgencia.KeyValue := Agencia;
            //vHonorarios := 0;
            CmdBuscar.Enabled := True;
            EdEfectivo.Value := 0;
            EdNacional.Value := 0;
            Banco := -1;
            GrupoEfectivo.Visible := True;
            GrupoNal.Visible := False;
            GrupoAbono.ItemIndex := 0;
            GrupoContable.ItemIndex := 0;
            IBQbancos.Open;
            IBQbancos.Last;
            DBLCBBancos.KeyValue := Banco;
            Btnreporte.Enabled := False;
            Consec := '';
end;

procedure TfrmRecaudoCuotaProyectada.CmdBuscarClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
        frmBuscarPersona := TfrmBuscarPersona.Create(Self);
        if frmBuscarPersona.ShowModal = mrOK then
        begin
           EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
           EdNumeroIdentificacionExit(TObject(EdNumeroIdentificacion));
        end;
end;

procedure TfrmRecaudoCuotaProyectada.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmRecaudoCuotaProyectada.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQbancos.Database := dmGeneral.IBDatabase1;
        IBQAgencia.Database := dmGeneral.IBDatabase1;
        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQmovimiento.Database := dmGeneral.IBDatabase1;
        IBQpuc.Database := dmGeneral.IBDatabase1;
        IBScsc.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar1.Database := dmGeneral.IBDatabase1;

        IBQbancos.Transaction := dmGeneral.IBTransaction1;
        IBQAgencia.Transaction := dmGeneral.IBTransaction1;
        IBQcartera.Transaction := dmGeneral.IBTransaction1;
        IBQdeposito.Transaction := dmGeneral.IBTransaction1;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQmovimiento.Transaction := dmGeneral.IBTransaction1;
        IBQpuc.Transaction := dmGeneral.IBTransaction1;
        IBScsc.Transaction := IBTcsc;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar1.Transaction := dmGeneral.IBTransaction1;

        IBTcsc.DefaultDatabase := dmGeneral.IBDatabase1;
end;

procedure TfrmRecaudoCuotaProyectada.GrupoAbonoClick(Sender: TObject);
begin
        if GrupoAbono.ItemIndex = 0 then begin
          GrupoEfectivo.Visible := True;
          EdEfectivo.Value := 0;
          EdNacional.Value := 0;
          GrupoNal.Visible := False;
          EdEfectivo.SetFocus;
        end
        else if ((GrupoAbono.ItemIndex = 1)) then begin
          GrupoNal.Visible := True;
          EdEfectivo.Value := 0;
          EdNacional.Value := 0;
          GrupoEfectivo.Visible := False;
          EdNacional.SetFocus;
        end;
end;

procedure TfrmRecaudoCuotaProyectada.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
      if (EdNumeroIdentificacion.Text <> '') then
      begin
        IBQdeposito.Close;
        IBQdeposito.SQL.Clear;
        IBQdeposito.SQL.Add('SELECT * FROM "gen$persona" m');
        IBQdeposito.SQL.Add('WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION AND m.ID_PERSONA = :ID_PERSONA');
        IBQdeposito.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQdeposito.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQdeposito.Open;
        if (IBQdeposito.RecordCount > 0) then
        begin
         EdNombre.Caption := IBQdeposito.FieldByName('NOMBRE').AsString + ' ' + IBQdeposito.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQdeposito.FieldByName('SEGUNDO_APELLIDO').AsString;
         IBQcartera.Close;
         IBQcartera.SQL.Clear;
         IBQcartera.SQL.Add('SELECT SUM(m.DEBITO - m.CREDITO) AS SALDO FROM GEN$PERSONAMOVIMIENTO m');
         IBQcartera.SQL.Add('WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION AND m.ID_PERSONA = :ID_PERSONA');
         IBQcartera.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
         IBQcartera.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
         IBQcartera.Open;
         if (IBQcartera.RecordCount > 0) then
         begin
            EdDeudaActual.Value := IBQcartera.FieldByName('SALDO').AsCurrency;
            CmdBuscar.Enabled := False;
            CmdGrabar.Enabled := True;
            EdEfectivo.SetFocus;
         end
         else
         begin
            ShowMessage('Persona No Posee Deuda Vigente!!!');
            CmdNuevo.Click;
         end;
        end
        else
        begin
            ShowMessage('Persona No Existe!!!');
            CmdNuevo.Click;
        end;
      end
end;

procedure TfrmRecaudoCuotaProyectada.CmdCerrarClick(Sender: TObject);
begin
        dmGeneral.Free;
        Close;
end;

procedure TfrmRecaudoCuotaProyectada.CmdGrabarClick(Sender: TObject);
var
        ARecord: PList;
        id_codigo: Integer;
        CodigoCargo: String;
        CodigoPago:String;

begin

        if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
           Exit;
        end;

        CmdGrabar.Enabled := False;
        Application.ProcessMessages;

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

        // Buscar Código Cargo
        IBQpuc.Close;
        IBQpuc.SQL.Clear;
        IBQpuc.SQL.Add('SELECT * FROM "col$codigospucbasicos" c');
        IBQpuc.SQL.Add('WHERE c.ID_CODIGOPUCBASICO = :CODIGO');

        // Consecutivo Comprobante
        Consec := FormatCurr('00000000',ObtenerConsecutivo(IBScsc,10));

        // Codigo Cargo
        if (GrupoContable.ItemIndex = 0) then
        begin
            IBQpuc.ParamByName('CODIGO').AsInteger := 98;
        end
        else
        begin
            IBQpuc.ParamByName('CODIGO').AsInteger := 99;
        end;
        IBQpuc.Close;
        IBQpuc.Open;
        CodigoCargo := IBQpuc.FieldByName('CODIGO').AsString;

        // Insertar Comprobante
        IBQcomprobante.Close;
        IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(Consec);
        IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
        IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsInteger := 10;
        IBQcomprobante.ParamByName('FECHADIA').AsDate := EdFechaNota.Date;
        IBQcomprobante.ParamByName('DESCRIPCION').AsString := 'RECAUDO EN LA FECHA RECIBIDO DE: '+ EdNombre.Caption;
        IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency := EdEfectivo.Value + EdNacional.Value;
        IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency := EdEfectivo.Value + EdNacional.Value;
        IBQcomprobante.ParamByName('ESTADO').AsString := 'O';
        IBQcomprobante.ParamByName('IMPRESO').AsInteger := 1;
        IBQcomprobante.ParamByName('ANULACION').AsInteger := 0;
        IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
        IBQcomprobante.ExecSQL;

        // Insertar Auxiliar
         // Buscar Codigo Pago
         if (GrupoAbono.ItemIndex = 0) then
         begin
            IBQpuc.Close;
            IBQpuc.ParamByName('CODIGO').AsInteger := 1;
            IBQpuc.Open;
            CodigoPago := IBQpuc.FieldByName('CODIGO').AsString;
         end
         else
         if (GrupoAbono.ItemIndex = 1) then
         begin
             CodigoPago := IBQbancos.FieldByName('CODIGO').AsString;
         end;



        IBQauxiliar.Close;
        IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(Consec);
        IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
        IBQauxiliar.ParamByName('CODIGO').AsString := CodigoPago;
        IBQauxiliar.ParamByName('DEBITO').AsCurrency := EdEfectivo.Value + EdNacional.Value;
        IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
        IBQauxiliar.ParamByName('ID_CUENTA').AsString := '';
        IBQauxiliar.ParamByName('ID_COLOCACION').AsString := '';
        IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQauxiliar.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
        IBQauxiliar.ParamByName('TASA_RETENCION').AsFloat := 0;
        IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
        IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger := 10;
        IBQauxiliar.ExecSQL;

        IBQauxiliar.Close;
        IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(Consec);
        IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
        IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCargo;
        IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
        IBQauxiliar.ParamByName('CREDITO').AsCurrency := EdEfectivo.Value + EdNacional.Value;
        IBQauxiliar.ParamByName('ID_CUENTA').AsString := '';
        IBQauxiliar.ParamByName('ID_COLOCACION').AsString := '';
        IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQauxiliar.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
        IBQauxiliar.ParamByName('TASA_RETENCION').AsFloat := 0;
        IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
        IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger := 10;
        IBQauxiliar.ExecSQL;

        // Insertar Movimiento

        IBQmovimiento.Close;
        IBQmovimiento.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
        IBQmovimiento.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        IBQmovimiento.ParamByName('FECHA').AsDate := EdFechaNota.Date;
        IBQmovimiento.ParamByName('HORA').AsTime := Now;
        IBQmovimiento.ParamByName('DEBITO').AsCurrency := 0;
        IBQmovimiento.ParamByName('CREDITO').AsCurrency := EdEfectivo.Value + EdNacional.Value;
        IBQmovimiento.ParamByName('TIPO_COMPROBANTE').AsInteger := 10;
        IBQmovimiento.ParamByName('COMPROBANTE').AsInteger := StrToInt(Consec);
        IBQmovimiento.ExecSQL;

        dmGeneral.IBTransaction1.Commit;
        Btnreporte.Enabled := True;

        BtnreporteClick(self);


end;

procedure TfrmRecaudoCuotaProyectada.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TfrmRecaudoCuotaProyectada.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TfrmRecaudoCuotaProyectada.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
EnterTabs(Key,self);
end;

procedure TfrmRecaudoCuotaProyectada.EdNacionalKeyPress(Sender: TObject;
  var Key: Char);
begin
EnterTabs(Key,self);
end;

procedure TfrmRecaudoCuotaProyectada.EdFechaNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
EnterTabs(Key,self);
end;

procedure TfrmRecaudoCuotaProyectada.EdNacionalEnter(Sender: TObject);
begin
        EdNacional.SelectAll;
end;

procedure TfrmRecaudoCuotaProyectada.EdEfectivoEnter(Sender: TObject);
begin
        EdEfectivo.SelectAll;
end;

procedure TfrmRecaudoCuotaProyectada.EdEfectivoKeyPress(Sender: TObject;
  var Key: Char);
begin
EnterTabs(Key, Self);
end;

procedure TfrmRecaudoCuotaProyectada.Report1InitDetailBandDataSet(
  Sender: TObject; DetailBand: TprBand; DataSet: TObject;
  const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;
end;

procedure TfrmRecaudoCuotaProyectada.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmRecaudoCuotaProyectada.BtnreporteClick(Sender: TObject);
begin
        //Imprimir Nota

        with IBAuxiliar do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
          SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
          SQL.Add('"con$comprobante".FECHADIA,');
          SQL.Add('"con$comprobante".DESCRIPCION,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"con$auxiliar".CODIGO,');
          SQL.Add('"con$puc".NOMBRE AS CUENTA,');
          SQL.Add('"con$auxiliar".ID_CUENTA,');
          SQL.Add('"con$auxiliar".ID_COLOCACION,');
          SQL.Add('"con$auxiliar".ID_IDENTIFICACION,');
          SQL.Add('"con$auxiliar".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
          SQL.Add('"gen$persona".NOMBRE AS NOMBRE1,');
          SQL.Add('"con$auxiliar".DEBITO,');
          SQL.Add('"con$auxiliar".CREDITO');
          SQL.Add('from');
          SQL.Add('"con$comprobante"');
          SQL.Add('LEFT JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE and "con$comprobante".TIPO_COMPROBANTE = "con$auxiliar".TIPO_COMPROBANTE)');
          SQL.Add('LEFT JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE  = "con$tipocomprobante".ID )');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
          SQL.Add('LEFT JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("con$auxiliar".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
          SQL.Add('"con$auxiliar".ID_PERSONA = "gen$persona".ID_PERSONA )');
          SQL.Add('where "con$comprobante".ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('"con$comprobante".TIPO_COMPROBANTE = :TIPO_COMPROBANTE and ');
          SQL.Add('"con$comprobante".ID_COMPROBANTE = :ID_COMPROBANTE');
          SQL.Add('order by "con$auxiliar".ID_COMPROBANTE,"con$auxiliar".CODIGO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 10;
          ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(Consec);
          Open;
        end;
        report1.Variables.ByName['EMPRESA'].AsString := Empresa;
        report1.Variables.ByName['NIT'].AsString := Nit;
        if report1.PrepareReport then
           report1.PreviewPreparedReport(True);
end;

end.
