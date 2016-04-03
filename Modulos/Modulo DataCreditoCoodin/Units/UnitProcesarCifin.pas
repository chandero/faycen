unit UnitProcesarCifin;

interface
                                                  
uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet, JclStrings,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient, UnitDmGeneral;

type
  TfrmProcesarCifin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSNoCredito: TIBSQL;
    IBSClientes: TIBSQL;
    IBSCodeudores: TIBSQL;
    IBSCuotas: TIBSQL;
    IBQuery2: TIBQuery;
    ClientDataSet1: TClientDataSet;
    DataErrores: TClientDataSet;
    DataErroresCOLOCACION_ERRADO: TStringField;
    DataErroresIDENTIFICACION: TStringField;
    DataErroresAGENCIA: TIntegerField;
    DataErroresCOLOCACION_CORRECTO: TStringField;
    ClientDataSet1NUMERO: TStringField;
    ClientDataSet1IDENTIFICACION: TStringField;
    ClientDataSet1NOMBRE: TStringField;
    ClientDataSet1FNACIM: TStringField;
    ClientDataSet1FAPERT: TStringField;
    ClientDataSet1FVENCI: TStringField;
    ClientDataSet1VCUOTA: TStringField;
    Ed1: TEdit;
    OpenDialog1: TOpenDialog;
    CheckBox3: TCheckBox;
    IBSDireccion: TIBSQL;
    IBSMunicipio: TIBSQL;
    lblColocacion: TLabel;
    CheckBox4: TCheckBox;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    procedure PrimerPaso;
    procedure SegundoPaso;
    procedure TercerPaso;
    procedure SegundoPaso2;
    { Private declarations }
  public
    { Public declarations }
  end;


type Registro1 = Record
    TRegistro_1:string; // * 1 N  Tipo de Registro Tabla 21
    TPaquete_2:string; // * 2 N  Tipo de Paquete Tabla 22
    TEntidad_3:string; // * 3 N   Tipo de Entidad Tabla 29
    CEntidad_3:string; // * 3 N   Código Entidad Tabla 30
    Reservado_10:string; // * 10 A Reservado
    TReporte_2:string; // * 2 N  Tipo de Reporte Tabla 23
    FCorte_8:string; // * 8 Fecha
end;

type Registro2 = class
    TRegistro_1:string; // * 1 N  Tipo de Registro
    TIdentificacion_2:String; // * 2 N Tipo de Identificación
    NumeroIdentificacion_15:String; // * 15 Número de Identificacion
    NombreTitular_60:String;// * 60 Nombre
    Reservado_10:String;// * 10 Reservado N/A
    NumeroObligacion_20:String;// * 20 Número de la Obligación
    CodigoSucursal_6:String;// * 6 Codigo Sucursal
    Calidad_1:String;// * 1 Calidad de la Obligacion  Tabla 1
    Calificacion_2:String;// * 2 Calificacion Tabla 7
    EstadoTitular_2:String;// * 2 Estado Titular Tabla 24
    Estado_2:String;// * 2 Estado Obligacion Tabla 10
    EdadMora_2:String;// * 2 Edad Mora Tabla 8
    AnosMora_2Op:String;// * 2 Años en Mora Opcional
    FechaCorte_8:String;// * 8 Fecha de Corte del Reporte
    FechaInicial_8:String;// * 8 Fecha Desembolso
    FechaFinal_8:String;// * 8 Fecha Vencimiento Final
    FechaExigibilidad_8Op:String;// * 8 Fecha de Exigibilidad Opcional 00000000
    FechaPrescipcion_8Op:String;// * 8 Fecha de Prescripcion Opcional 00000000
    FechaPago_8Op:String;// * 8 Fecha de Pago Opcional 00000000
    ModoExtincion_2Op:String;// * 2 Modo Extincion Tabla 9
    TipoPago_2Op: String;// * 2  Tipo de Pago Opcional Tabla 31
    PeriodicidadPago_2:String;// * 2 Periodicidad de Pago
    ProbabilidadNoPago_3Op:String;// * 3 Probabilidad de No Pago Opcional
    NCuotasPagadas_3:String;// * 3 Numero de Cuotas Pagadas
    NCuotasPactadas_3Op:String;// * 3 Numero de Cuotas Pactadas Opcional
    NCuotasMora_3Op:String;// * 3 Numero de Cuotas en Mora Opcional
    ValorCupo_12:String;// * 12 Valor o Cupo
    ValorMora_12:String;// * 12 Valor en Mora
    ValorSaldo_12:String;// * 12 Valor del Saldo de la Obligacion
    ValorCuota_12:String;// * 12 Valor de la Cuota del Crédito
    ValorFijo_12NA:String;// * 12 No Aplica
    LineaCredito_3:String;// * 3 Linea de Credito Tabla 3
    ClausulaPermanencia_3NA:String;// * 3 No aplica
    TipoContrato_3Op:String;// * 3 Tipo de Contrato Tabla 25
    EstadoContrato_3Op:String;// * 3 Estado Contrato Tabla 26
    VigenciaContrato_2NA:String;// * 2 No Aplica
    MesesContrato_3NA:String;// * 3 No Aplica
    NaturalezaJuridica_3:String;// * 3 Tabla 19
    ModalidadCredito_2:String;// * 2 Modalidad Tabla 2
    TipoMoneda_2:String;// * 2 Tipo Moneda Tabla 5
    TipoGarantia_2:String;// * 2 Tipo Garantia Tabla 4
    ValorGarantia_12Op:String;// * 12 Valor Garantia Opcional
    Reestructurada_2Op:String;// * 2 Obligacion Reestructurada Opcional Tabla 32
    NaturalezaRestructuracion_2Op: String;// * 2  Naturaleza de la Reestructuracion Opcional Tabla 11
    NumeroReesructuraciones_3Op: String;// * 3
    ClaseTarjeta_2NA:String;// * 2 No Aplica
    NChequesDevueltos_4NA:String;// * 4 No Aplica
    CategoriaServicio_2NA:String;// * 2 No Aplica
    Plazo_2NA:String;// * 2 No Aplica
    DiasCartera_6NA:String;// * 6 No Aplica
    TipoCuenta_2NA:String;// * 2 No Aplica
    CupoSobregiro_12NA:String;// * 12 No Aplica
    DiasAutorizados_3NA:String;// * 3 No Aplica
    DireccionCasa_60Op:String;// * 60 Direccion Casa Titular Opcional
    TelefonoCasa_20Op:String;// * 20 Telefono Casa Titular Opcional
    CodigoCiudadCasa_6Op:String;// * 6 Codigo Ciudad Casa Opcional
    CiudadCasa_20Op:String;// * 20 Ciudad Casa Titular Opcional
    CodigoDeptoCasa_3Op:String;// * 3 Codigo Departamento Casa Titular Opcional
    DeptoCasa_20Op:String;// * 20 Departamento Casa Titular Opcional
    NombreEmpresa_60Op:String;// * 60 Nombre Empresa Opcional
    DireccionEmpresa_60Op:String;// * 60 Direccion Empresa Opcional
    TelefonoEmpresa_20Op:String;// * 20 Telefono Empresa
    CodigoCiudadEmpresa_6Op:String;// * 6 Codigo Ciudad Empresa Opcional
    CiuadadEmpresa_20Op:String;// * 20 Ciudad Empresa Opcional
    CodigoDeptoEmpresa_3Op:String;// * 3 Codigo Departamento Empresa Opcional
    DeptoEmpresa_20Op:String;// * 20 Departamento Empresa Titular Opcional
    FechaInicioGMF_8NA:String;// * 8 Fecha Inicio GMF No Aplica
    FechaFinGMF_8NA:String;// * 8 Fecha Fin GMF No Aplica
    NRenovacionCDT_2NA:String;// * 2 NA
    CtaExcGMF_2NA:String;// * 2 NA
    TIOriginaria_2NA:String;// * 2 NA
    NIOriginaria_14NA:String;// * 14 NA
    TEOriginaria_3Op:String;// * 3 Tipo Entidad Originaria Opcional
    CEOriginaria_3Op:String;// * 3 Codigo Entidad Originaria Opcional
    TipoFideicomiso_2NA:String;// * 2 Tipo Fideicomiso NA
    NumeroFideicomiso_12NA:String;// * 12 Numero Fideicomiso NA
    NombreFideicomiso_60NA:String;// * 60 Nombre Fideicomiso NA
    TipoDeudaCartera_4NA:String;// * 4 NA
    TipoPoliza_4NA:String;// * 4 NA
    CodigoRamo_6NA:String;// * 6 NA
    function toString():String;
end;

type Registro3 = Record

end;

type Registro4 = Record

end;

type Registro9 = Record
    TipoRegistro_1:String;// * 1 Tipo Registro Tabla 21
    NumeroRegistros_8:String;// * 8 Numero de Registros incluye tipo 1 y tipo 9
    NumeroRegistros2_8:String;// * 8 Numero de Registros Tipo 2
    NumeroRegistros3_8:String;// * 8 Numero de Registros Tipo 3
    NumeroRegistros4_8:String;// * 8 Numero de Registros Tipo 4
end;

var
  frmProcesarCifin: TfrmProcesarCifin;
  dmGeneral: TdmGeneral;
  PlanoMovimientos:TStringList;
  SumaRegistros:Integer;
  SumaObligaciones:Integer;
  MesCorteAct:string;
  MesCorteAnt:string;
  Mes : Integer;
  MesAnt : string;
  MesAct : String;
  FechaAnt : TDate;
  PlanoE, PlanoF:String;
implementation

{$R *.dfm}

uses UnitGlobalesCol, UnitMuestroArchivoCifin, UnitGlobales;

procedure TfrmProcesarCifin.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProcesarCifin.PrimerPaso;
var cadena:string;
    LineaE:Registro1;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      LineaE.TRegistro_1 := '1';
      LineaE.TPaquete_2 := '21';
      LineaE.TEntidad_3 := '123';
      LineaE.CEntidad_3 := '130';
      LineaE.Reservado_10 := '          ';
      LineaE.TReporte_2 := '01';
      LineaE.FCorte_8 := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[dayOf(EdFechaCorte.Date)]);

      PlanoE := (LineaE.TRegistro_1 + LineaE.TPaquete_2 + LineaE.TEntidad_3+
                          LineaE.CEntidad_3 + LineaE.Reservado_10 + LineaE.TReporte_2 + LineaE.FCorte_8);
                          
      CheckBox1.Checked := True;
end;

procedure TfrmProcesarCifin.SegundoPaso;
var cadena:string;
    LineaC, LineaO:Registro2;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;
    EdadAct:String;
    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
    TipoCuota: Integer;
    Amortizacion: Integer;
    Plazo: Integer;
begin
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
           dmGeneral.IBTransaction1.StartTransaction;

        LineaC := Registro2.Create;
        SumaRegistros := 0;
        SumaObligaciones := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$causaciondiaria" where FECHA_CORTE = :"FECHA_CORTE"');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiaria" where FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             SumaObligaciones := SumaObligaciones + 1;
             Bar.Position := RecNo;
             lblColocacion.Caption := IBQuery1.FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             LineaC.TRegistro_1 := '2';
             case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TIdentificacion_2 := '01';
               4 : LineaC.TIdentificacion_2 := '02';
               6 : LineaC.TIdentificacion_2 := '03';
               2 : LineaC.TIdentificacion_2 := '04';
               8 : LineaC.TIdentificacion_2 := '05';
               7 : LineaC.TIdentificacion_2 := '07';
               1 : LineaC.TIdentificacion_2 := '09';
               0 : LineaC.TIdentificacion_2 := '01';
             end;

             Identificacion := Format('%15s',[LeftStr(Trim(IBQuery1.FieldByName('ID_PERSONA').AsString),15)]);
             if (Pos('-',Identificacion) > 0) then
              Identificacion := Format('%15s', [LeftStr(Identificacion,13)]);
             Identificacion := Format('%15s',[Identificacion]);
             StrReplace(Identificacion, ' ', '0',[rfIgnoreCase, rfReplaceAll]);
             LineaC.NumeroIdentificacion_15 := Identificacion;


             with IBSClientes do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                  SQL.Add('"col$colocacion".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE');
                  SQL.Add('from "col$colocacion"');
                  SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
             end;

             Nombre := Format('%-60s',[LeftStr(Trim(IBSClientes.FieldByName('PRIMER_APELLIDO').AsString)+ ' '+
             Trim(IBSClientes.FieldByName('SEGUNDO_APELLIDO').AsString)+ ' ' +
             Trim(IBSClientes.FieldByName('NOMBRE').AsString),60)]);
             LineaC.NombreTitular_60 := Nombre;


              LineaC.Reservado_10 := Format('%-10s',[' ']);

              ColocacionActual := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              if (LeftStr(ColocacionActual,4) = '1020') then
              // Numeración Antigua
              begin
                 ColocacionNew := 'FAP' + MidStr(ColocacionActual,5,6) + '-0';
              end
              else
              // Numeración Nueva
              begin
                 ColocacionNew := ColocacionActual;
              end;

              LineaC.NumeroObligacion_20 := Format('%20s',[ColocacionNew]);
              LineaC.CodigoSucursal_6 := Format('%.6d',[IBQuery1.FieldByName('ID_AGENCIA').AsInteger]);
              LineaC.Calidad_1 := 'P';
               LineaC.Calificacion_2 := '05';
              EdadAct := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
              if (EdadAct = 'A') then LineaC.Calificacion_2 := '01'
              else if (EdadAct = 'B') then LineaC.Calificacion_2 := '02'
              else if (EdadAct = 'C') then LineaC.Calificacion_2 := '03'
              else if (EdadAct = 'D') then LineaC.Calificacion_2 := '04'
              else
                LineaC.Calificacion_2 := '05';

              LineaC.EstadoTitular_2 := '06';

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT * FROM "col$colocacion" WHERE ');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBQuery2.Open;

              case IBQuery2.FieldByName('ID_ESTADO_COLOCACION').AsInteger of
                0: LineaC.Estado_2 := '01';
                1: LineaC.Estado_2 := '01';
                2: LineaC.Estado_2 := '04';
                3: LineaC.Estado_2 := '06';
                else
                  LineaC.Estado_2 := '01';
              end;


              DiasMora := IBQuery1.FieldByName('MOROSIDAD').AsInteger;
              if (DiasMora < 30) then LineaC.EdadMora_2 :=  '00'
              else if (DiasMora < 60) then LineaC.EdadMora_2 := '01'
              else if (DiasMora < 90) then LineaC.EdadMora_2 := '02'
              else if (DiasMora < 120) then LineaC.EdadMora_2 := '03'
              else if (DiasMora < 150) then LineaC.EdadMora_2 := '04'
              else if (DiasMora < 180) then LineaC.EdadMora_2 := '05'
              else if (DiasMora < 210) then LineaC.EdadMora_2 := '06'
              else if (DiasMora < 240) then LineaC.EdadMora_2 := '07'
              else if (DiasMora < 270) then LineaC.EdadMora_2 := '08'
              else if (DiasMora < 300) then LineaC.EdadMora_2 := '09'
              else if (DiasMora < 330) then LineaC.EdadMora_2 := '10'
              else if (DiasMora < 360) then LineaC.EdadMora_2 := '11'
              else if (DiasMora < 540) then LineaC.EdadMora_2 := '12'
              else if (DiasMora < 730) then LineaC.EdadMora_2 := '13'
              else LineaC.EdadMora_2 := '14';

              LineaC.AnosMora_2Op := Format('%.2d',[DiasMora div 360]);
              LineaC.FechaCorte_8 := FormatDateTime('yyyymmdd',EdFechaCorte.DateTime);
              LineaC.FechaInicial_8 := FormatDateTime('yyyymmdd', IBQuery2.FieldByName('FECHA_DESEMBOLSO').AsDateTime);
              LineaC.FechaFinal_8 := FormatDateTime('yyyymmdd', IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
              LineaC.FechaExigibilidad_8Op := '        ';
              LineaC.FechaPrescipcion_8Op := '        ';
              LineaC.FechaPago_8Op := '        ';
              LineaC.ModoExtincion_2Op := '  ';
              LineaC.TipoPago_2Op := '  ';

              TipoCuota := IBQuery2.FieldByName('ID_TIPO_CUOTA').AsInteger;
              Amortizacion := IBQuery2.FieldByName('AMORTIZA_INTERES').AsInteger;
              Plazo := IBQuery2.FieldByName('PLAZO_COLOCACION').AsInteger;
              // Cuota Fija
              if (TipoCuota  = 1) then
              begin
                 if (Amortizacion = Plazo) then LineaC.PeriodicidadPago_2 := '22'
                 else
                 case Amortizacion of
                 07: LineaC.PeriodicidadPago_2 := '02';
                 15: LineaC.PeriodicidadPago_2 := '05';
                 30: LineaC.PeriodicidadPago_2 := '08';
                 60: LineaC.PeriodicidadPago_2 := '11';
                 90: LineaC.PeriodicidadPago_2 := '14';
                180: LineaC.PeriodicidadPago_2 := '17';
                360: LineaC.PeriodicidadPago_2 := '20';
                else
                  LineaC.PeriodicidadPago_2 := '23';
                end;
              end
              // Cuota Variable
              else
              if (Amortizacion = Plazo) then LineaC.PeriodicidadPago_2 := '22'
              else
              begin
                 case Amortizacion of
                 07: LineaC.PeriodicidadPago_2 := '03';
                 15: LineaC.PeriodicidadPago_2 := '06';
                 30: LineaC.PeriodicidadPago_2 := '09';
                 60: LineaC.PeriodicidadPago_2 := '12';
                 90: LineaC.PeriodicidadPago_2 := '15';
                180: LineaC.PeriodicidadPago_2 := '18';
                360: LineaC.PeriodicidadPago_2 := '21';
                else
                  LineaC.PeriodicidadPago_2 := '23';
                end;
              end;

              LineaC.ProbabilidadNoPago_3Op := '   ';

              IBSCuotas.Close;
              IBSCuotas.SQL.Clear;
              IBSCuotas.SQL.Add('select count(*) as CUOTAS_PAGAS from "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and PAGADA = :PAGADA');
              IBSCuotas.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSCuotas.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSCuotas.ParamByName('PAGADA').AsInteger := 1;
              IBSCuotas.ExecQuery;

              LineaC.NCuotasPagadas_3 := Format('%.3d',[IBSCuotas.FieldByName('CUOTAS_PAGAS').AsInteger]);

              LineaC.NCuotasPactadas_3Op := Format('%.3d',[Plazo div Amortizacion]);

              if (DiasMora > Plazo) then
              LineaC.NCuotasMora_3Op := Format('%.3d',[(Plazo div Amortizacion) - IBSCuotas.FieldByName('CUOTAS_PAGAS').AsInteger])
              else
                LineaC.NCuotasMora_3Op := Format('%.3d',[DiasMora div Amortizacion]);

              LineaC.ValorCupo_12 := Format('%.12d',[IBQuery2.FieldByName('VALOR_DESEMBOLSO').AsInteger div 1000]);

              If (LineaC.NCuotasMora_3Op <> '000') then
              LineaC.ValorMora_12 := Format('%.12d',[IBQuery1.FieldByName('DEUDA').AsInteger div 1000])
              else
              LineaC.ValorMora_12 := Format('%.12d',[0]);

              LineaC.ValorSaldo_12 := Format('%.12d',[IBQuery1.FieldByName('DEUDA').AsInteger div 1000]);

              LineaC.ValorCuota_12 := Format('%.12d', [IBQuery2.FieldByName('VALOR_CUOTA').AsInteger div 1000]);  // Ojo pendiende de verificar

              LineaC.ValorFijo_12NA := '            ';

              LineaC.LineaCredito_3 := '004';

              LineaC.ClausulaPermanencia_3NA := '   ';

              LineaC.TipoContrato_3Op := '001';
              LineaC.EstadoContrato_3Op := '001';
              LineaC.VigenciaContrato_2NA := '  ';
              LineaC.MesesContrato_3NA := '   ';

              with IBSClientes do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                  SQL.Add('"col$colocacion".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE,');
                  SQL.Add('"gen$persona".ID_TIPO_PERSONA');
                  SQL.Add('from "col$colocacion"');
                  SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
              end;

              case IBSClientes.FieldByName('ID_TIPO_PERSONA').AsInteger of
              1: LineaC.NaturalezaJuridica_3 := '000';
              2: LineaC.NaturalezaJuridica_3 := '007';
              3: LineaC.NaturalezaJuridica_3 := '005';
              else
                LineaC.NaturalezaJuridica_3 := '000';
              end;

              LineaC.ModalidadCredito_2 := '04';

              LineaC.TipoMoneda_2 := '01';

              case IBQuery2.FieldByName('ID_GARANTIA').AsInteger of
              1: LineaC.TipoGarantia_2 := '10';
              2: LineaC.TipoGarantia_2 := '01';
              else
                 LineaC.TipoGarantia_2 := '01';
              end;

              LineaC.ValorGarantia_12Op := '000000000000';
              LineaC.Reestructurada_2Op := '02';
              LineaC.NaturalezaRestructuracion_2Op := '  ';
              LineaC.NumeroReesructuraciones_3Op := '   ';
              LineaC.ClaseTarjeta_2NA := '  ';
              LineaC.NChequesDevueltos_4NA := '    ';
              LineaC.CategoriaServicio_2NA := '  ';
              LineaC.Plazo_2NA := '  ';
              LineaC.DiasCartera_6NA := '      ';
              LineaC.TipoCuenta_2NA := '  ';
              LineaC.CupoSobregiro_12NA := '            ';
              LineaC.DiasAutorizados_3NA := '   ';

              IBSDireccion.Close;

              IBSDireccion.SQL.Clear;
              IBSDireccion.SQL.Add('SELECT * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = :ID_DIRECCION');
              IBSDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
              IBSDireccion.ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
              IBSDireccion.ParamByName('ID_DIRECCION').AsInteger := 1;
              IBSDireccion.ExecQuery;
               

              LineaC.DireccionCasa_60Op := Format('%-60s',[LeftStr(IBSDireccion.FieldByName('DIRECCION').AsString + ' ' + IBSDireccion.FieldByName('BARRIO').AsString,60)]);
              LineaC.TelefonoCasa_20Op := Format('%-20s',[LeftStr(IBSDireccion.FieldByName('TELEFONO1').AsString,20)]);

              IBSMunicipio.Close;
              IBSMunicipio.SQL.Clear;
              IBSMunicipio.SQL.Add('SELECT * FROM "gen$municipios" WHERE COD_MUNICIPIO = :COD_MUNICIPIO');
              IBSMunicipio.ParamByName('COD_MUNICIPIO').AsString := IBSDireccion.FieldByName('COD_MUNICIPIO').AsString;

              if ((IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '') and (IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '0')) then
              begin
                 LineaC.CodigoCiudadCasa_6Op := Format('%.6d',[StrToInt(RightStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,3))]);
                 LineaC.CiudadCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('NOMBRE').AsString,20)]);
                 LineaC.CodigoDeptoCasa_3Op := Format('%.3d',[StrToInt(LeftStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,StrLength(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString)-3))]);
                 LineaC.DeptoCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('DPTO').AsString,20)]);
              end
              else
              begin
                 LineaC.CodigoCiudadCasa_6Op := Format('%.6d',[1]);
                 LineaC.CiudadCasa_20Op := Format('%-20s',['BUCARAMANGA']);
                 LineaC.CodigoDeptoCasa_3Op := Format('%.3d',[68]);
                 LineaC.DeptoCasa_20Op := Format('%-20s',['SANTANDER']);
              end;

              LineaC.NombreEmpresa_60Op := Format('%-60s',[' ']);
              LineaC.DireccionEmpresa_60Op := Format('%-60s',[' ']);
              LineaC.TelefonoEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.CodigoCiudadEmpresa_6Op := Format('%-6s',[' ']);
              LineaC.CiuadadEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.CodigoDeptoEmpresa_3Op := Format('%-3s',[' ']);
              LineaC.DeptoEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.FechaInicioGMF_8NA := Format('%-8s',[' ']);
              LineaC.FechaFinGMF_8NA := Format('%-8s',[' ']);
              LineaC.NRenovacionCDT_2NA := Format('%-2s',[' ']);
              LineaC.CtaExcGMF_2NA := Format('%-2s',[' ']);
              LineaC.TIOriginaria_2NA := Format('%-2s',[' ']);
              LineaC.NIOriginaria_14NA := Format('%-14s',[' ']);
              LineaC.TEOriginaria_3Op := Format('%-3s',[' ']);
              LineaC.CEOriginaria_3Op := Format('%-3s',[' ']);
              LineaC.TipoFideicomiso_2NA := Format('%-2s',[' ']);
              LineaC.NumeroFideicomiso_12NA := Format('%-12s',[' ']);
              LineaC.NombreFideicomiso_60NA := Format('%-60s',[' ']);
              LineaC.TipoDeudaCartera_4NA := Format('%-4s',[' ']);
              LineaC.TipoPoliza_4NA := Format('%-4s',[' ']);
              LineaC.CodigoRamo_6NA := Format('%-6s',[' ']);

              PlanoMovimientos.Add(LineaC.toString);

              // Proceso Codeudores
              with IBSCodeudores do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
                  SQL.Add('"col$colgarantias".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE');
                  SQL.Add('from "col$colgarantias"');
                  SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
               end;

                  while not IBSCodeudores.Eof do begin


                    IBSDireccion.Close;
                    IBSDireccion.SQL.Clear;
                    IBSDireccion.SQL.Add('SELECT * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = :ID_DIRECCION');
                    IBSDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                    IBSDireccion.ParamByName('ID_PERSONA').AsString := LeftStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,12);
                    IBSDireccion.ParamByName('ID_DIRECCION').AsInteger := 1;
                    IBSDireccion.ExecQuery;

                    LineaO := LineaC;
                    case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                        3 : LineaO.TIdentificacion_2 := '01';
                        4 : LineaO.TIdentificacion_2 := '02';
                        6 : LineaO.TIdentificacion_2 := '03';
                        2 : LineaO.TIdentificacion_2 := '04';
                        8 : LineaO.TIdentificacion_2 := '05';
                        7 : LineaO.TIdentificacion_2 := '07';
                        1 : LineaO.TIdentificacion_2 := '09';
                        0 : LineaO.TIdentificacion_2 := '01';
                    end;

                    Identificacion := Format('%15s',[LeftStr(Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString),15)]);
                    if (Pos('-',Identificacion) > 0) then
                        Identificacion := Format('%15s', [LeftStr(Identificacion,13)]);
                    Identificacion := Format('%15s',[Identificacion]);
                    StrReplace(Identificacion, ' ', '0',[rfIgnoreCase, rfReplaceAll]);
                    LineaO.NumeroIdentificacion_15 := Identificacion;

                    Nombre := Format('%-60s',[LeftStr(Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString)+ ' '+
                    Trim(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString)+ ' ' +
                    Trim(IBSCodeudores.FieldByName('NOMBRE').AsString),60)]);
                    LineaO.NombreTitular_60 := Nombre;

                    LineaO.Calidad_1 := 'C';
                    LineaO.DireccionCasa_60Op := Format('%-60s',[LeftStr(IBSDireccion.FieldByName('DIRECCION').AsString + ' ' + IBSDireccion.FieldByName('BARRIO').AsString,60)]);
                    LineaO.TelefonoCasa_20Op := Format('%-20s',[LeftStr(IBSDireccion.FieldByName('TELEFONO1').AsString,20)]);

                    IBSMunicipio.Close;
                    IBSMunicipio.SQL.Clear;
                    IBSMunicipio.SQL.Add('SELECT * FROM "gen$municipios" WHERE COD_MUNICIPIO = :COD_MUNICIPIO');
                    IBSMunicipio.ParamByName('COD_MUNICIPIO').AsString := IBSDireccion.FieldByName('COD_MUNICIPIO').AsString;

                    if ((IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '') and (IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '0')) then
                    begin
                        LineaO.CodigoCiudadCasa_6Op := Format('%.6d',[StrToInt(RightStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,3))]);
                        LineaO.CiudadCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('NOMBRE').AsString,20)]);
                        LineaO.CodigoDeptoCasa_3Op := Format('%.3d',[StrToInt(LeftStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,StrLength(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString)-3))]);
                        LineaO.DeptoCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('DPTO').AsString,20)]);
                    end
                    else
                    begin
                        LineaO.CodigoCiudadCasa_6Op := Format('%.6d',[1]);
                        LineaO.CiudadCasa_20Op := Format('%-20s',['BUCARAMANGA']);
                        LineaO.CodigoDeptoCasa_3Op := Format('%.3d',[68]);
                        LineaO.DeptoCasa_20Op := Format('%-20s',['SANTANDER']);
                    end;

                    PlanoMovimientos.Add(LineaO.toString);

                    SumaRegistros := SumaRegistros + 1;
                    IBSCodeudores.Next;
                  end;

                  SumaRegistros := SumaRegistros + 1;
            Next;
           end; // fin while
        end; // fin with
        CheckBox2.Checked := True;
end;

procedure TfrmProcesarCifin.TercerPaso;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := '9';
      PlanoF := cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      cadena := cadena + StringReplace(Format('%8d',[SumaRegistros]),' ','0',[rfReplaceAll]);
      cadena := cadena + StringReplace(Format('%8d',[0]),' ','0',[rfReplaceAll]);
      cadena := cadena + StringReplace(Format('%8d',[0]),' ','0',[rfReplaceAll]);
      PlanoF := PlanoF + cadena;

//      PlanoReporte.Add(LineaF);
      CheckBox3.Checked := True;
end;


procedure TfrmProcesarCifin.CmdProcesarClick(Sender: TObject);
var
  PlanoEncabezado: TStringList;
begin
        CmdProcesar.Enabled := False;

        with IBSClientes do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "col$controlreportedata" where FECHA_CORTE =:FECHA_CORTE and CIFIN = 1');
         ParamByName('FECHA_CORTE').AsString := MesCorteAct;
         ExecQuery;
         if RecordCount > 0 then begin
           MessageDlg('El Reporte CIFIN para esta Fecha' + #13 + 'Ya fue Generado',mtError,[mbok],0);
           Exit;
         end;
         Close;
        end;

        segundopaso;
        segundopaso2;
        tercerpaso;
        primerpaso;

        PlanoEncabezado := TStringList.Create;
        PlanoEncabezado.Add(PlanoE);
        PlanoEncabezado.AddStrings(PlanoMovimientos);
        PlanoEncabezado.Add(PlanoF);

        PlanoEncabezado.SaveToFile('C:/CSC123130' + FormatDateTime('yyyymmdd', EdFechaCorte.DateTime) + '.TXT');

        with IBSClientes do begin
         Close;
         SQL.Clear;
         SQL.Add('update "col$controlreportedata" set CIFIN = 1 where FECHA_CORTE = :FECHA_CORTE');
         ParamByName('FECHA_CORTE').AsString:= MesCorteAct;
         ExecQuery;
         Close;
         IBSClientes.Transaction.Commit;
        end;


        CmdGenerar.Enabled := True;
end;

procedure TfrmProcesarCifin.FormShow(Sender: TObject);
var
    Dia:Word;
    Mes:Word;
    Ano:Word;
begin
        PlanoMovimientos := TStringList.Create;
        PlanoMovimientos.Clear;

        Ano := YearOf(Date);
        Mes := MonthOf(Date);
        Dia := DayOf(Date);

        Mes := Mes - 1;
        if Mes < 1 then
        begin
          Mes := 12;
          Ano := Ano -1;
        end;

        EdFechaCorte.Date := EncodeDate(Ano,Mes,DaysInAMonth(Ano,Mes));
        

end;

procedure TfrmProcesarCifin.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBSCuotas.Database := dmGeneral.IBDatabase1;
        IBSNoCredito.Database := dmGeneral.IBDatabase1;
        IBSClientes.Database := dmGeneral.IBDatabase1;
        IBSCodeudores.Database := dmGeneral.IBDatabase1;
        IBSDireccion.Database := dmGeneral.IBDatabase1;
        IBSMunicipio.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBSCuotas.Transaction := dmGeneral.IBTransaction1;
        IBSNoCredito.Transaction := dmGeneral.IBTransaction1;
        IBSClientes.Transaction := dmGeneral.IBTransaction1;
        IBSCodeudores.Transaction := dmGeneral.IBTransaction1;
        IBSDireccion.Transaction := dmGeneral.IBTransaction1;
        IBSMunicipio.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmProcesarCifin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmGeneral.Free;
        Action := caFree;
end;

procedure TfrmProcesarCifin.CmdGenerarClick(Sender: TObject);
begin
//        PlanoMovimientos.Add(LineaF);
//        PlanoEncabezado.AddStrings(PlanoClientes);
//        PlanoEncabezado.AddStrings(PlanoMovimientos);
//        PlanoEncabezado.SaveToFile('c:/Cifin' + MesCorteAct + '.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmProcesarCifin.CmdVerClick(Sender: TObject);
var frmMuestroArchivoCifn : TfrmMuestroArchivoCifin;
begin
        frmMuestroArchivoCifin := TfrmMuestroArchivoCifin.Create(Self);
        frmMuestroArchivoCifin.FechaCorte := FormatDateTime('yyyymmdd',EdFechaCorte.DateTime);
        frmMuestroArchivoCifin.ShowModal;
end;

procedure TfrmProcesarCifin.EdFechaCorteExit(Sender: TObject);
begin
        Mes := MonthOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        Mes := Mes - 1;
        if Mes = 0 then
          Mes  := 12;
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := IntToStr(YearOf(EdFechaCorte.Date)) + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;
end;

function Registro2.toString():String;
begin
    Result := TRegistro_1+TIdentificacion_2+NumeroIdentificacion_15+NombreTitular_60+Reservado_10+NumeroObligacion_20+CodigoSucursal_6+Calidad_1+
              Calificacion_2+EstadoTitular_2+Estado_2+EdadMora_2+AnosMora_2Op+FechaCorte_8+FechaInicial_8+FechaFinal_8+
              FechaExigibilidad_8Op+FechaPrescipcion_8Op+FechaPago_8Op+ModoExtincion_2Op+TipoPago_2Op+PeriodicidadPago_2+
              ProbabilidadNoPago_3Op+NCuotasPagadas_3+NCuotasPactadas_3Op+NCuotasMora_3Op+ValorCupo_12+ValorMora_12+ValorSaldo_12+
              ValorCuota_12+ValorFijo_12NA+LineaCredito_3+ClausulaPermanencia_3NA+TipoContrato_3Op+
              EstadoContrato_3Op+VigenciaContrato_2NA+MesesContrato_3NA+NaturalezaJuridica_3+ModalidadCredito_2+TipoMoneda_2+
              TipoGarantia_2+ValorGarantia_12Op+Reestructurada_2Op+NaturalezaRestructuracion_2Op+NumeroReesructuraciones_3Op+
              ClaseTarjeta_2NA+NChequesDevueltos_4NA+CategoriaServicio_2NA+Plazo_2NA+DiasCartera_6NA+TipoCuenta_2NA+CupoSobregiro_12NA+
              DiasAutorizados_3NA+DireccionCasa_60Op+TelefonoCasa_20Op+CodigoCiudadCasa_6Op+CiudadCasa_20Op+CodigoDeptoCasa_3Op+
              DeptoCasa_20Op+NombreEmpresa_60Op+DireccionEmpresa_60Op+TelefonoEmpresa_20Op+CodigoCiudadEmpresa_6Op+CiuadadEmpresa_20Op+
              CodigoDeptoEmpresa_3Op+DeptoEmpresa_20Op+FechaInicioGMF_8NA+FechaFinGMF_8NA+NRenovacionCDT_2NA+CtaExcGMF_2NA+TIOriginaria_2NA+
              NIOriginaria_14NA+TEOriginaria_3Op+CEOriginaria_3Op+TipoFideicomiso_2NA+NumeroFideicomiso_12NA+NombreFideicomiso_60NA+
              TipoDeudaCartera_4NA+TipoPoliza_4NA+CodigoRamo_6NA;
end;

procedure TfrmProcesarCifin.SegundoPaso2;
var cadena:string;
    LineaC, LineaO:Registro2;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;
    EdadAct:String;
    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
    TipoCuota: Integer;
    Amortizacion: Integer;
    Plazo: Integer;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        LineaC := Registro2.Create;

 with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$colocacion" where ');
           SQL.Add('(FECHA_SALDADO BETWEEN :FECHAINI and :FECHAFIN)');
           SQL.Add('and (VALOR_DESEMBOLSO = ABONOS_CAPITAL) and (ID_ESTADO_COLOCACION IN (6,7))');
           ParamByName('FECHAINI').AsDate :=  EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),01);
           ParamByName('FECHAFIN').AsDate :=  EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$colocacion" where ');
           SQL.Add('(FECHA_SALDADO BETWEEN :FECHAINI and :FECHAFIN)');
           SQL.Add('and (VALOR_DESEMBOLSO = ABONOS_CAPITAL) and (ID_ESTADO_COLOCACION IN (6,7))');
           ParamByName('FECHAINI').AsDate :=  EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),01);
           ParamByName('FECHAFIN').AsDate :=  EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             SumaObligaciones := SumaObligaciones + 1;
             Bar.Position := RecNo;
             lblColocacion.Caption := IBQuery1.FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             LineaC.TRegistro_1 := '2';
             case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TIdentificacion_2 := '01';
               4 : LineaC.TIdentificacion_2 := '02';
               6 : LineaC.TIdentificacion_2 := '03';
               2 : LineaC.TIdentificacion_2 := '04';
               8 : LineaC.TIdentificacion_2 := '05';
               7 : LineaC.TIdentificacion_2 := '07';
               1 : LineaC.TIdentificacion_2 := '09';
               0 : LineaC.TIdentificacion_2 := '01';
             end;


             Identificacion := Format('%15s',[LeftStr(Trim(IBQuery1.FieldByName('ID_PERSONA').AsString),15)]);
             if (Pos('-',Identificacion) > 0 ) then
              Identificacion := Format('%15s', [LeftStr(Identificacion,13)]);
             Identificacion := Format('%15s',[Identificacion]);
             StrReplace(Identificacion, ' ', '0',[rfIgnoreCase, rfReplaceAll]);
             LineaC.NumeroIdentificacion_15 := Identificacion;


             with IBSClientes do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                  SQL.Add('"col$colocacion".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE');
                  SQL.Add('from "col$colocacion"');
                  SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
             end;

             Nombre := Format('%-60s',[LeftStr(Trim(IBSClientes.FieldByName('PRIMER_APELLIDO').AsString)+ ' '+
             Trim(IBSClientes.FieldByName('SEGUNDO_APELLIDO').AsString)+ ' ' +
             Trim(IBSClientes.FieldByName('NOMBRE').AsString),60)]);
             LineaC.NombreTitular_60 := Nombre;


              LineaC.Reservado_10 := Format('%-10s',[' ']);

              ColocacionActual := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              if (LeftStr(ColocacionActual,4) = '1020') then
              // Numeración Antigua
              begin
                 ColocacionNew := 'FAP' + MidStr(ColocacionActual,5,6) + '-0';
              end
              else
              // Numeración Nueva
              begin
                 ColocacionNew := ColocacionActual;
              end;

              LineaC.NumeroObligacion_20 := Format('%20s',[ColocacionNew]);
              LineaC.CodigoSucursal_6 := Format('%.6d',[IBQuery1.FieldByName('ID_AGENCIA').AsInteger]);
              LineaC.Calidad_1 := 'P';
               LineaC.Calificacion_2 := '05';
              EdadAct := 'A';
              if (EdadAct = 'A') then LineaC.Calificacion_2 := '01'
              else if (EdadAct = 'B') then LineaC.Calificacion_2 := '02'
              else if (EdadAct = 'C') then LineaC.Calificacion_2 := '03'
              else if (EdadAct = 'D') then LineaC.Calificacion_2 := '04'
              else
                LineaC.Calificacion_2 := '05';

              LineaC.EstadoTitular_2 := '06';

              LineaC.Estado_2 := '07';


              LineaC.EdadMora_2 :=  '00';

              LineaC.AnosMora_2Op := Format('%.2d',[0]);
              LineaC.FechaCorte_8 := FormatDateTime('yyyymmdd',EdFechaCorte.DateTime);
              LineaC.FechaInicial_8 := FormatDateTime('yyyymmdd', IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);
              LineaC.FechaFinal_8 := FormatDateTime('yyyymmdd', IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
              LineaC.FechaExigibilidad_8Op := '        ';
              LineaC.FechaPrescipcion_8Op := '        ';
              LineaC.FechaPago_8Op := '        ';
              LineaC.ModoExtincion_2Op := '  ';
              LineaC.TipoPago_2Op := '  ';

              TipoCuota := IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger;
              Amortizacion := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
              Plazo := IBQuery1.FieldByName('PLAZO_COLOCACION').AsInteger;
              // Cuota Fija
              if (TipoCuota  = 1) then
              begin
                 if (Amortizacion = Plazo) then LineaC.PeriodicidadPago_2 := '22'
                 else
                 case Amortizacion of
                 07: LineaC.PeriodicidadPago_2 := '02';
                 15: LineaC.PeriodicidadPago_2 := '05';
                 30: LineaC.PeriodicidadPago_2 := '08';
                 60: LineaC.PeriodicidadPago_2 := '11';
                 90: LineaC.PeriodicidadPago_2 := '14';
                180: LineaC.PeriodicidadPago_2 := '17';
                360: LineaC.PeriodicidadPago_2 := '20';
                else
                  LineaC.PeriodicidadPago_2 := '23';
                end;
              end
              // Cuota Variable
              else
              if (Amortizacion = Plazo) then LineaC.PeriodicidadPago_2 := '22'
              else
              begin
                 case Amortizacion of
                 07: LineaC.PeriodicidadPago_2 := '03';
                 15: LineaC.PeriodicidadPago_2 := '06';
                 30: LineaC.PeriodicidadPago_2 := '09';
                 60: LineaC.PeriodicidadPago_2 := '12';
                 90: LineaC.PeriodicidadPago_2 := '15';
                180: LineaC.PeriodicidadPago_2 := '18';
                360: LineaC.PeriodicidadPago_2 := '21';
                else
                  LineaC.PeriodicidadPago_2 := '23';
                end;
              end;

              LineaC.ProbabilidadNoPago_3Op := '   ';

              IBSCuotas.Close;
              IBSCuotas.SQL.Clear;
              IBSCuotas.SQL.Add('select count(*) as CUOTAS_PAGAS from "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and PAGADA = :PAGADA');
              IBSCuotas.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSCuotas.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSCuotas.ParamByName('PAGADA').AsInteger := 1;
              IBSCuotas.ExecQuery;

              LineaC.NCuotasPagadas_3 := Format('%.3d',[IBSCuotas.FieldByName('CUOTAS_PAGAS').AsInteger]);

              LineaC.NCuotasPactadas_3Op := Format('%.3d',[Plazo div Amortizacion]);


              LineaC.NCuotasMora_3Op := Format('%.3d',[0]);

              LineaC.ValorCupo_12 := Format('%.12d',[IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsInteger div 1000]);

              LineaC.ValorMora_12 := Format('%.12d',[0]);

              LineaC.ValorSaldo_12 := Format('%.12d',[0]);

              LineaC.ValorCuota_12 := Format('%.12d', [0]);  // Ojo pendiende de verificar

              LineaC.ValorFijo_12NA := '            ';

              LineaC.LineaCredito_3 := '004';

              LineaC.ClausulaPermanencia_3NA := '   ';

              LineaC.TipoContrato_3Op := '001';
              LineaC.EstadoContrato_3Op := '001';
              LineaC.VigenciaContrato_2NA := '  ';
              LineaC.MesesContrato_3NA := '   ';

              with IBSClientes do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                  SQL.Add('"col$colocacion".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE,');
                  SQL.Add('"gen$persona".ID_TIPO_PERSONA');
                  SQL.Add('from "col$colocacion"');
                  SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
              end;

              case IBSClientes.FieldByName('ID_TIPO_PERSONA').AsInteger of
              1: LineaC.NaturalezaJuridica_3 := '000';
              2: LineaC.NaturalezaJuridica_3 := '007';
              3: LineaC.NaturalezaJuridica_3 := '005';
              else
                LineaC.NaturalezaJuridica_3 := '000';
              end;

              LineaC.ModalidadCredito_2 := '04';

              LineaC.TipoMoneda_2 := '01';

              case IBQuery1.FieldByName('ID_GARANTIA').AsInteger of
              1: LineaC.TipoGarantia_2 := '10';
              2: LineaC.TipoGarantia_2 := '01';
              else
                 LineaC.TipoGarantia_2 := '01';
              end;

              LineaC.ValorGarantia_12Op := '000000000000';
              LineaC.Reestructurada_2Op := '02';
              LineaC.NaturalezaRestructuracion_2Op := '  ';
              LineaC.NumeroReesructuraciones_3Op := '   ';
              LineaC.ClaseTarjeta_2NA := '  ';
              LineaC.NChequesDevueltos_4NA := '    ';
              LineaC.CategoriaServicio_2NA := '  ';
              LineaC.Plazo_2NA := '  ';
              LineaC.DiasCartera_6NA := '      ';
              LineaC.TipoCuenta_2NA := '  ';
              LineaC.CupoSobregiro_12NA := '            ';
              LineaC.DiasAutorizados_3NA := '   ';

              IBSDireccion.Close;

              IBSDireccion.SQL.Clear;
              IBSDireccion.SQL.Add('SELECT * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = :ID_DIRECCION');
              IBSDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
              IBSDireccion.ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
              IBSDireccion.ParamByName('ID_DIRECCION').AsInteger := 1;
              IBSDireccion.ExecQuery;
               

              LineaC.DireccionCasa_60Op := Format('%-60s',[LeftStr(IBSDireccion.FieldByName('DIRECCION').AsString + ' ' + IBSDireccion.FieldByName('BARRIO').AsString,60)]);
              LineaC.TelefonoCasa_20Op := Format('%-20s',[LeftStr(IBSDireccion.FieldByName('TELEFONO1').AsString,20)]);

              IBSMunicipio.Close;
              IBSMunicipio.SQL.Clear;
              IBSMunicipio.SQL.Add('SELECT * FROM "gen$municipios" WHERE COD_MUNICIPIO = :COD_MUNICIPIO');
              IBSMunicipio.ParamByName('COD_MUNICIPIO').AsString := IBSDireccion.FieldByName('COD_MUNICIPIO').AsString;

              if ((IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '') and (IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '0')) then
              begin
                 LineaC.CodigoCiudadCasa_6Op := Format('%.6d',[StrToInt(RightStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,3))]);
                 LineaC.CiudadCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('NOMBRE').AsString,20)]);
                 LineaC.CodigoDeptoCasa_3Op := Format('%.3d',[StrToInt(LeftStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,StrLength(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString)-3))]);
                 LineaC.DeptoCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('DPTO').AsString,20)]);
              end
              else
              begin
                 LineaC.CodigoCiudadCasa_6Op := Format('%.6d',[1]);
                 LineaC.CiudadCasa_20Op := Format('%-20s',['BUCARAMANGA']);
                 LineaC.CodigoDeptoCasa_3Op := Format('%.3d',[68]);
                 LineaC.DeptoCasa_20Op := Format('%-20s',['SANTANDER']);
              end;

              LineaC.NombreEmpresa_60Op := Format('%-60s',[' ']);
              LineaC.DireccionEmpresa_60Op := Format('%-60s',[' ']);
              LineaC.TelefonoEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.CodigoCiudadEmpresa_6Op := Format('%-6s',[' ']);
              LineaC.CiuadadEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.CodigoDeptoEmpresa_3Op := Format('%-3s',[' ']);
              LineaC.DeptoEmpresa_20Op := Format('%-20s',[' ']);
              LineaC.FechaInicioGMF_8NA := Format('%-8s',[' ']);
              LineaC.FechaFinGMF_8NA := Format('%-8s',[' ']);
              LineaC.NRenovacionCDT_2NA := Format('%-2s',[' ']);
              LineaC.CtaExcGMF_2NA := Format('%-2s',[' ']);
              LineaC.TIOriginaria_2NA := Format('%-2s',[' ']);
              LineaC.NIOriginaria_14NA := Format('%-14s',[' ']);
              LineaC.TEOriginaria_3Op := Format('%-3s',[' ']);
              LineaC.CEOriginaria_3Op := Format('%-3s',[' ']);
              LineaC.TipoFideicomiso_2NA := Format('%-2s',[' ']);
              LineaC.NumeroFideicomiso_12NA := Format('%-12s',[' ']);
              LineaC.NombreFideicomiso_60NA := Format('%-60s',[' ']);
              LineaC.TipoDeudaCartera_4NA := Format('%-4s',[' ']);
              LineaC.TipoPoliza_4NA := Format('%-4s',[' ']);
              LineaC.CodigoRamo_6NA := Format('%-6s',[' ']);

              PlanoMovimientos.Add(LineaC.toString);

              // Proceso Codeudores
              with IBSCodeudores do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select ');
                  SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
                  SQL.Add('"col$colgarantias".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".NOMBRE');
                  SQL.Add('from "col$colgarantias"');
                  SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
                  SQL.Add('where');
                  SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
                  SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ExecQuery;
               end;

                  while not IBSCodeudores.Eof do begin


                    IBSDireccion.Close;
                    IBSDireccion.SQL.Clear;
                    IBSDireccion.SQL.Add('SELECT * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = :ID_DIRECCION');
                    IBSDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                    IBSDireccion.ParamByName('ID_PERSONA').AsString := LeftStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,12);
                    IBSDireccion.ParamByName('ID_DIRECCION').AsInteger := 1;
                    IBSDireccion.ExecQuery;

                    LineaO := LineaC;
                    case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                        3 : LineaO.TIdentificacion_2 := '01';
                        4 : LineaO.TIdentificacion_2 := '02';
                        6 : LineaO.TIdentificacion_2 := '03';
                        2 : LineaO.TIdentificacion_2 := '04';
                        8 : LineaO.TIdentificacion_2 := '05';
                        7 : LineaO.TIdentificacion_2 := '07';
                        1 : LineaO.TIdentificacion_2 := '09';
                        0 : LineaO.TIdentificacion_2 := '01';
                    end;

                    Identificacion := Format('%15s',[LeftStr(Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString),15)]);
                    if (Pos('-',Identificacion) > 0) then
                        Identificacion := Format('%15s', [LeftStr(Identificacion,13)]);
                    Identificacion := Format('%15s',[Identificacion]);
                    StrReplace(Identificacion, ' ', '0',[rfIgnoreCase, rfReplaceAll]);
                    LineaO.NumeroIdentificacion_15 := Identificacion;

                    Nombre := Format('%-60s',[LeftStr(Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString)+ ' '+
                    Trim(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString)+ ' ' +
                    Trim(IBSCodeudores.FieldByName('NOMBRE').AsString),60)]);
                    LineaO.NombreTitular_60 := Nombre;

                    LineaO.Calidad_1 := 'C';
                    LineaO.DireccionCasa_60Op := Format('%-60s',[LeftStr(IBSDireccion.FieldByName('DIRECCION').AsString + ' ' + IBSDireccion.FieldByName('BARRIO').AsString,60)]);
                    LineaO.TelefonoCasa_20Op := Format('%-20s',[LeftStr(IBSDireccion.FieldByName('TELEFONO1').AsString,20)]);

                    IBSMunicipio.Close;
                    IBSMunicipio.SQL.Clear;
                    IBSMunicipio.SQL.Add('SELECT * FROM "gen$municipios" WHERE COD_MUNICIPIO = :COD_MUNICIPIO');
                    IBSMunicipio.ParamByName('COD_MUNICIPIO').AsString := IBSDireccion.FieldByName('COD_MUNICIPIO').AsString;

                    if ((IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '') and (IBSDireccion.FieldByName('COD_MUNICIPIO').AsString <> '0')) then
                    begin
                        LineaO.CodigoCiudadCasa_6Op := Format('%.6d',[StrToInt(RightStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,3))]);
                        LineaO.CiudadCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('NOMBRE').AsString,20)]);
                        LineaO.CodigoDeptoCasa_3Op := Format('%.3d',[StrToInt(LeftStr(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString,StrLength(IBSDireccion.FieldByName('COD_MUNICIPIO').AsString)-3))]);
                        LineaO.DeptoCasa_20Op := Format('%-20s',[LeftStr(IBSMunicipio.FieldByName('DPTO').AsString,20)]);
                    end
                    else
                    begin
                        LineaO.CodigoCiudadCasa_6Op := Format('%.6d',[1]);
                        LineaO.CiudadCasa_20Op := Format('%-20s',['BUCARAMANGA']);
                        LineaO.CodigoDeptoCasa_3Op := Format('%.3d',[68]);
                        LineaO.DeptoCasa_20Op := Format('%-20s',['SANTANDER']);
                    end;

                    PlanoMovimientos.Add(LineaO.toString);

                    SumaRegistros := SumaRegistros + 1;
                    IBSCodeudores.Next;
                  end;

                  SumaRegistros := SumaRegistros + 1;
            Next;
           end; // fin while
        end; // fin with
        CheckBox4.Checked := True;

end;

end.



