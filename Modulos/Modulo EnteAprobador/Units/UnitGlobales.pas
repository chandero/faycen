unit UnitGlobales;

interface

Uses Forms, StdCtrls, DBCtrls, Math, DateUtils, IB, IBSQL ,IBQuery,IBStoredProc, IBDataBase, Messages,SysUtils,DB,DBGrids,Windows,Controls, StrUtils,Classes,Dialogs, winspool, Printers,
     Unit_DmComprobante,JvStringGrid;

type
     PTablaCerLiq = ^TablaCerLiq;
     TablaCerLiq = record
      FechaPago:TDate;
      Valor:Currency;
      Liquidado:Boolean;
end;

type
     PTablaConLiq = ^TablaConLiq;
     TablaConLiq = record
      FechaDescuento:TDate;
      Valor:Currency;
      Descontado:Boolean;
end;


type
   TValidarCap = Record
    Fecha:TDate;
    Caja:Integer;
    Origen:Integer;
    Tipo:Integer;
    Operacion:Integer;
    Agencia:Integer;
    Cuenta:Integer;
    Documento:Integer;
    Billetes:Currency;
    Monedas:Currency;
    Cheques:Currency;
end;

type
   TCaptacion = Record
    IdAgencia:Integer;
    IdCaptacion:Integer;
    IdNumeroCuenta:Integer;
    IdDigitoCuenta:Integer;
end;

type
   TValidarCol = Record
    Fecha:TDate;
    Caja:Integer;
    Cuenta:Integer;
    Colocacion:string;
    Nombre:string;
    Clasificacion:string;
    Garantia:string;
    Estado:string;
    Documento:Integer;
    Tasa:Double;
    FechaInt:TDate;
    Capital:Currency;
    Interes:Currency;
    Devuelto:Currency;
    Otras:Currency;
    Efectivo:Currency;
    NuevoSaldo:Currency;
end;


function  DiasEntre(FechaInicial:TDate;FechaFinal:TDate):Integer;
function  DiasEntrePagoTotal(FechaInicial:TDate;FechaFinal:TDate):Integer;
function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean;Devuelto:Boolean):Integer;
procedure EnterTabsGrid (Sender: TObject; var Key: Char; DataSet:TDataSet);
procedure EnterTabs(var Key:Char;oSelf:TForm);
procedure Numerico(Sender:TObject;var Key:Char);
procedure NumericoSinPunto(Sender:TObject;var Key:Char);
function  InttoBoolean (valor:integer) : boolean;
function  CalculoCC(IentOfi,InumCta:String ) : String;
function  Edad(Fecha:TDateTime):String;
function  Precisarcodigo(Codigo: String): string;
function  DigitoControl(Tipo:Integer;Cuenta: string): string;
function  TablaCer(Valor:Currency;TasaEfectiva:Single;Modalidad:string;FechaApertura,FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word): TList;
function  TablaCon(Valor:Currency;FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word;FechaCorte:TDate): TList;
procedure SendControlCode(S: string);
procedure SendControlCodeNew(NombreImpresora:string;S: string);
procedure ImprimirCadena(Impresora,S: string);
procedure Empleado;
function ReCalculoSaldosGenerales:Boolean;
procedure ColocarSaldoMayor(CodigoMayor: string;Mes:Integer;Debito:Currency;Credito:Currency;IBVarios:TIBSQL);


var DBAlias:String;
    DBPasabordo: String;
    DBNombre:String;
    DBServer:String;
    DBpath:String;
    DBname:String;
    DBserver1:String;
    DBpath1:String;
    DBname1:string;
    Role:string;    
    DBMinutos:Extended;
    MiINI:String;
    Empresa:String;
    Nit:String;
    Agencia:Integer;
    Ciudad:String;
    Departamento:string;
    FechaHoy:TDate;
    Nombres:string;
    Apellidos:string;
    Bisiesto:Boolean;
    control_consulta :Boolean;
    host_equivida :string;
    host_abrego :string;
    host_convencion :string;
    host_ocana :string;
    puerto_abrego :Integer;
    puerto_ocana :Integer;
    puerto_convencion :Integer;
    Monto_EnteAprobador :Currency;
    Id_EnteAprobador :Integer;
    Mensaje_EnteAprobador :string;
// Variables globales TDebito
  Pop3ServerName: string;
  Pop3ServerPort: Integer;
  Pop3ServerUser: string;
  Pop3ServerPassword: string;
  SmtpServerName: string;
  SmtpServerPort: Integer;
  SmtpServerUser: string;
  SmtpServerPassword: string;
  SmtpAuthType: Integer;
  UserEmail: string;
//

Apesos: array[1..10] of integer = (1,2,4,8,5,10,9,7,3,6);
Meses: array[1..12] of string = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
MaxDiasMes:array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);

const txcFormFeed:string = #12;
const txcNormal:string = #27+#120+#00;
const txcPica:string = #27+#120+#01+#27+#107+#00;
const txcElite:string = #27+#120+#01+#27+#107+#01;
const txcCondensedOn:string = #15;
const txcCondensedOff:string = #18;
const txcBoldOn:string = #27+#71;
const txcBoldOff:string = #27+#72;
const txcItalicOn:string = #27+#52;
const txcItalicOff:string = #27+#53;
const txcUnderlineOn:string = #27+#45+#49;
const txcUnderlineOff:string = #27+#45+#48;
const txcSuperScriptOn:string = #27+#83+#01;
const txcSuperScriptOff:string = #27+#84;
const txcSubScriptOn:string = #27+#83+#00;
const txcSubScriptOff:string = #27+#84;
const txcWideOn:string = #27+#87+#01;
const txcWideOff:string = #27+#87+#00;
const txc12cpiOn:string = #27+#77;
const txc12cpiOff:string = #27+#80;
const txcCondensedOnHP = #27#38#107#50#83;
const txcCondensedOffHP = #27#38#107#48#83;
const txcBoldOnHP = #27#40#115#51#66;
const txcBoldOffHP = #27#40#115#48#66;
const txcItalicOnHP = #27#40#115#49#83;
const txcItalicOffHP =  #27#40#115#48#83;
const txcUnderlineOnHP = #27#38#100#48#68;
const txcUnderlineOffHP = #27#38#100#64;


function BooleanoToInt(valor: boolean): integer;
function ObtenerConsecutivo(IBSQL1:TIBSQL): LongInt;
function ObtenerConsecutivoAyudas(IBSQL1:TIBSQL): Longint;
function ObtenerCaptacion(TipoCaptacion:Integer;IBSQL1: TIBSQL): LongInt;
function ObtenerConsecutivoTmp(IBSQL1:TIBSQL): Longint;
function ObtenerConsecutivoCajaCartera: Longint;
function ObtenerConsecutivoCajaCarteraTmp: Longint;
function fFechaActual: TDate;
function fHoraActual: TTime;
function fFechaHoraActual: TDateTime;
function ValidarOpcion(IdOpcion: Integer): Boolean;
function extrae_empleado: string;
function Buscaconyuge(id_persona, id_solicitud: string;
  id_identificacion: integer): boolean;
function Valida_Solicitud(id_colocacion: string;
  id_agencia: integer): string;
function define_tasa(linea: integer; tasa: Currency): string;
function Obtener_Estado(id_estado: integer): string;

implementation

uses UnitGlobalesCol,UnitdmGeneral;


///* Funci�n para calcular edad */
function Edad(Fecha:TDateTime):String;
var A, AA, M, MM, D, DD: Word;
  Anio, Mes, Dia: double;
begin
  DecodeDate(Fecha, A, M, D);
  DecodeDate(Date, AA, MM, DD);
  Anio := Int(AA - A);
  if( M <= MM ) then
     Mes := MM - M
  else
  begin
    Mes := MM+12-M;
    Anio := Anio -1;
  end;
  if( D <= DD ) then
    Dia := DD - D
  else
  begin
    Dia:=DD+MonthDays[IsLeapYear(AA),MM]-D;
    Mes := Mes -1;
  end;
//Caso especial donde no ha cumplido a�os, pero los cumplir� el mismo mes
  if Mes < 0 then
  begin
    Anio := Anio - 1;
    Mes := 12 + Mes;
  end;
  Result := Format('A�os: %.0f, Meses: %.0f, Dias: %.0f', [Anio, Mes, Dia]);
end;


function CalculoCC(IentOfi,InumCta:String ) : String;

var
   Digito,DigControl : String;
   X : Byte;
   DC1,DC2,Resto : Extended;
begin
   DC1:=0;
   DC2:=0;
   x:=8;
   Repeat
      digito:=copy(IEntOfi,x,1);
      DC1:=DC1+(APesos[x+2]*StrtoInt(digito));
      inc(x,-1);
   until x=0;
   Resto := DC1-(11*(int(DC1/11)));

    DC1:=11-Resto;
    if DC1=10 then DC1:=1;
    if DC1=11 then DC1:=0;              // D�gito control Entidad-Oficina

    x:=10;
    Repeat
       digito:=copy(INumCta,x,1);
       DC2:=DC2+(APesos[x]*StrtoInt(digito));
       inc(x,-1);
    until x=0;
    Resto := DC2-(11*(int(DC2/11)));
    DC2:=11-Resto;
    if DC2=10 then DC2:=1;
    if DC2=11 then DC2:=0;         // D�gito Control C/C

    DigControl:=FloattoStr(DC1)+FloattoStr(DC2);   // los 2 n�meros del D.C.
    Result:=DigControl;
end;

function InttoBoolean (Valor: Integer): Boolean;
begin
       If Valor <> 0 then
          Result := True
       Else
          Result := False;
end;

procedure EnterTabs(var Key:Char;oSelf:TForm);
begin
  if (Key=#13) and
      not (oSelf.ActiveControl is TButton)    and
      not (oSelf.ActiveControl is TDBMemo)    and
      not (oSelf.ActiveControl is TJvStringGrid)
                                 then begin
      oSelf.Perform( WM_NEXTDLGCTL, 0,0);
      Key := #0;
      end;
end;

procedure Numerico(Sender:TObject;var Key:Char);
begin
if not (Key in [#8,#13, '0'..'9', '-', DecimalSeparator]) then
  begin
    Key := #0;
  end //End First if.
  else
  if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, TMemo(Sender).Text ) > 0) then
  begin
    Key := #0;
  end//End second if.
  else
  if (Key = '-') and (TMemo(Sender).SelStart <> 0) then
  begin
    Key := #0;
  end;//End third if.
end;

procedure NumericoSinPunto(Sender:TObject;var Key:Char);
begin
if not (Key in [#8,#13, '0'..'9']) then
  begin
    Key := #0;
  end //End First if.
  else
  if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, TMemo(Sender).Text ) > 0) then
  begin
    Key := #0;
  end//End second if.
  else
  if (Key = '-') and (TMemo(Sender).SelStart <> 0) then
  begin
    Key := #0;
  end;//End third if.
end;

function Precisarcodigo(Codigo: String): String;
var Longitud : Integer;
begin
        Longitud := 18;
        if MidStr(Codigo,17,2) = '00' then Longitud := 16; //18-10
        if MidStr(Codigo,15,2) = '00' then Longitud := 14; //16-9
        if MidStr(Codigo,13,2) = '00' then Longitud := 12; //14-8
        if MidStr(Codigo,11,2) = '00' then Longitud := 10; //12-7
        if MidStr(Codigo,9,2)  = '00' then Longitud := 8; //10-6
        if MidStr(Codigo,7,2)  = '00' then Longitud := 6; //8-5
        if MidStr(Codigo,5,2)  = '00' then Longitud := 4; //6-4
        if MidStr(Codigo,3,2)  = '00' then Longitud := 2; //4-3
        if Midstr(Codigo,2,1)  = '0'  then Longitud := 1; //1-2
        Result := LeftStr(Codigo,Longitud);
end;

procedure EnterTabsGrid (Sender: TObject; var Key: Char; DataSet:TDataSet);
begin
If Key = #13 Then Begin
 If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
  with (Sender as TDBGrid) do
  if selectedindex > 0 then
   selectedindex := selectedindex - 1
  else begin
   DataSource.DataSet.Prior;
   selectedindex := fieldcount - 1;
  end;
 end else begin
  with (Sender as TDBGrid) do
  if selectedindex < (fieldcount - 1) then
   selectedindex := selectedindex + 1
  else begin
   DataSet.Next;
   selectedindex := 0;
  end;
end;
Key := #0
end;
end;

function DigitoControl(Tipo:Integer;Cuenta: string): string;
var 
    n,i:Integer;
begin
        n := 0;
        for i := 0 to 6 do
        begin
          n := n + StrToInt(MidStr(cuenta,i+1,1));
        end;
        n := n + Tipo;
        Result := RightStr(FormatCurr('00',n),1);
end;

function TablaCer(Valor:Currency;TasaEfectiva:Single;Modalidad:string;FechaApertura,FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word): TList;
var i,max,Dias:Integer;
    ARecord:PTablaCerLiq;
    Lista:TList;
    FechaI,FechaF,FechaV:TDateTime;
    Interes:Currency;
    Tasa:Single;
    Dif:Integer;
    FinDeMes:Boolean;
    PorDias:Boolean;
    PorPeriodos:Boolean;
    Ano,Mes,Dia1,DiaApertura:Word;
begin

     {DiaApertura := DayOf(FechaApertura);
     FechaI := FechaInicial;
     if ( Amortiza mod 30 ) = 0 then
         PorPeriodos := True
       else
         PorPeriodos := False;

     if Plazo = Amortiza then PorPeriodos := False;

     if not PorPeriodos then
     begin
        FechaI := FechaInicial;
        FechaV := CalculoFecha(FechaInicial,Plazo);
        if (Amortiza mod 30) = 0 then
        begin
          DecodeDate(FechaV,Ano,Mes,Dia1);
          Dia1 := Dia1 + DayOf(FechaApertura) - DayOf(FechaInicial);
          if not TryEncodeDate(Ano,Mes,Dia1,FechaV) then
          begin
              Dia1 := DayOf(EndOfAMonth(Ano,Mes));
              FechaV := EncodeDate(Ano,Mes,Dia1);
          end;
        end;
        Lista := TList.Create;
        max := Plazo div Amortiza;
        if Modalidad = 'A' then
           Tasa := TasaNominalAnticipada(TasaEfectiva,Amortiza)
        else
           Tasa := TasaNominalVencida(TasaEfectiva,Amortiza);
        New(ARecord);
        FechaF:= FechaV;
        if FechaF > FechaV then
               FechaF := FechaV;
            Dias := DiasEntre(FechaI,FechaF);
            Interes :=SimpleRoundTo(Valor * ((Tasa / 100)* Amortiza)/360,0);
            ARecord^.Valor := Interes;
            ARecord^.FechaPago := FechaF;
            FechaI := FechaF;
            if FechaF <= ffechaactual then
               ARecord^.Liquidado := true
            else
               ARecord^.Liquidado := False;
        Lista.Add(ARecord);
        Result := Lista;
     end
     else
     begin
        FechaI := FechaInicial;
        FechaV := CalculoFecha(FechaInicial,Plazo);

        Lista := TList.Create;
        max := Plazo div Amortiza;
        if Modalidad = 'A' then
           Tasa := TasaNominalAnticipada(TasaEfectiva,Amortiza)
        else
           Tasa := TasaNominalVencida(TasaEfectiva,Amortiza);
        for i := 1 to max do
        begin
            New(ARecord);
            DecodeDate(FechaI,Ano,Mes,Dia1);
            Dia1 := DiaApertura;
            FechaF:= CalculoFechaMes(Ano,Mes,Dia1,Amortiza);
            if FechaF > FechaV then
               FechaF := FechaV;
            Dias := Amortiza;
            Interes :=SimpleRoundTo(Valor * ((Tasa / 100)* Amortiza)/360,0);
            ARecord^.Valor := Interes;
            ARecord^.FechaPago := FechaF;
            FechaI := FechaF;
            if FechaF <= ffechaactual then
               ARecord^.Liquidado := true
            else
               ARecord^.Liquidado := False;
            Lista.Add(ARecord);
        end;
        Result := Lista;
     end; }

end;

function TablaCon(Valor:Currency;FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word;FechaCorte:TDate): TList;
var i,max,Dias:Integer;
    ARecord:PTablaConLiq;
    Lista:TList;
    FechaI,FechaF,FechaV:TDate;
    Interes:Currency;
    Tasa:Single;
    Dif:Integer;
begin
        Dif := Dia - DayOf(FechaInicial);
        FechaI := FechaInicial;
        FechaF := FechaI;
        FechaV := CalculoFecha(FechaInicial,Plazo);
        if Dif > 0 then
          FechaV := CalculoFecha(FechaV,Dif);
        Lista := TList.Create;
        max := Plazo div Amortiza;
        for i := 1 to max do
        begin
            New(ARecord);
            Dif := Dia - DayOf(FechaI);
            if Dif > 0 then FechaF := CalculoFecha(FechaF,Dif);
            if FechaF > FechaV then
               FechaF := FechaV;
            Dias := DiasEntre(FechaI,FechaF);
            ARecord^.Valor := Valor;
            ARecord^.FechaDescuento := FechaF;
            FechaI := FechaF;
            if FechaF <= FechaCorte then
               ARecord^.Descontado := true
            else
               ARecord^.Descontado := False;
            Lista.Add(ARecord);
            FechaF:= CalculoFecha(FechaI,Amortiza);
        end;
        Result := Lista;
end;



function BooleanoToInt(valor: boolean): integer;
begin
        if valor then
           Result := 1
        else
           Result := 0;
end;

procedure SendControlCode(S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
//  PrinterName := 'Generica';
 PrinterName := 'EPSON TM-U675 No Cut';
{ if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  RaiseLastOSError;}
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle,@buf,lbuf,N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
    lbuf := 0;
  end; 
 end;
end;

procedure SendControlCodeNew(NombreImpresora:string;S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
 PrinterName := NombreImpresora;
// PrinterName := 'EPSON TM-U675 No Cut';
{ if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  RaiseLastOSError;}
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle,@buf,lbuf,N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
    lbuf := 0;
  end; 
 end;
end;

procedure ImprimirCadena(Impresora,S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
 Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
 PrinterName := Format('%s', [Device]);
// PrinterName := Format('%s',[Impresora]);
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle, @buf, lbuf, N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
  end;
 end;
end;

procedure Empleado;
var Cerrar:Boolean;
begin
        Cerrar := False;
        with dmGeneral.IBSQL1 do
         begin
           if not Transaction.InTransaction then
           begin
              Transaction.StartTransaction;
              Cerrar := True;
           end;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
           if Cerrar then
             Transaction.Commit;
         end;
end;

function  DiasEntre(FechaInicial:TDate;FechaFinal:TDate):Integer;
var A,AA,M,MM,D,DD:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 0;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        DecodeDate(FechaFinal,AA,MM,DD);
        FechaFinal := EncodeDate(AA,MM,DD);
        if (MM = 2) and ( (DD=28) or (DD=29)) then DD := 30;
        if DD = 31 then DD := 30;

        while true do
        begin
         if (AA = A) and (MM = M) and (DD = D) then Break;
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;
        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function  DiasEntrePagoTotal(FechaInicial:TDate;FechaFinal:TDate):Integer;
var A,AA,M,MM,D,DD:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        DecodeDate(FechaFinal,AA,MM,DD);
        FechaFinal := EncodeDate(AA,MM,DD);
        if (MM = 2) and ( (DD=28) or (DD=29)) then DD := 30;
        if DD = 31 then DD := 30;

        while true do
        begin
         if (AA = A) and (MM = M) and (DD = D) then Break;
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;
        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
var A,AA,M,MM,D,DD,AAA,DDD,MMM,AAAA,MMMM,DDDD,B:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 0;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        FechaInicial := EncodeDate(A,M,D);
        FechaFinal := EncodeDate(AA,MM,DD);
        FechaCorte := EncodeDate(AAA,MMM,DDD);

        if Negativo = True then
          if (M=2) and ((D=28) or (D=29)) then
            D := 30;

        if (MM=2) and ((DD=28) or (DD=29)) then
            DD := 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;

       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));
       if ((DDDD=29) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean;Devuelto:Boolean):Integer;
var A,AA,M,MM,D,DD,AAA,DDD,MMM,AAAA,MMMM,DDDD,B:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        FechaInicial := EncodeDate(A,M,D);
        FechaFinal := EncodeDate(AA,MM,DD);
        FechaCorte := EncodeDate(AAA,MMM,DDD);

        if (MM=2) and (DD=28) then begin
          if (DDD=28) then DD := DDD//28
          else if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD := 30
          else if (DDD<28) then DD := 30;
        end
        else if (MM=2) and (DD=29) then
          if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD:= 30
          else if (DDD<29) then DD:= 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;

       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));
       if ((DDDD=29) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if ((DDDD=28) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if (DDDD=28) and (DDD=30) and (MM=2) and Devuelto then
         Dias := Dias - 1;
       if (DDDD=28) and (DDD=29) and (MM=2) and Devuelto then
         Dias := Dias - 1;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function RecalculoSaldosGenerales:Boolean;
var
Codigo       : String;
Codigomayor  : String;
Debito       : currency;
Credito      : currency;
begin
  DmComprobante := TDmComprobante.Create(Application);
  with DmComprobante.IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select "con$puc".ID_AGENCIA,');
      SQL.Add('"con$puc".CODIGO');
      SQL.Add('from "con$puc"');
      SQL.Add('where ');
      SQL.Add('"con$puc".MOVIMIENTO = 0 and "con$puc".ID_AGENCIA = :ID_AGENCIA');
      SQL.Add('order by "con$puc".ID_AGENCIA, "con$puc".CODIGO');
      ParamByName('ID_AGENCIA').AsInteger := Agencia;
      try
        Open;
        if RecordCount > 0 then
        begin
          DmComprobante.IBVarios.SQL.Clear;
          DmComprobante.IBVarios.SQL.Add('update "con$saldoscuenta" SET DEBITO = 0, CREDITO = 0 where');
          DmComprobante.IBVarios.SQL.Add('"con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$saldoscuenta".CODIGO = :CODIGO');
          while not eof do begin
           DmComprobante.IBVarios.Close;
           DmComprobante.IBVarios.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           DmComprobante.IBVarios.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
           DmComprobante.IBVarios.ExecQuery;
           Next;
          end;
        end;
      except
          Result := False;
          DmComprobante.Free;          
          Exit;
      end;
    end;

  with DmComprobante.IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('"con$puc".ID_AGENCIA,');
      SQL.Add('"con$puc".CODIGO,');
      SQL.Add('"con$puc".CODIGOMAYOR');
      SQL.Add('from "con$puc"');
      SQL.Add('where ');
      SQL.Add('"con$puc".MOVIMIENTO <> 0 and "con$puc".ID_AGENCIA = :ID_AGENCIA');
      SQL.Add('Order by "con$puc".ID_AGENCIA,"con$puc".CODIGO');
      ParamByName('ID_AGENCIA').AsInteger := Agencia;
      Open;
        while not Eof do
         begin
           Codigo := fieldbyname('CODIGO').AsString;
           Codigomayor := FieldByName('CODIGOMAYOR').AsString;
           with DmComprobante.IBQuery2 do
            begin
              Close;
              sql.Clear;
              sql.Add('Select ');
              SQL.Add('"con$saldoscuenta"."MES",');
              sql.Add('"con$saldoscuenta"."DEBITO",');
              sql.Add('"con$saldoscuenta"."CREDITO"');
              sql.Add('from "con$saldoscuenta" ');
              sql.Add('where ');
              sql.Add('"con$saldoscuenta".ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('"con$saldoscuenta".CODIGO =:"CODIGO"');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('CODIGO').AsString := Codigo;
              try
                Open;
                while not Eof do begin
                 if (FieldByName('DEBITO').ascurrency <> 0 ) or
                    (FieldByName('CREDITO').ascurrency <> 0 ) then
                   ColocarSaldoMayor(Codigomayor,FieldByName('MES').AsInteger,FieldByName('DEBITO').AsCurrency,FieldByName('CREDITO').AsCurrency,DmComprobante.IBVarios);
                 Next;
                end;
              except
                Result := False;
                DmComprobante.Free;
                Exit;
              end;
            end;
          next;
         end;
      end;
     Dmcomprobante.IBQuery1.Transaction.Commit;
     Result := True;

  DmComprobante.Free;

end;

procedure ColocarSaldoMayor(CodigoMayor: string;Mes:Integer;Debito:Currency;Credito:Currency;IBVarios:TIBSQL);
var Nivel:Integer;
    CodigoM:string;
begin
        with IBVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select "con$puc".NIVEL,"con$puc".CODIGOMAYOR from "con$puc" where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO').AsString := CodigoMayor;
          try
           ExecQuery;
           if RecordCount > 0 then begin
            Nivel := FieldByName('NIVEL').AsInteger;
            CodigoM := FieldByName('CODIGOMAYOR').AsString;
           end
           else
             Exit;
          except
            raise;
          end;
        end;

        with ibvarios do begin
           Close;
           SQL.Clear;
           SQL.Add('update "con$saldoscuenta" SET DEBITO = DEBITO + :DEBITO, CREDITO = CREDITO + :CREDITO');
           SQL.Add('where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO and MES = :MES');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('CODIGO').AsString := CodigoMayor;
           ParamByName('MES').AsInteger:= Mes;
           ParamByName('DEBITO').AsCurrency := Debito;
           ParamByName('CREDITO').AsCurrency := Credito;
           try
            ExecQuery;
            if IBVarios.RowsAffected < 1 then
            begin
               Close;
               SQL.Clear;
               SQL.Add('insert into "con$saldoscuenta" values(:ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('CODIGO').AsString := CodigoMayor;
               ParamByName('MES').AsInteger := Mes;
               ParamByName('DEBITO').AsCurrency := Debito;
               ParamByName('CREDITO').AsCurrency := Credito;
               try
                ExecQuery;
               except
                raise;
               end;
            end;
           except
            raise;
           end;
        end;

        if Nivel > 1 then
         ColocarSaldoMayor(CodigoM,Mes,Debito,Credito,IBVarios);
end;

function ObtenerConsecutivo(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;

function ObtenerConsecutivoAyudas(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 6');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 6');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;

function ObtenerCaptacion(TipoCaptacion:Integer;IBSQL1: TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          Close;
          SQL.Clear;
          SQL.Add('select CONSECUTIVO from "cap$tipocaptacion" where ');
          SQL.Add(' ID_TIPO_CAPTACION = :"ID" ');
          ParamByName('ID').AsInteger := TipoCaptacion;
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('UPDATE "cap$tipocaptacion" ');
          SQL.Add('SET CONSECUTIVO = :CONSECUTIVO where ');
          SQL.Add('ID_TIPO_CAPTACION = :ID');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ParamByName('ID').AsInteger := TipoCaptacion;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;


function ObtenerConsecutivoTmp(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivostmp" where "gen$consecutivostmp"."ID_CONSECUTIVO" = 1');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivostmp" set "gen$consecutivostmp"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivostmp"."ID_CONSECUTIVO" = 1');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;


function ObtenerConsecutivoCajaCartera: Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
begin
       IBT1 := TIBTransaction.Create(Application);
       IBSQL1 := TIBSQL.Create(Application);
       IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT1;

       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 5');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 5');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;

function ObtenerConsecutivoCajaCarteraTmp: Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
begin
       IBT1 := TIBTransaction.Create(Application);
       IBSQL1 := TIBSQL.Create(Application);
       IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT1;

       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivostmp" where "gen$consecutivostmp"."ID_CONSECUTIVO" = 5');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivostmp" set "gen$consecutivostmp"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivostmp"."ID_CONSECUTIVO" = 5');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;
end;


function fFechaActual: TDate;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
begin
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_FECHA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
end;

function fHoraActual: TTime;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
begin
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_HORA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('HORA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
end;

function fFechaHoraActual: TDateTime;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
begin
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_FECHAHORA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHAHORA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
end;





function ValidarOpcion(IdOpcion: integer): Boolean;
var IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
begin
        IBSQL1 := TIBSQL.Create(Application);
        IBT1 := TIBTransaction.Create(Application);
        IBSQL1.Transaction := IBT1;
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           sql.Clear;
           sql.Add('select * from "gen$permisos" where ID_EMPLEADO=:ID_EMPLEADO and ID_PERMISO = :ID_PERMISO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ParamByName('ID_PERMISO').AsInteger := IdOpcion;
           try
             ExecQuery;
             if RecordCount < 1 then begin
                MessageDlg('Usted no est� autorizado para ejecutar esta opci�n',mtError,[mbcancel],0);
                Result := False;
             end
             else
                Result := True;
             Transaction.Commit;
           except
             Transaction.Rollback;
             Result := False;
             raise;
           end;
        end;

end;

function extrae_empleado: string;
begin
        with dmGeneral.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
           Transaction.StartTransaction;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Result := FieldByName('NOMBRE').AsString + ' '+FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;;
           Close;
          end;
end;

function Buscaconyuge(id_persona, id_solicitud: string;
  id_identificacion: integer): boolean;
begin
        with dmGeneral.IBSQL1 do
        begin
          SQL.Clear;
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('select * from');
          SQL.Add('"col$infconyuge"');
          SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD AND ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_SOLICITUD').AsString := id_solicitud;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          if RecordCount > 0 then
             Result := True
          else
             Result := False;
          Close;
        end;
end;

function Valida_Solicitud(id_colocacion: string;
  id_agencia: integer): string;
var IBValida:TIBSQL;
    IBTValida:TIBTransaction;
begin
        IBValida := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBValida.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBValida do
        begin
          Close;
          if Transaction.InTransaction then
              Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ID_SOLICITUD from "col$desembolsoparcial"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
          SQL.Add('and DESEMBOLSADO = 0');
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('ID_AGENCIA').AsInteger := id_agencia;
          ExecQuery;
          if RecordCount > 0 then
             Result := FieldByName('ID_SOLICITUD').AsString
          else
             Result := '';
          Close;
        end;
end;

function define_tasa(linea: integer; tasa: Currency): string;
var     IBSQL :TIBSQL;
        IBTRAN :TIBTransaction;
        puntos :string;
begin
        IBSQL := TIBSQL.Create(Application);
        IBTRAN := TIBTransaction.Create(Application);
        IBSQL.Transaction := IBTRAN;
        IBTRAN.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$lineas".PUNTOS_ADICIONALES');
          SQL.Add('FROM');
          SQL.Add('"col$lineas"');
          SQL.Add('WHERE');
          SQL.Add('("col$lineas".ID_LINEA = :ID_LINEA)');
          ParamByName('ID_LINEA').AsInteger := linea;
          ExecQuery;
          puntos := FieldByName('PUNTOS_ADICIONALES').AsString;
          Close;
        end;
        if Linea = 8 then
           Result := 'IPC + ' + puntos + ' PUNTOS'
        else if linea  = 10 then
           Result := 'DTF + ' + puntos + ' PUNTOS'
        else
           Result := CurrToStr(tasa) + '%';

end;

function Obtener_Estado(id_estado: integer): string;
var     IBSQL :TIBSQL;
        IBTRAN :TIBTransaction;
        puntos :string;
begin
        IBSQL := TIBSQL.Create(Application);
        IBTRAN := TIBTransaction.Create(Application);
        IBSQL.Transaction := IBTRAN;
        IBTRAN.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$estadosolicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$estadosolicitud".ID_ESTADO = :ID_ESTADO)');
          ParamByName('ID_ESTADO').AsInteger := id_estado;
          ExecQuery;
          Result := FieldByName('DESCRIPCION_ESTADO').AsString;
          Close;
        end;
end;

end.
