unit unitMain;

interface

uses
  Jpeg, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, DBXpress, DB,IBDatabase,
  SqlExpr, StrUtils, ShellApi;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    ImageList: TImageList;
    PrinterSetupDialog: TPrinterSetupDialog;
    ActionList: TActionList;
    Mnu01: TMenuItem;
    ConfigurarImpresora1: TMenuItem;
    N1: TMenuItem;
    SalirdePSI1: TMenuItem;
    Configurar_Impresora: TAction;
    N2: TMenuItem;
    Personas1: TMenuItem;
    CreacindeNuevaPersona1: TMenuItem;
    RetirodeAsociado1: TMenuItem;
    ListadoGeneraldePersonas1: TMenuItem;
    Captaciones1: TMenuItem;
    CrearCaptacin1: TMenuItem;
    InformesGerenciales1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ModificarCaptacin1: TMenuItem;
    RangosdeLibreta1: TMenuItem;
    ConsultaExtracto1: TMenuItem;
    LiquidacionInteresesCaptacion1: TMenuItem;
    RecuperarTablaLiquidacin1: TMenuItem;
    ProrrogaCaptaciones: TMenuItem;
    SaldarCaptacin1: TMenuItem;
    ImprimirCaptacion1: TMenuItem;
    Informes1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnManPersona: TToolButton;
    ToolButton1: TToolButton;
    BtnCreacionCaptacion: TToolButton;
    BtnRangos: TToolButton;
    BtnImprimirCaptacion: TToolButton;
    ToolButton2: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    ConsultarCaptacin1: TMenuItem;
    ComprobanteContable: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    EstadosCaptacin1: TMenuItem;
    N5: TMenuItem;
    ListadoGeneraldeCaptaciones1: TMenuItem;
    N6: TMenuItem;
    Sumatorias1: TMenuItem;
    CambiarContrasena1: TMenuItem;
    Utilidades1: TMenuItem;
    CalcularTasa1: TMenuItem;
    N7: TMenuItem;
    ControldeCobro1: TMenuItem;
    N8: TMenuItem;
    ActualizarActayEducacin1: TMenuItem;
    Timer1: TTimer;
    asaPromedioCaptaciones1: TMenuItem;
    Timer2: TTimer;
    L1: TMenuItem;
    RangosdeCaptacin1: TMenuItem;
    AsignarTarjetaDbito1: TMenuItem;
    ProcesosBalance1: TMenuItem;
    CausacionCDAT1: TMenuItem;
    CaptacionesporFechadeApertura1: TMenuItem;
    N9: TMenuItem;
    CuentasporEstado1: TMenuItem;
    N10: TMenuItem;
    InactivacindeCuentas1: TMenuItem;
    ConsignacinNacional1: TMenuItem;
    N11: TMenuItem;
    Observaciones1: TMenuItem;
    InformeAportesyAhorros1: TMenuItem;
    N12: TMenuItem;
    ActivacindeImagenes1: TMenuItem;
    N13: TMenuItem;
    CertificadodeReteFuente1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    ConsultaSolicitud1: TMenuItem;
    N14: TMenuItem;
    SeguroCredivida1: TMenuItem;
    N15: TMenuItem;
    arjetaDbito1: TMenuItem;
    Entregadas1: TMenuItem;
    Canceladas1: TMenuItem;
    Bloqueadas1: TMenuItem;
    N16: TMenuItem;
    CuentasconTarjeta1: TMenuItem;
    MovimientosdelDa1: TMenuItem;
    N17: TMenuItem;
    AdministracinTarjeta1: TMenuItem;
    SolicitarNuevasTarjetas1: TMenuItem;
    N18: TMenuItem;
    PromediodeCaptacion1: TMenuItem;
    InformedePersonasconErrorenFechadeNacimiento1: TMenuItem;
    ValidarHuella1: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    ListadosConsolidados1: TMenuItem;
    N21: TMenuItem;
    InformeAsociadossinDerechoaDetalle1: TMenuItem;
    Mnu050306: TMenuItem;
    Barrido1: TMenuItem;
    CausacinContractual1: TMenuItem;
    RenovacionCredivida1: TMenuItem;
    ConsultarListado1: TMenuItem;
    N22: TMenuItem;
    BarridoCredividas1: TMenuItem;
    IBSQL1: TIBSQL;
    RecuperarCredividas1: TMenuItem;
    raslados1: TMenuItem;
    EnviarPeticin1: TMenuItem;
    AnalizarPeticin1: TMenuItem;
    RealizarTraslado1: TMenuItem;
    ReporteTraslado1: TMenuItem;
    ExencinGMF1: TMenuItem;
    InformedeCaptacionesSaldadasyoCanceladas1: TMenuItem;
    ConsultaExtractosAosAnteriores1: TMenuItem;
    InformedeCuentasconSaldoNegativo1: TMenuItem;
    Gestiones1: TMenuItem;
    RequerimientoSistemas1: TMenuItem;
    Prueba1: TMenuItem;
    ControlContractuales1: TMenuItem;
    ConsultaProductosAgencias1: TMenuItem;
    N23: TMenuItem;
    ReportedePlsticos1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    N24: TMenuItem;
    CarneAhorroJuvenil1: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    EntregaSeguroJuvenil1: TMenuItem;
    SQLConnection1: TSQLConnection;
    SeguroJuvenil2: TMenuItem;
    ImprimirSeguro1: TMenuItem;
    AgregarPoliza1: TMenuItem;
    BarridoSeguroJuvenil1: TMenuItem;
    ConsultaSeguroJuvenil1: TMenuItem;
    PlanillaResumen1: TMenuItem;
    IngresoaAportes1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure CreacindeNuevaPersona1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure CrearCaptacin1Click(Sender: TObject);
    procedure ModificarCaptacin1Click(Sender: TObject);
    procedure RangosdeLibreta1Click(Sender: TObject);
    procedure ConsultaExtracto1Click(Sender: TObject);
    procedure LiquidacionInteresesCaptacion1Click(Sender: TObject);
    procedure RecuperarTablaLiquidacin1Click(Sender: TObject);
    procedure ProrrogaCaptacionesClick(Sender: TObject);
    procedure SaldarCaptacin1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ImprimirCaptacion1Click(Sender: TObject);
    procedure BtnManPersonaClick(Sender: TObject);
    procedure BtnCreacionCaptacionClick(Sender: TObject);
    procedure BtnRangosClick(Sender: TObject);
    procedure BtnImprimirCaptacionClick(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure ConsultarCaptacin1Click(Sender: TObject);
    procedure ComprobanteContableClick(Sender: TObject);
    procedure EstadosCaptacin1Click(Sender: TObject);
    procedure ListadoGeneraldeCaptaciones1Click(Sender: TObject);
    procedure Sumatorias1Click(Sender: TObject);
    procedure CambiarContrasena1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure CalcularTasa1Click(Sender: TObject);
    procedure ActualizarActayEducacin1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure asaPromedioCaptaciones1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure RangosdeCaptacin1Click(Sender: TObject);
    procedure CausacionCDAT1Click(Sender: TObject);
    procedure CaptacionesporFechadeApertura1Click(Sender: TObject);
    procedure InactivacindeCuentas1Click(Sender: TObject);
    procedure CuentasporEstado1Click(Sender: TObject);
    procedure ConsignacinNacional1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure InformeAportesyAhorros1Click(Sender: TObject);
    procedure ActivacindeImagenes1Click(Sender: TObject);
    procedure CertificadodeReteFuente1Click(Sender: TObject);
    procedure ConsultaSolicitud1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure SeguroCredivida1Click(Sender: TObject);
    procedure CuentasconTarjeta1Click(Sender: TObject);
    procedure Entregadas1Click(Sender: TObject);
    procedure Canceladas1Click(Sender: TObject);
    procedure Bloqueadas1Click(Sender: TObject);
    procedure MovimientosdelDa1Click(Sender: TObject);
    procedure AdministracinTarjeta1Click(Sender: TObject);
    procedure SolicitarNuevasTarjetas1Click(Sender: TObject);
    procedure PromediodeCaptacion1Click(Sender: TObject);
    procedure InformedePersonasconErrorenFechadeNacimiento1Click(
      Sender: TObject);
    procedure ValidarHuella1Click(Sender: TObject);
    procedure ListadosConsolidados1Click(Sender: TObject);
    procedure InformeAsociadossinDerechoaDetalle1Click(Sender: TObject);
    procedure Mnu050306Click(Sender: TObject);
    procedure Barrido1Click(Sender: TObject);
    procedure CausacinContractual1Click(Sender: TObject);
    procedure RenovacionCredivida1Click(Sender: TObject);
    procedure ConsultarListado1Click(Sender: TObject);
    procedure BarridoCredividas1Click(Sender: TObject);
    procedure RecuperarCredividas1Click(Sender: TObject);
    procedure EnviarPeticin1Click(Sender: TObject);
    procedure AnalizarPeticin1Click(Sender: TObject);
    procedure RealizarTraslado1Click(Sender: TObject);
    procedure ReporteTraslado1Click(Sender: TObject);
    procedure ExencinGMF1Click(Sender: TObject);
    procedure InformedeCaptacionesSaldadasyoCanceladas1Click(
      Sender: TObject);
    procedure ConsultaExtractosAosAnteriores1Click(Sender: TObject);
    procedure InformedeCuentasconSaldoNegativo1Click(Sender: TObject);
    procedure RequerimientoSistemas1Click(Sender: TObject);
    procedure RetirodeAsociado1Click(Sender: TObject);
    procedure Prueba1Click(Sender: TObject);
    procedure ControlContractuales1Click(Sender: TObject);
    procedure ConsultaProductosAgencias1Click(Sender: TObject);
    procedure ReportedePlsticos1Click(Sender: TObject);
    procedure CarneAhorroJuvenil1Click(Sender: TObject);
    procedure EntregaSeguroJuvenil1Click(Sender: TObject);
    procedure ImprimirSeguro1Click(Sender: TObject);
    procedure AgregarPoliza1Click(Sender: TObject);
    procedure BarridoSeguroJuvenil1Click(Sender: TObject);
    procedure ConsultaSeguroJuvenil1Click(Sender: TObject);
    procedure PlanillaResumen1Click(Sender: TObject);
    procedure IngresoaAportes1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    jpg:TJPEGImage;
    TheGraphic: TBitmap;    
    FUltimaActividad:TDateTime;    
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    function ExecAppWait(AppName, Params: string): Boolean;
  public
    { Public declarations }
    ruta1:string;
  end;

var
  frmMain: TfrmMain;

procedure LLamaFormulario(_sRuta,_sEmpleado:string); stdcall external 'Dll\EntregaSeguro.dll';

implementation

{$R *.dfm}

uses unitLogin, unitdmColocacion, IniFiles,
     UnitCreaciondePersona,unitConsultaProductos, unitCreacionCaptacion, UnitMantenimientoCaptacion, UnitRangosdeLibreta,
     unitConsultaExtractoCaptacion, UnitLiquidacionInteresesCaptacion,UnitRecuperarTablaLiquidacionCaptacion,
     UnitProrrogaCaptaciones, unitSaldarCaptacion,
     UnitImpresionCaptacion, UnitConsultaCaptacion,
     Unit_Comprobante, UnitEstadoCaptacion,
     UnitSumatorias, UnitCambiarContrasena, UnitControlCobroCartera,UnitCalculoTasas,
     UnitActayEducacion, UnitInformeTasaPromedio,UnitReLogin,
     UnitProyeccionPagoCDAT,UnitInformePorRangosCaptacion,
     UnitAsignarTarjetaDebitoN,unitCausacionCdat, UnitInformeGeneraldeCaptaciones,
     UnitListadoGeneralCaptaciones,UnitInactivacionCaptaciones, UnitInformeCuentasporEstado,
     UnitConsignacionNacional,UnitControldeObservaciones, UnitListadoCaptacionesConsolidado,
     UnitActivarImagenes, UnitLiquidacionGral,
     UnitCredivida, UnitInformeCuentasTarjeta, UnitInformeTarjetasEntregadas,
     UnitInformeTarjetasCanceladas, UnitInformeTarjetasBloqueadas, //*UnitInformeMovDia,*// UnitPedidoPlasticosGlobal,
     UnitPromedioCaptacion, UnitInformePersonasErrorFechaNacimiento,
     UnitValidarHuellaAsociado, UnitCaptacionesRe, UnitInformeAsociadosSinDetalle,
     UnitSaldosCuentasconTarjetaDebito, UnitBarridoTD,
     UnitCausacionContractual, UnitCertificaReteFuenteCap, UnitConsultarListado,
     UnitBarridoCredivida, UnitRecuperaCredivida, UnitPeticionTraslado,
     UnitEstudioTraslado, UnitRealizarTraslado, UnitRepTraslado, UnitExencionGMF,
     UnitInformeCuentasSaldadas, UnitConsultaExtractoCaptacionOtros,
     UnitCuentasSaldosNegativos, UnitCambios, UnitRetiroAsociado,
     UnitLiquidacionInteresesCaptacion1, UnitSeguroJuvenil,
     UnitControlContractual, UnitConsultaProductosAg,UnitInformePlasticos,
     UnitControlCarneJuvenil, UnitExencionGMF_MOD,
  UnitPedidoPlasticosGlobal, UnitImprimirSeguro, UnitAgregaPoliza,
  UnitConsultaJuvenil, UnitPlanillaConsolidada, UnitConsignacionAportes;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    //Role:string;
    Dias:Integer;
    Ufecha,Hoy:TDate;
//    frmConectando:TfrmConectando;
    jpg: TJpegImage;
    IdTime1:TIdTime;
    dmGeneral : TdmGeneral;
begin
  Application.OnMessage := AtraparMensajes;
  Timer1.Enabled := False;
  Timer2.Enabled := False;

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.200.2');
    DBPath := ReadString('DBNAME','path','/var/db/fbird/');
    DBname := ReadString('DBNAME','name','database.fdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCA�A N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',5);
    DBserver1 := ReadString('DBALTER','server','192.168.200.8');
    DBpath1   := ReadString('DBALTER','path','/var/db/fbird/');
    DBname1   := ReadString('DBALTER','name','database.fdb');
    host_equivida := ReadString('ADICIONALES','host_equivida','0.0.0.0');
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_barrido := ReadInteger('ADICIONALES','puerto_barrido',0);
  finally
    free;
  end;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CAPTACIONES';
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.IBDatabase1.Connected := false;
        while Not dmGeneral.IBDatabase1.Connected do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
                Exit;
           end;
          if frmLogin.ShowModal = mrOk then
           begin
             with frmLogin do
             begin
                DBAlias := EdUsuario.Text;
                DBPasabordo:= EdPasabordo.Text;
                Role := EdRole.Text;
                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
                Veces := Veces + 1;

                try
                    dmGeneral.IBDatabase1.Connected := True;
                    dmGeneral.IBTransaction1.Active := True;
                except
                        on E: Exception do
                        begin
                          if StrLIComp(PChar(E.Message),PChar('Your user name'),14) = 0 then
                           begin
                            Mensaje :='Verifique su Nombre y su Contrase�a' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Usuario Invalido'),MB_OK OR MB_ICONERROR);
                           end
                          else
                           begin
                            Mensaje := 'Verifique su Configuraci�n o Informe al Administrador de la Red' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Configuraci�n Erronea'),MB_OK OR MB_ICONERROR);
                           end;
                        end; //fin del begin de la excepci�n.
                end; // fin del try

             end; //fin del begin del with

            end // fin del begin del if superior
          else
          begin
             SalirMal := True;
             Exit;
          end;
         end; // fin del while


  IBSQL1.Database := dmGeneral.IBDatabase1;
  IBSQL1.Transaction := dmGeneral.IBTransaction1;
  with IBSQL1 do begin
    if Transaction.InTransaction then
       Transaction.Rollback;
    Transaction.StartTransaction;
    Close;
    SQL.Clear;
    SQL.Add('select * from "gen$minimos" where ID_MINIMO = 11');
    try
     ExecQuery;
    except
     Transaction.Rollback;
     raise;
    end;
    Dias := FieldByName('VALOR_MINIMO').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('select ULTIMO_CAMBIO_PASABORDO from "gen$empleado"');
    SQL.Add('where ID_EMPLEADO = :ID_EMPLEADO');
    ParamByName('ID_EMPLEADO').AsString := DBAlias;
    try
     ExecQuery;
    except
     Transaction.Rollback;
     raise;
    end;

    Ufecha := FieldByName('ULTIMO_CAMBIO_PASABORDO').AsDate;
    Transaction.Commit;
  end;   

  Ufecha := IncDay(Ufecha,Dias);
  FechaHoy := fFechaActual;
  Hoy:= fFechaActual;

  if Ufecha < Hoy then
  begin
   frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
   while not frmCambiarContrasena.Bien do
   begin
       frmCambiarContrasena.ShowModal;
   end;
  end;

  ShortDateFormat := 'yyyy/mm/dd';
  DecimalSeparator := '.';
  ThousandSeparator := ',';

  FUltimaActividad := Now;
  Timer1.Enabled := True;
  Timer2.Enabled := True;
  Empleado;
  Ruta := ExtractFilePath(Application.ExeName);
  ruta1 := Ruta;
{  jpg := TJPEGImage.Create;
  try
      jpg.LoadFromFile(Ruta+'crediservir.jpg');
    finally
      jpg.Free;
    end;
}
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\grafico.bmp');
  dmGeneral.Free;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin

           Action := caFree;
end;

procedure TfrmMain.ConfigurarImpresora1Click(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;



procedure TfrmMain.SalirdePSI1Click(Sender: TObject);
begin
        Close;
end;


procedure TfrmMain.CreacindeNuevaPersona1Click(Sender: TObject);
var frmCreacionPersona:TfrmCreacionPersona;
begin
        Timer2.Enabled := False;
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;

        Timer2.Enabled := True;
end;

procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
var frmConsultaProductos:TfrmConsultaProductos;
begin
       frmConsultaProductos := TfrmConsultaProductos.Create(Self);
       frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.CrearCaptacin1Click(Sender: TObject);
var frmCreacionCaptacion:TfrmCreacionCaptacion;
begin
        frmCreacionCaptacion := TfrmCreacionCaptacion.Create(self);
        frmCreacionCaptacion.ShowModal;
end;

procedure TfrmMain.ModificarCaptacin1Click(Sender: TObject);
var frmMantenimientoCaptacion:TfrmMantenimientoCaptacion;
begin
        frmMantenimientoCaptacion := TfrmMantenimientoCaptacion.Create(self);
        frmMantenimientoCaptacion.ShowModal;
end;

procedure TfrmMain.RangosdeLibreta1Click(Sender: TObject);
var frmRangosdeLibreta:TfrmRangosdeLibreta;
begin
        frmRangosdeLibreta := tfrmrangosdelibreta.Create(Self);
        frmrangosdelibreta.ShowModal;
end;

procedure TfrmMain.ConsultaExtracto1Click(Sender: TObject);
var frmConsultaExtractoCaptacion:TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmMain.LiquidacionInteresesCaptacion1Click(Sender: TObject);
var frmLiquidacionInteresesCaptacion:TfrmLiquidacionInteresesCaptacion;
begin
        Timer2.Enabled := False;
        frmLiquidacionInteresesCaptacion := TfrmLiquidacionInteresesCaptacion.Create(self);
        frmLiquidacionInteresesCaptacion.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.RecuperarTablaLiquidacin1Click(Sender: TObject);
var frmRecuperarTablaLiquidacionCaptacion:TfrmRecuperarTablaLiquidacionCaptacion;
begin
        frmRecuperarTablaLiquidacionCaptacion := TfrmRecuperarTablaLiquidacionCaptacion.Create(Self);
        frmRecuperarTablaLiquidacionCaptacion.ShowModal;
end;

procedure TfrmMain.ProrrogaCaptacionesClick(Sender: TObject);
var frmProrrogaCaptacion:TfrmProrrogaCaptacion;
begin
        frmProrrogaCaptacion := TfrmProrrogaCaptacion.Create(self);
        frmProrrogaCaptacion.ShowModal;
end;

procedure TfrmMain.SaldarCaptacin1Click(Sender: TObject);
var frmSaldarCaptacion:TfrmSaldarCaptacion;
begin
        frmSaldarCaptacion := TfrmSaldarCaptacion.Create(self);
        frmSaldarCaptacion.ShowModal;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar el M�dulo',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
{         with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
          finally
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
           end;
          end
}
            CanClose := True
        else
            CanClose := False
       else
           begin
            CanClose := True;
           end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'M�dulo Captaciones - ' + DBserver;
        if SalirMal then
           Self.Close;
end;

procedure TfrmMain.ImprimirCaptacion1Click(Sender: TObject);
var frmImpresionCaptacion:TfrmImpresionCaptacion;
begin
      frmImpresionCaptacion := TfrmImpresionCaptacion.Create(Self);
      frmImpresionCaptacion.ShowModal;
end;

procedure TfrmMain.BtnManPersonaClick(Sender: TObject);
begin
        CreacindeNuevaPersona1.Click;
end;

procedure TfrmMain.BtnCreacionCaptacionClick(Sender: TObject);
begin
        CrearCaptacin1.Click;
end;

procedure TfrmMain.BtnRangosClick(Sender: TObject);
begin
        RangosdeLibreta1.Click;
end;

procedure TfrmMain.BtnImprimirCaptacionClick(Sender: TObject);
begin
        ImprimirCaptacion1.Click;
end;

procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        ConsultaExtracto1.Click;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        ConsultadeGerencia1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
end;

procedure TfrmMain.ConsultarCaptacin1Click(Sender: TObject);
var frmConsultaCaptacion:TfrmConsultaCaptacion;
begin
        frmConsultaCaptacion := TfrmConsultaCaptacion.Create(Self);
        frmConsultaCaptacion.ShowModal;
end;

procedure TfrmMain.ComprobanteContableClick(Sender: TObject);
var frmComprobante:TfrmComprobante;
begin
       frmcomprobante := Tfrmcomprobante.Create(Self);
       frmcomprobante.ShowModal;
end;

procedure TfrmMain.EstadosCaptacin1Click(Sender: TObject);
var frmEstadoCaptacion :TfrmEstadoCaptacion;
begin

          frmEstadoCaptacion := TfrmEstadoCaptacion.Create(Self);
          frmEstadoCaptacion.ShowModal;

end;

procedure TfrmMain.ListadoGeneraldeCaptaciones1Click(Sender: TObject);
var frmInformeGeneraldeCaptaciones:TfrmInformeGeneraldeCaptaciones;
begin
        frmInformeGeneraldeCaptaciones:=TfrmInformeGeneraldeCaptaciones.Create(Self);
        frmInformeGeneraldeCaptaciones.ShowModal;
end;

procedure TfrmMain.Sumatorias1Click(Sender: TObject);
var frmSumatorias:TfrmSumatorias;
begin
    Timer2.Enabled := False;
    frmSumatorias := TfrmSumatorias.Create(Self);
    frmSumatorias.ShowModal;
    Timer2.Enabled := True;
end;

procedure TfrmMain.CambiarContrasena1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera:tfrmcontrolcobrocartera;
begin
    frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
    frmControlCobroCartera.Show;
end;

procedure TfrmMain.CalcularTasa1Click(Sender: TObject);
var frmCalculoTasas:TfrmCalculoTasas;
begin
        frmCalculoTasas := TfrmCalculoTasas.Create(Self);
        frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.ActualizarActayEducacin1Click(Sender: TObject);
var frmActayEducacion: TfrmActayEducacion;
begin
      frmactayeducacion := tfrmactayeducacion.Create(Self);
      frmactayeducacion.ShowModal;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
IdTime1:TIdTime;
begin
        IdTime1 := TIdTime.Create(nil);
      try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
        IdTime1.Disconnect;
      except
      end;
      IdTime1.Free;

end;

procedure TfrmMain.asaPromedioCaptaciones1Click(Sender: TObject);
var frmInformeTasaPromedio:TfrmInformeTasaPromedio;
begin
        frmInformeTasaPromedio := TfrmInformeTasaPromedio.Create(Self);
        frminformetasapromedio.ShowModal;
end;

procedure TfrmMain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;

end;


procedure TfrmMain.Timer2Timer(Sender: TObject);
var frmReLogin:TfrmReLogin;
    Pasabordo :string;
    ESPERA:Extended;
begin
  Timer2.Enabled := False;
  ESPERA := ((1 / 24 / 60) * DBMinutos);
  if (FUltimaActividad + ESPERA) < Now then begin
    frmReLogin := TfrmReLogin.Create(Self);
    if frmReLogin.ShowModal = mrOk then
    begin
     Pasabordo := frmReLogin.EdPasabordo.Text;
     if Pasabordo <> DBPasabordo then
      begin
        ShowMessage('Confirmaci�n no valida!, Cerrando el M�dulo');
        SalirMal := True;
        Close;
        Exit;
      end;
    end
    else
    begin
        SalirMal := True;
        Close;
        Exit;
    end;
  end;
  FUltimaActividad := Now;
  Timer2.Enabled := True;

end;


procedure TfrmMain.L1Click(Sender: TObject);
var frmProyeccionPagoCDAT:TfrmProyeccionPagoCDAT;
begin
    frmProyeccionPagoCDAT := TfrmProyeccionPagoCDAT.Create(Self);
    frmProyeccionPagoCDAT.ShowModal;
end;

procedure TfrmMain.RangosdeCaptacin1Click(Sender: TObject);
var frmInformeCaptacionesporRango:TfrmInformeCaptacionesporRango;
begin
    frmInformeCaptacionesporRango := TfrmInformeCaptacionesporRango.Create(self);
    frmInformeCaptacionesporRango.ShowModal;
end;

procedure TfrmMain.CausacionCDAT1Click(Sender: TObject);
var frmcausacioncdat : Tfrmcausacioncdat;
begin
        frmcausacioncdat := Tfrmcausacioncdat.Create(Self);
        frmcausacioncdat.ShowModal;
end;

procedure TfrmMain.CaptacionesporFechadeApertura1Click(Sender: TObject);
var frmListadoGeneralCaptaciones:TfrmListadoGeneralCaptaciones;
begin
        frmListadoGeneralCaptaciones := TfrmListadoGeneralCaptaciones.Create(Self);
        frmListadoGeneralCaptaciones.ShowModal;
end;

procedure TfrmMain.InactivacindeCuentas1Click(Sender: TObject);
var frmInactivacionCaptaciones:TfrmInactivacionCaptaciones;
begin
        if ValidarOpcion(TMenuItem(Sender).Tag) then begin
           frmInactivacionCaptaciones := TfrmInactivacionCaptaciones.Create(Self);
           frmInactivacionCaptaciones.ShowModal;
        end;
end;

procedure TfrmMain.CuentasporEstado1Click(Sender: TObject);
var frmInformeCuentasporEstado:TfrmInformeCuentasporEstado;
begin
        frmInformeCuentasporEstado := TfrmInformeCuentasporEstado.Create(Self);
        frmInformeCuentasporEstado.ShowModal;
end;

procedure TfrmMain.ConsignacinNacional1Click(Sender: TObject);
var frmConsignacionNacional: TfrmConsignacionNacional;
begin
        frmConsignacionNacional := TfrmConsignacionNacional.Create(Self);
        frmConsignacionNacional.ShowModal;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
    frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
    frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.InformeAportesyAhorros1Click(Sender: TObject);
var frmListadoCaptacionesConsolidado : TfrmListadoCaptacionesConsolidado;
begin
        Timer2.Enabled := False;
        frmListadoCaptacionesConsolidado := TfrmListadoCaptacionesConsolidado.Create(Self);
        frmListadoCaptacionesConsolidado.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.ActivacindeImagenes1Click(Sender: TObject);
var frmActivarImagenes:TfrmActivarImagenes;
begin
      if ValidarOpcion(TMenuItem(Sender).Tag) then
      begin
        frmActivarImagenes := TfrmActivarImagenes.Create(Self);
        frmActivarImagenes.ShowModal;
      end;
end;

procedure TfrmMain.CertificadodeReteFuente1Click(Sender: TObject);
var frmCertificaReteFuenteCap:TfrmCertificaReteFuenteCap;
begin
      if ValidarOpcion(TMenuItem(Sender).Tag) then
      begin
        frmCertificaReteFuenteCap:=TfrmCertificaReteFuenteCap.Create(Self);
        frmCertificaReteFuenteCap.ShowModal;
      end;
end;

procedure TfrmMain.ConsultaSolicitud1Click(Sender: TObject);
//var frmConsultaSol : TfrmConsultaSol;
begin
//        FrmConsultaSol := TfrmConsultaSol.Create(Self);
//        FrmConsultaSol.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquidacionGral : TfrmLiquidacionGral;
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.SeguroCredivida1Click(Sender: TObject);
begin
        FrmCredivida := TFrmCredivida.Create(Self);
        FrmCredivida.es_renovacion := False;
        FrmCredivida.ShowModal;
end;

procedure TfrmMain.CuentasconTarjeta1Click(Sender: TObject);
var
  frmTarjetasEstado : TfrmTarjetasEstado;
begin
  frmTarjetasEstado := TfrmTarjetasEstado.Create(Self);
  frmTarjetasEstado.ShowModal;
end;

procedure TfrmMain.Entregadas1Click(Sender: TObject);
var
  frmTarjetasEntregadas:TfrmTarjetasEntregadas;
begin
  frmTarjetasEntregadas := TfrmTarjetasEntregadas.Create(Self);
  frmTarjetasEntregadas.ShowModal;
end;

procedure TfrmMain.Canceladas1Click(Sender: TObject);
var
  frmTarjetasCanceladas :TfrmTarjetasCanceladas;
begin
  frmTarjetasCanceladas := TfrmTarjetasCanceladas.Create(Self);
  frmTarjetasCanceladas.ShowModal;
end;

procedure TfrmMain.Bloqueadas1Click(Sender: TObject);
var
  frmTarjetasBloqueadas:TfrmTarjetasBloqueadas;
begin
  frmTarjetasBloqueadas := TfrmTarjetasBloqueadas.Create(Self);
  frmTarjetasBloqueadas.ShowModal;
end;

procedure TfrmMain.MovimientosdelDa1Click(Sender: TObject);
//var
//   frmInformeMovDia:TfrmInformeMovDia;
begin
  if ValidarOpcion((Sender as TMenuItem).Tag) then
  begin
//   frmInformeMovDia := TfrmInformeMovDia.Create(Self);
//   frmInformeMovDia.ShowModal;
  end;
end;

procedure TfrmMain.AdministracinTarjeta1Click(Sender: TObject);
var frmAsignarTarjetaDebitoN:TfrmAsignarTarjetaDebitoN;
begin
        frmAsignarTarjetaDebitoN := TfrmAsignarTarjetaDebitoN.Create(Self);
        frmAsignarTarjetaDebitoN.ShowModal;
end;

procedure TfrmMain.SolicitarNuevasTarjetas1Click(Sender: TObject);
var
  frmPedidoPlasticos:TfrmPedidoPlasticosGlobal;
begin
//        if ValidarOpcion((Sender as TMenuItem).Tag) then
//        begin
          frmPedidoPlasticosGlobal := TfrmPedidoPlasticosGlobal.Create(Self);
          frmPedidoPlasticosGlobal.ShowModal;
//        end;
end;

procedure TfrmMain.PromediodeCaptacion1Click(Sender: TObject);
var
  frmPromedio :TfrmPromedio;
begin
      frmPromedio := TfrmPromedio.Create(Self);
      frmPromedio.ShowModal;
end;

procedure TfrmMain.InformedePersonasconErrorenFechadeNacimiento1Click(
  Sender: TObject);
var frmInfPerErrFecNac:TfrmInfPerErrFecNac;
begin
    frmInfPerErrFecNac := TfrmInfPerErrFecNac.Create(Self);
    frmInfPerErrFecNac.ShowModal;
end;

procedure TfrmMain.ValidarHuella1Click(Sender: TObject);
var frmValidarHuellaAsociado:TfrmValidarHuellaAsociado;
begin
    frmValidarHuellaAsociado := TfrmValidarHuellaAsociado.Create(Self);
    frmValidarHuellaAsociado.ShowModal;
end;

procedure TfrmMain.ListadosConsolidados1Click(Sender: TObject);

begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
         Timer2.Enabled := False;
         frmcaptacionesre := tfrmcaptacionesre.Create(Self);
         frmcaptacionesre.ShowModal;
         Timer2.Enabled := True;
        end;

end;

procedure TfrmMain.InformeAsociadossinDerechoaDetalle1Click(
  Sender: TObject);
var
  frmInformeAsociadosSinDetalle:TfrmInformeAsociadossinDetalle;
begin
  frmInformeAsociadosSinDetalle:=TfrmInformeAsociadossinDetalle.Create(Self);
  frminformeasociadossindetalle.ShowModal;
end;

procedure TfrmMain.Mnu050306Click(Sender: TObject);
var
  frmSaldosCuentasconTarjetaDebito:TfrmSaldosCuentasconTarjetaDebito;
begin
        frmSaldosCuentasconTarjetaDebito := TfrmSaldosCuentasconTarjetaDebito.Create(Self);
        frmSaldosCuentasconTarjetaDebito.ShowModal;
end;

procedure TfrmMain.Barrido1Click(Sender: TObject);
begin
        FrmBarridoTD := TFrmBarridoTD.Create(Self);
        FrmBarridoTD.ShowModal;
end;

procedure TfrmMain.CausacinContractual1Click(Sender: TObject);
begin
        FrmCausacionContractual := TFrmCausacionContractual.Create(Self);
        FrmCausacionContractual.ShowModal;
end;

procedure TfrmMain.RenovacionCredivida1Click(Sender: TObject);
begin
        FrmCredivida := TFrmCredivida.Create(Self);
        FrmCredivida.es_renovacion := True;
        FrmCredivida.EDcert.Enabled := True;
        FrmCredivida.ShowModal;

end;

procedure TfrmMain.ConsultarListado1Click(Sender: TObject);
var
 frmVerListados:TfrmVerListados;
begin
        frmVerListados := TfrmVerlistados.Create(Self);
        frmVerListados.ShowModal;
end;

procedure TfrmMain.BarridoCredividas1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmBarridoCredivida := TFrmBarridoCredivida.Create(self);
          FrmBarridoCredivida.ShowModal;
        end;
end;

procedure TfrmMain.RecuperarCredividas1Click(Sender: TObject);
begin
        FrmRecuperaCredivida := TFrmRecuperaCredivida.Create(Self);
        FrmRecuperaCredivida.ShowModal
end;

procedure TfrmMain.EnviarPeticin1Click(Sender: TObject);
begin
        FrmPeticionTraslado := TFrmPeticionTraslado.Create(Self);
        FrmPeticionTraslado.ShowModal;
end;

procedure TfrmMain.AnalizarPeticin1Click(Sender: TObject);
begin
        FrmEstudioTraslado := TFrmEstudioTraslado.Create(Self);
        FrmEstudioTraslado.ShowModal;
end;

procedure TfrmMain.RealizarTraslado1Click(Sender: TObject);
var
  Parametros : string;
begin
  Parametros := dbalias;
  Parametros := Parametros + ' ' + AnsiReplaceStr(Empresa,' ','#');
  Parametros := Parametros + ' ' + Nit;
  Parametros := Parametros + ' ' + AnsiReplaceStr(UnitGlobales.extrae_empleado,' ','#');
  self.ExecAppWait('.\traslados\cliente\ClienteTraslados.exe',Parametros);
  //FrmRealizarTraslado := TFrmRealizarTraslado.Create(Self);
  //FrmRealizarTraslado.ShowModal;

end;

procedure TfrmMain.ReporteTraslado1Click(Sender: TObject);
begin
        FrmRepTraslado := TFrmRepTraslado.Create(Self);
        FrmRepTraslado.ShowModal;
end;

procedure TfrmMain.ExencinGMF1Click(Sender: TObject);
var
  frmExencionGMFmod:TfrmExencionGMFmod;
begin
       frmExencionGMFmod  := TfrmExencionGMFmod.Create(Self);
       frmExencionGMFmod.ShowModal;
end;

procedure TfrmMain.InformedeCaptacionesSaldadasyoCanceladas1Click(
  Sender: TObject);
var
   frmInformeCuentasSaldadas: TfrmInformeCuentasSaldadas;
begin
        frmInformeCuentasSaldadas := TfrmInformeCuentasSaldadas.Create(Self);
        frmInformeCuentasSaldadas.ShowModal;
end;

procedure TfrmMain.ConsultaExtractosAosAnteriores1Click(Sender: TObject);
 var
   frmConsultaExtractoCaptacionOtros : TfrmConsultaExtractoCaptacionOtros;
begin
       frmConsultaExtractoCaptacionOtros := TfrmConsultaExtractoCaptacionOtros.Create(Self);
       frmConsultaExtractoCaptacionOtros.ShowModal;
end;

procedure TfrmMain.InformedeCuentasconSaldoNegativo1Click(Sender: TObject);
var
  frmCuentasSaldosNegativos:TfrmCuentasSaldosNegativos;
begin
  frmCuentasSaldosNegativos := TfrmCuentasSaldosNegativos.Create(Self);
  frmCuentasSaldosNegativos.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.RetirodeAsociado1Click(Sender: TObject);
var
  frmRetiroAsociado:TfrmRetiroAsociado;
begin
        frmRetiroAsociado := TfrmRetiroAsociado.Create(Self);
        frmRetiroAsociado.ShowModal;
end;

procedure TfrmMain.Prueba1Click(Sender: TObject);
begin
        frmLiquidacionInteresesCaptacion1 := TfrmLiquidacionInteresesCaptacion1.Create(self);
        frmLiquidacionInteresesCaptacion1.ShowModal;

end;

procedure TfrmMain.ControlContractuales1Click(Sender: TObject);
begin
        FrmControlContractual := TFrmControlContractual.Create(Self);
        FrmControlContractual.ShowModal;
        FrmControlContractual.Free;
end;

procedure TfrmMain.ConsultaProductosAgencias1Click(Sender: TObject);
begin
        frmConsultaProductosAg := TfrmConsultaProductosAg.Create(Self);
        frmConsultaProductosAg.ShowModal;
end;

procedure TfrmMain.ReportedePlsticos1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
         begin
           frmInformePlasticos := TfrmInformePlasticos.Create(Self);
           frmInformePlasticos.ShowModal;
         end;
end;

procedure TfrmMain.CarneAhorroJuvenil1Click(Sender: TObject);
begin
        FrmControlCarneJuvenil := TFrmControlCarneJuvenil.Create(Self);
        FrmControlCarneJuvenil.ShowModal;
        FrmControlCarneJuvenil.Free;
end;

procedure TfrmMain.EntregaSeguroJuvenil1Click(Sender: TObject);
begin
    LLamaFormulario(DBserver + ':' + DBpath + DBname,DbAlias);
end;

procedure TfrmMain.ImprimirSeguro1Click(Sender: TObject);
begin
        FrmImprimirSeguro := TFrmImprimirSeguro.Create(Self);
        FrmImprimirSeguro.ShowModal;
end;

procedure TfrmMain.AgregarPoliza1Click(Sender: TObject);
begin
        FrmAgregaPoliza := TFrmAgregaPoliza.Create(Self);
        FrmAgregaPoliza.ShowModal;
end;

procedure TfrmMain.BarridoSeguroJuvenil1Click(Sender: TObject);
begin
        frmSeguroJuvenil := TfrmSeguroJuvenil.Create(Self);
        frmSeguroJuvenil.ShowModal;
end;

procedure TfrmMain.ConsultaSeguroJuvenil1Click(Sender: TObject);
begin
        FrmConsultaJuvenil := TFrmConsultaJuvenil.Create(Self);
        FrmConsultaJuvenil.ShowModal;
end;

function TfrmMain.ExecAppWait(AppName, Params: string): Boolean;
var
  ShellExInfo: TShellExecuteInfo; // structure containing and receiving info about application to start
begin
 FillChar(ShellExInfo, SizeOf(ShellExInfo), 0);
 with ShellExInfo do begin
    cbSize := SizeOf(ShellExInfo);
    fMask := see_Mask_NoCloseProcess;
    Wnd := Application.Handle;
    lpFile := PChar(AppName);
    lpParameters := PChar(Params);
    nShow := sw_ShowNormal;
 end;
  Result := ShellExecuteEx(@ShellExInfo);
  WaitForSingleObject(ShellExInfo.hProcess, INFINITE);
  CloseHandle(ShellExInfo.hProcess);

end;

procedure TfrmMain.PlanillaResumen1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmPlanillaConsolidada := TFrmPlanillaConsolidada.Create(Self);
          FrmPlanillaConsolidada.ShowModal;
        end;
end;

procedure TfrmMain.IngresoaAportes1Click(Sender: TObject);
var
  frmConsignacionAportes: TfrmConsignacionAportes;
begin
  frmConsignacionAportes := TfrmConsignacionAportes.Create(self);
  frmConsignacionAportes.ShowModal;
end;

end.
