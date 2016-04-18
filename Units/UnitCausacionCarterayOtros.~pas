unit UnitCausacionCarterayOtros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, IBCustomDataSet, IBQuery,
  DB, Provider, DBClient, Grids, DBGrids, UnitDmGeneral, FR_DSet, FR_DBSet,
  FR_Class, FR_E_TXT, FR_E_CSV, DateUtils, IBSQL, IBDatabase, JvDialogs;

type
  TfrmCausacionCarterayOtros = class(TForm)
    Label1: TLabel;
    EDfecha: TDateTimePicker;
    btnProcesar: TBitBtn;
    Panel1: TPanel;
    btnAplicar: TBitBtn;
    CmdCerrar: TBitBtn;
    DSgrid: TDataSource;
    IBQcodigo: TIBQuery;
    DBgrid: TDBGrid;
    IBQdeposito: TIBQuery;
    IBQcartera: TIBQuery;
    IBQpersona: TIBQuery;
    CDSgrid: TClientDataSet;
    CDSgridID_PERSONA: TStringField;
    CDSgridPRIMER_APELLIDO: TStringField;
    CDSgridSEGUNDO_APELLIDO: TStringField;
    CDSgridNOMBRE: TStringField;
    CDSgridID_PRODUCTO: TIntegerField;
    CDSgridPRODUCTO: TStringField;
    CDSgridNUMERO: TStringField;
    CDSgridCAPITAL: TCurrencyField;
    CDSgridINTERES: TCurrencyField;
    CDSgridDEPOSITO: TCurrencyField;
    CDSgridID_CLASIFICACION: TIntegerField;
    CDSgridID_GARANTIA: TIntegerField;
    CDSgridID_LINEA: TIntegerField;
    CDSgridVALOR: TCurrencyField;
    CDSgridAMORTIZACION: TIntegerField;
    btnPlano: TBitBtn;
    btnLibranza: TBitBtn;
    frReport1: TfrReport;
    frCSVExport1: TfrCSVExport;
    frTextExport1: TfrTextExport;
    CDSreporte: TClientDataSet;
    CDSreporteID_PERSONA: TStringField;
    CDSreporteNOMBRE: TStringField;
    CDSreporteVALOR: TCurrencyField;
    frDBDataSet1: TfrDBDataSet;
    CDSgridID_CATEGORIA: TStringField;
    CDSgridOTROS: TCurrencyField;
    IBQdescuento: TIBQuery;
    btnCaja: TBitBtn;
    CDSgridID_TIPO_RELACION: TIntegerField;
    CDSgridSALDO: TCurrencyField;
    IBQextractocolocacion: TIBQuery;
    CDSgridTASA: TFloatField;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Label2: TLabel;
    EdFechaNota: TDateTimePicker;
    btnComprobante: TBitBtn;
    IBQpuc: TIBQuery;
    IBQcodigopucbasico: TIBQuery;
    IBTcomprobante: TIBTransaction;
    IBSQLcomprobante: TIBSQL;
    IBQauxiliar: TIBQuery;
    IBQcomprobante: TIBQuery;
    dlgSave: TJvSaveDialog;
    CDSplano: TClientDataSet;
    CDSplanoNIT: TStringField;
    CDSplanoDV: TStringField;
    CDSplanoTIPO: TStringField;
    CDSplanoFECHA_INI: TStringField;
    CDSplanoFECHA_FIN: TStringField;
    CDSplanoTOTAL: TStringField;
    CDSplanoACUMULADO: TStringField;
    CDSplanoVALOR: TCurrencyField;
    CDSplanoCONCEPTO: TStringField;
    CDSplanoID_PERSONA: TStringField;
    CDSreporteSEGURO: TCurrencyField;
    IBQcausaciondiaria: TIBQuery;
    IBQcargomes: TIBQuery;
    procedure CmdCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CDSgridCalcFields(DataSet: TDataSet);
    procedure DBgridTitleClick(Column: TColumn);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnPlanoClick(Sender: TObject);
    procedure btnLibranzaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCajaClick(Sender: TObject);
    procedure btnComprobanteClick(Sender: TObject);

  private
    { Private declarations }
    procedure ProcesarAplicar;
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
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;
var
  frmCausacionCarterayOtros: TfrmCausacionCarterayOtros;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses Math, UnitGlobales, UnitGlobalesCol, UnitPantallaProgreso;

procedure TfrmCausacionCarterayOtros.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCausacionCarterayOtros.btnProcesarClick(Sender: TObject);
var
                    ARegistro     : PList;
                    List          : TList;
                    CuotasLiq     : TCuotasLiq;
                    AF            : PCuotasLiq;
                    AR            : PCuotasLiq;
                    Colocacion    : String;
                    Clasificacion : Integer;
                    Categoria     : String;
                    Garantia      : Integer;
                    Linea         : Integer;
                    SaldoActual   : Currency;

                    TipoInteres   : Integer;
                    TipoCuota     : Integer;
                    ValorCuota    : Currency;

                    ValorTasa     : Double;
                    PuntosAdic    : Double;
                    ValorMora     : Double;
                    AmortizaK     : Integer;
                    AmortizaI     : Integer;
                    DiasProrroga  : Integer;
                    FechaPagoK    : TDate;
                    FechaPagoI    : TDate;
                    Estado        : Integer;
                    Capital       : Currency;
                    Interes       : Currency;
                    Descuento     : Currency;


// Calculo de los Descuentos Adicionales
                vValorBase : Currency;
                vPorcentaje : Double;

begin
// Validar Proceso Anterior
        if (IBQPersona.Transaction.InTransaction ) then
        begin
            IBQPersona.Transaction.Rollback;
        end;

        IBQPersona.Transaction.StartTransaction;
        IBQcartera.Close;
        IBQcartera.SQL.Add('SELECT COUNT(*) AS TOTAL FROM GEN$DESCUENTOCARTERA WHERE FECHA_CORTE = :FECHA');
        IBQcartera.ParamByName('FECHA').AsDate := EDfecha.Date;
        IBQcartera.Open;
        if (IBQcartera.FieldByName('TOTAL').AsInteger > 0) then
        begin
            Showmessage('Este periodo ya fue procesado');
            btnComprobante.Enabled := True;
            Exit;
        end;

//





        IBQPersona.SQL.Clear;
        IBQPersona.SQL.Add('SELECT p.ID_PERSONA, p.ID_TIPO_RELACION, t.NUMERO_CUENTA, p.NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO from ');
        IBQPersona.SQL.Add('"gen$persona" p');
        IBQPersona.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_IDENTIFICACION = p.ID_IDENTIFICACION and t.ID_PERSONA = p.ID_PERSONA ');
        IBQPersona.SQL.Add('WHERE t.ID_TIPO_CAPTACION = 1 AND p.ID_ESTADO = 1 AND p.ID_TIPO_RELACION < 3 ORDER BY NUMERO_CUENTA ASC');
        IBQPersona.Open;

        CDSgrid.Open;

        while not IBQpersona.Eof do
        begin
         IBQcartera.Close;
         IBQcartera.SQL.Clear;
         IBQcartera.SQL.Add('SELECT 999 AS ID, c.ID_PERSONA, c.ID_COLOCACION, c.ID_CLASIFICACION, c.ID_CATEGORIA, ');
         IBQcartera.SQL.Add('c.ID_GARANTIA, c.ID_LINEA, c.VALOR_DESEMBOLSO, (c.VALOR_DESEMBOLSO - c.ABONOS_CAPITAL) AS SALDO_ACTUAL,');
         IBQcartera.SQL.Add('c.ID_INTERES, c.ID_TIPO_CUOTA ,l.DESCRIPCION_LINEA, c.VALOR_CUOTA, c.TASA_INTERES_CORRIENTE,');
         IBQcartera.SQL.Add('c.AMORTIZA_CAPITAL, c.AMORTIZA_INTERES, c.DIAS_PRORROGADOS, c.FECHA_CAPITAL, c.FECHA_INTERES, c.ID_ESTADO_COLOCACION');
         IBQcartera.SQL.Add(' FROM "col$colocacion" c');
         IBQcartera.SQL.Add('INNER JOIN "col$lineas" l ON l.ID_LINEA = c.ID_LINEA ');
         IBQcartera.SQL.Add('WHERE c.ID_PERSONA = :ID_PERSONA  and c.FECHA_DESEMBOLSO <= :FECHA_CORTE and c.ID_ESTADO_COLOCACION IN (0,1,2)');
         IBQcartera.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
         IBQcartera.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
         IBQcartera.Open;

         while not IBQcartera.Eof do
         begin
             CDSgrid.Insert;
             CDSgridID_PERSONA.Value := IBQcartera.FieldByName('ID_PERSONA').AsString;
             CDSgridID_TIPO_RELACION.Value := IBQpersona.FieldByName('ID_TIPO_RELACION').AsInteger;
             CDSgridPRIMER_APELLIDO.Value := IBQpersona.FieldByName('PRIMER_APELLIDO').AsString;
             CDSgridSEGUNDO_APELLIDO.Value := IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
             CDSgridNOMBRE.Value := IBQpersona.FieldByName('NOMBRE').AsString;
             CDSgridID_PRODUCTO.Value := 999;
             CDSgridNUMERO.Value := IBQcartera.FieldByName('ID_COLOCACION').AsString;
             CDSgridPRODUCTO.Value := IBQcartera.FieldByName('DESCRIPCION_LINEA').AsString;
             CDSgridID_CLASIFICACION.Value := IBQcartera.FieldByName('ID_CLASIFICACION').AsInteger;
             CDSgridID_GARANTIA.Value := IBQcartera.FieldByName('ID_GARANTIA').AsInteger;
             CDSgridID_LINEA.Value := IBQcartera.FieldByName('ID_LINEA').AsInteger;
             CDSgridID_CATEGORIA.Value := IBQcartera.FieldByName('ID_CATEGORIA').AsString;
             
             // Información de la Colocacion
                    Colocacion    := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                    Clasificacion := IBQcartera.FieldByName('ID_CLASIFICACION').AsInteger;
                    Categoria     := IBQcartera.FieldByName('ID_CATEGORIA').AsString;
                    Garantia      := IBQcartera.FieldByName('ID_GARANTIA').AsInteger;
                    Linea         := IBQcartera.FieldByName('ID_LINEA').AsInteger;
                    SaldoActual   := IBQcartera.FieldByName('SALDO_ACTUAL').AsCurrency;
//     TipoCapital   := FieldByName('CAPITAL').AsString;
                    TipoInteres   := IBQcartera.FieldByName('ID_INTERES').AsInteger;
                    TipoCuota     := IBQcartera.FieldByName('ID_TIPO_CUOTA').AsInteger;
                    ValorCuota    := IBQcartera.FieldByName('VALOR_CUOTA').AsCurrency;

                    ValorTasa := IBQcartera.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                    PuntosAdic := 0.00; //FieldByName('PUNTOS_INTERES').AsFloat;
                    ValorMora     := 0; //(ValorTasa + PuntosAdic) + FieldByName('TASA_INTERES_MORA').AsFloat;
                    AmortizaK     := IBQcartera.FieldByName('AMORTIZA_CAPITAL').AsInteger;
                    AmortizaI     := IBQcartera.FieldByName('AMORTIZA_INTERES').AsInteger;
                    DiasProrroga  := IBQcartera.FieldByName('DIAS_PRORROGADOS').AsInteger;
                    FechaPagoK    := IBQcartera.FieldByName('FECHA_CAPITAL').AsDateTime;
                    FechaPagoI    := IBQcartera.FieldByName('FECHA_INTERES').AsDateTime;
                    Estado        := IBQcartera.FieldByName('ID_ESTADO_COLOCACION').AsInteger;

             //
             //LiquidarCuotasFija(Agencia, Colocacion, 1, EDfecha.Date, CuotasLiq,
             //                   Clasificacion, Garantia, Categoria, Estado, ValorCuota,
             //                   FechaPagoK, FechaPagoI, TipoInteres, ValorTasa, ValorMora,
             //                   PuntosAdic, SaldoActual, AmortizaK, AmortizaI,DiasProrroga);

             Interes := SimpleRoundTo((SaldoActual * (TasaNominalVencida(ValorTasa,AmortizaI)) / 100 * AmortizaI) / 360,0);
             if (ValorCuota > Interes) then
                Capital := ValorCuota - Interes
             else
                Capital := SaldoActual;

             if (Capital > SaldoActual) then
                 Capital := SaldoActual;


             Descuento := 0;
             IBQdescuento.Close;
             IBQdescuento.SQL.Clear;
             IBQdescuento.SQL.Add('SELECT * FROM "col$colocaciondescuento" c');
             IBQdescuento.SQL.Add('INNER JOIN "col$descuentos" d ON d.ID_DESCUENTO = c.ID_DESCUENTO');
             IBQdescuento.SQL.Add('WHERE c.ID_COLOCACION = :ID_COLOCACION');
             IBQdescuento.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
             IBQdescuento.Open;
             while not IBQdescuento.Eof do
             begin
                vValorBase := 0;
                vPorcentaje := 0;
                if (IBQdescuento.FieldByName('PORCENTAJE_COLOCACION').AsFloat > 0) then
                begin
                   vValorBase := IBQcartera.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                   vPorcentaje := IBQdescuento.FieldByName('PORCENTAJE_COLOCACION').AsFloat;
                end
                else
                if (IBQdescuento.FieldByName('PORCENTAJE_CUOTA').AsFloat > 0 ) then
                begin
                   vValorBase := IBQcartera.FieldByName('VALOR_CUOTA').AsCurrency;
                   vPorcentaje := IBQdescuento.FieldByName('PORCENTAJE_CUOTA').AsFloat;
                end
                else
                if (IBQdescuento.FieldByName('PORCENTAJE_SALDO').AsFloat > 0 ) then
                begin
                   vValorBase := IBQcartera.FieldByName('SALDO_ACTUAL').AsCurrency;
                   vPorcentaje := IBQdescuento.FieldByName('PORCENTAJE_SALDO').AsFloat;
                end;
                Descuento := Descuento + SimpleRoundTo (vValorBase * vPorcentaje/100,0);
                IBQdescuento.Next;
             end;



             CDSgridCAPITAL.Value := Capital;
             CDSgridINTERES.Value := Interes;
             CDSgridOTROS.Value := Descuento;
             CDSgridDEPOSITO.Value := 0;
             CDSgridSALDO.Value := IBQcartera.FieldByName('SALDO_ACTUAL').AsCurrency;
             CDSgrid.Post;
             Application.ProcessMessages;

             
             //
             IBQcartera.Next;
         end;


         IBQdeposito.Close;
         IBQdeposito.SQL.Clear;
         IBQdeposito.SQL.Add('select c.ID_TIPO_CAPTACION, c.DESCRIPCION, t.NUMERO_CUENTA, l.VALOR FROM "cap$tipocaptacion" c ');
         IBQdeposito.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_TIPO_CAPTACION = c.ID_TIPO_CAPTACION ');
         IBQdeposito.SQL.Add('LEFT JOIN GEN$PERSONALIBRANZA l on l.ID_PERSONA = t.ID_PERSONA and l.ID_TIPO_CAPTACION = c.ID_TIPO_CAPTACION');
         IBQdeposito.SQL.Add('WHERE t.ID_PERSONA = :ID_PERSONA ');
         IBQdeposito.SQL.Add('ORDER BY c.ID_TIPO_CAPTACION ASC');
         IBQdeposito.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
         IBQdeposito.Open;

         while not IBQdeposito.Eof do
         begin
            CDSgrid.Insert;
            CDSgridID_PERSONA.Value := IBQpersona.FieldByName('ID_PERSONA').AsString;
            CDSgridID_TIPO_RELACION.Value := IBQpersona.FieldByName('ID_TIPO_RELACION').AsInteger;
            CDSgridPRIMER_APELLIDO.Value := IBQpersona.FieldByName('PRIMER_APELLIDO').AsString;
            CDSgridSEGUNDO_APELLIDO.Value := IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
            CDSgridNOMBRE.Value := IBQpersona.FieldByName('NOMBRE').AsString;
            CDSgridID_PRODUCTO.Value := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            CDSgridNUMERO.Value := IBQdeposito.FieldByName('NUMERO_CUENTA').AsString;
            CDSgridPRODUCTO.Value := IBQdeposito.FieldByName('DESCRIPCION').AsString;
            CDSgridCAPITAL.Value := 0;
            CDSgridINTERES.Value := 0;
            CDSgridDEPOSITO.Value := IBQdeposito.FieldByName('VALOR').AsCurrency;
            CDSgridID_CLASIFICACION.Value:= 0;
            CDSgridID_GARANTIA.Value := 0;
            CDSgridID_LINEA.Value := 0;
            CDSgridID_CATEGORIA.Value := '';
            CDSgrid.Post;
            Application.ProcessMessages;
            IBQdeposito.Next;

         end;


         Application.ProcessMessages;
         IBQpersona.Next;
        end;
        btnProcesar.Enabled := False;
        btnPlano.Enabled := True;
        btnCaja.Enabled := True;
        btnLibranza.Enabled := True;
        btnAplicar.Enabled := True;
        ShowMessage('Proceso finalizado !!!');

end;

procedure TfrmCausacionCarterayOtros.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQpersona.Database := dmGeneral.IBDatabase1;
        IBQcartera.Database := dmGeneral.IBDatabase1;
        IBQdeposito.Database := dmGeneral.IBDatabase1;
        IBQcodigo.Database := dmGeneral.IBDatabase1;
        IBQdescuento.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBQcodigopucbasico.Database := dmGeneral.IBDatabase1;
        IBSQLcomprobante.Database := dmGeneral.IBDatabase1;
        IBTcomprobante.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQcausaciondiaria.Database := dmGeneral.IBDatabase1;
        IBQextractocolocacion.Database := dmGeneral.IBDatabase1;
        IBQcargomes.Database := dmGeneral.IBDatabase1;

        IBQpersona.Transaction := dmGeneral.IBTransaction1;
        IBQcartera.Transaction := dmGeneral.IBTransaction1;
        IBQdeposito.Transaction := dmGeneral.IBTransaction1;
        IBQcodigo.Transaction := dmGeneral.IBTransaction1;
        IBQdescuento.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBQcodigopucbasico.Transaction := dmGeneral.IBTransaction1;
        IBSQLcomprobante.Transaction := IBTcomprobante;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQcausaciondiaria.Transaction := dmGeneral.IBTransaction1;
        IBQextractocolocacion.Transaction := dmGeneral.IBTransaction1;
        IBQcargomes.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmCausacionCarterayOtros.CDSgridCalcFields(DataSet: TDataSet);
begin
        CDSgridVALOR.Value := CDSgridCAPITAL.Value + CDSgridINTERES.Value + CDSgridOTROS.Value +CDSgridDEPOSITO.Value;
end;

procedure TfrmCausacionCarterayOtros.DBgridTitleClick(Column: TColumn);
begin
      case Column.Index of
        0: CDSgrid.IndexName := 'CDSgridIndex1';
        1: CDSgrid.IndexName := 'CDSgridIndex2';
        2: CDSgrid.IndexName := 'CDSgridIndex3';
        3: CDSgrid.IndexName := 'CDSgridIndex4';
      end;
end;

procedure TfrmCausacionCarterayOtros.btnAplicarClick(Sender: TObject);
begin
        if (MessageDlg('Seguro de Aplicar la Causación?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
        begin
            ProcesarAplicar;
        end;
end;

procedure TfrmCausacionCarterayOtros.ProcesarAplicar;
var
 FechaSiguiente:TDate;
 SaldoActual,SaldoDeuda: Currency;
 CuotaNumero: Integer;
 TipoOperacion: Integer;
 Consec : Integer;
 HoraActual : TTime;
 CargoMes : Currency;
begin
      CDSgrid.Filtered := False;
      CDSgrid.First;

      Consec := ObtenerConsecutivo(IBSQL2, 1);
      HoraActual := fHoraActual;

      if (IBQdeposito.Transaction.InTransaction) then
         IBQdeposito.Transaction.Commit;
      IBQdeposito.Transaction.StartTransaction;

      while not CDSgrid.Eof do
      begin
           if (CDSgrid.FieldByName('ID_PRODUCTO').AsInteger = 999) then
           begin
               // Cartera
               IBQcartera.Close;
               IBQcartera.SQL.Clear;
               IBQcartera.SQL.Add('insert into GEN$DESCUENTOCARTERA VALUES(');
               IBQcartera.SQL.Add(':FECHA_CORTE, :ID_COLOCACION,:CAPITAL,:INTERES,:APLICADO,:AMORTIZACION,:DESCUENTO,:SALDO');
               IBQcartera.SQL.Add(')');
               IBQcartera.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
               IBQcartera.ParamByName('ID_COLOCACION').AsString := CDSgrid.FieldByName('NUMERO').AsString;
               IBQcartera.ParamByName('CAPITAL').AsCurrency := CDSgrid.FieldByName('CAPITAL').AsCurrency;
               IBQcartera.ParamByName('INTERES').AsCurrency := CDSgrid.FieldByName('INTERES').AsCurrency;
               IBQcartera.ParamByName('DESCUENTO').AsCurrency := CDSgrid.FieldByName('OTROS').AsCurrency;
               IBQcartera.ParamByName('APLICADO').AsInteger := 0;
               IBQcartera.ParamByName('AMORTIZACION').AsInteger := CDSgrid.FieldByName('AMORTIZACION').AsInteger;
               IBQcartera.ParamByName('SALDO').AsCurrency := CDSgrid.FieldByName('SALDO').AsCurrency;
               IBQcartera.ExecSQL;

               // TODO
               // Actualizar datos de cartera
               {
               IBQcartera.Close;
               IBQcartera.SQL.Clear;
               IBQcartera.SQL.Add('SELECT * FROM "col$colocacion" c WHERE c.ID_COLOCACION = :ID_COLOCACION');
               IBQcartera.ParamByName('ID_COLOCACION').AsString := CDSdataNUMERO.Value;
               IBQcartera.Open;
               }
               
               SaldoActual := CDSgrid.FieldByName('SALDO').AsCurrency;

               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('SELECT COUNT(*) AS CUOTAS FROM "col$tablaliquidacion" t WHERE t.ID_COLOCACION = :ID_COLOCACION and t.PAGADA = 1');
               IBSQL2.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
               IBSQL2.ExecQuery;

               CuotaNumero := IBSQL2.FieldByName('CUOTAS').AsInteger;
               CuotaNumero := CuotaNumero + 1;

               TipoOperacion := 1;

               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('UPDATE "col$colocacion" c SET c.ABONOS_CAPITAL = c.ABONOS_CAPITAL + :CAPITAL,');
               IBSQL1.SQL.Add('c.FECHA_CAPITAL = :FECHA_CAPITAL, c.FECHA_INTERES = :FECHA_INTERES');
               IBSQL1.SQL.Add('WHERE c.ID_COLOCACION = :ID_COLOCACION');
               IBSQL1.ParamByName('CAPITAL').AsCurrency := CDSgridCAPITAL.Value;
               FechaSiguiente := CalculoFecha(EdFecha.Date,CDSgridAMORTIZACION.Value);
               IBSQL1.ParamByName('FECHA_CAPITAL').AsDate := FechaSiguiente;
               IBSQL1.ParamByName('FECHA_INTERES').AsDate := FechaSiguiente;
               IBSQL1.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
               IBSQL1.ExecQuery;

               if (CDSgridCAPITAL.Value >= SaldoActual) then
               begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('UPDATE "col$colocacion" c SET c.ID_ESTADO_COLOCACION = 7, c.FECHA_SALDADO =:FECHA WHERE c.ID_COLOCACION = :ID_COLOCACION');
                  IBSQL1.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
                  IBSQL1.ParamByName('FECHA').AsDate := EdFecha.Date;
                  IBSQL1.ExecQuery;
               end
               else
               begin

                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('SELECT * FROM "col$colocacion" c  WHERE c.ID_COLOCACION = :ID_COLOCACION');
                  IBSQL1.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
                  IBSQL1.ExecQuery;


                  IBQcausaciondiaria.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBQcausaciondiaria.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
                  IBQcausaciondiaria.ParamByName('FECHA_CORTE').AsDate := EDfecha.Date;
                  IBQcausaciondiaria.ParamByName('ID_CLASIFICACION').AsInteger := CDSgridID_CLASIFICACION.Value;
                  IBQcausaciondiaria.ParamByName('ID_GARANTIA').AsInteger := CDSgridID_GARANTIA.Value;
                  IBQcausaciondiaria.ParamByName('ID_EDAD_ANT').AsString := 'A';
                  IBQcausaciondiaria.ParamByName('ID_EDAD_ACT').AsString := 'A';
                  IBQcausaciondiaria.ParamByName('ID_ARRASTRE').AsString := 'A';
                  IBQcausaciondiaria.ParamByName('ID_IDENTIFICACION').AsInteger := 3;
                  IBQcausaciondiaria.ParamByName('ID_PERSONA').AsString := CDSgridID_PERSONA.Value;
                  IBQcausaciondiaria.ParamByName('FECHA_DESEMBOLSO').AsDate :=  IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDate;
                  IBQcausaciondiaria.ParamByName('VALOR').AsCurrency := IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                  SaldoDeuda := IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency - IBSQL1.FieldByName('ABONOS_CAPITAL').AsCurrency;
                  IBQcausaciondiaria.ParamByName('DEUDA').AsCurrency := SaldoDeuda;
                  IBQcausaciondiaria.ParamByName('ID_TIPO_CUOTA').AsInteger := IBSQL1.FieldByName('ID_TIPO_CUOTA').AsInteger;
                  IBQcausaciondiaria.ParamByName('FECHA_CAPITAL').AsDate :=  FechaSiguiente;
                  IBQcausaciondiaria.ParamByName('FECHA_INTERES').AsDate :=  FechaSiguiente;
                  IBQcausaciondiaria.ParamByName('TIPOC_INTERES').AsString := IBSQL1.FieldByName('TIPO_INTERES').AsString;
                  IBQcausaciondiaria.ParamByName('AMORTIZA_CAPITAL').AsInteger := IBSQL1.FieldByName('AMORTIZA_CAPITAL').AsInteger;
                  IBQcausaciondiaria.ParamByName('AMORTIZA_INTERES').AsInteger := IBSQL1.FieldByName('AMORTIZA_INTERES').AsInteger;
                  IBQcausaciondiaria.ParamByName('TIPO_INTERES').AsString := IBSQL1.FieldByName('TIPO_INTERES').AsString;
                  IBQcausaciondiaria.ParamByName('TASA_INTERES_CORRIENTE').AsFloat := IBSQL1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                  IBQcausaciondiaria.ParamByName('ID_INTERES').AsInteger := IBSQL1.FieldByName('ID_INTERES').AsInteger;
                  IBQcausaciondiaria.ParamByName('VALOR_ACTUAL_TASA').AsFloat := IBSQL1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                  IBQcausaciondiaria.ParamByName('PUNTOS_INTERES').AsFloat := IBSQL1.FieldByname('PUNTOS_INTERES').AsFloat;
                  IBQcausaciondiaria.ParamByName('DIAS').AsInteger := 0;
                  IBQcausaciondiaria.ParamByName('TASA').AsFloat := IBSQL1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                  IBQcausaciondiaria.ParamByName('ANTICIPADOS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('CAUSADOS').AsCurrency := CDSgridINTERES.Value;
                  IBQcausaciondiaria.ParamByName('CONTINGENCIAS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('APORTES').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCAPITAL').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PINTERES').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCOSTAS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('CORTO_PL').AsCurrency := SaldoDeuda;
                  IBQcausaciondiaria.ParamByName('LARGO_PL').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('COSTAS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('ID_ESTADO').AsInteger := 0;
                  IBQcausaciondiaria.ParamByName('PCAPITAL_REC').AsCurrency :=0;
                  IBQcausaciondiaria.ParamByName('PINTERES_REC').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCOSTAS_REC').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCAPITAL_REV').AsCurrency :=0;
                  IBQcausaciondiaria.ParamByName('PINTERES_REV').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCOSTAS_REV').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCAPITAL_GAS').AsCurrency :=0;
                  IBQcausaciondiaria.ParamByName('PINTERES_GAS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('PCOSTAS_GAS').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('VALOR_GARANTIA').AsCurrency := 0;
                  IBQcausaciondiaria.ParamByName('GARANTIA_DESCONTADA').AsCurrency :=0;
                  IBQcausaciondiaria.ParamByName('MOROSIDAD').AsCurrency := 0;
                  IBQcausaciondiaria.ExecSQL;

               end;

               IBQextractocolocacion.Close;
               IBQextractocolocacion.SQL.Clear;
               IBQextractocolocacion.SQL.Add('INSERT INTO "col$extracto" VALUES (');
               IBQextractocolocacion.SQL.Add(':ID_AGENCIA,:ID_CBTE_COLOCACION,:ID_COLOCACION,');
               IBQextractocolocacion.SQL.Add(':FECHA_EXTRACTO,:HORA_EXTRACTO,:CUOTA_EXTRACTO,');
               IBQextractocolocacion.SQL.Add(':TIPO_OPERACION,:SALDO_ANTERIOR_EXTRACTO,:ABONO_CAPITAL,');
               IBQextractocolocacion.SQL.Add(':ABONO_CXC,:ABONO_ANTICIPADO,:ABONO_SERVICIOS,:ABONO_MORA,');
               IBQextractocolocacion.SQL.Add(':ABONO_SEGURO,:ABONO_PAGXCLI,:ABONO_HONORARIOS,:ABONO_OTROS,');
               IBQextractocolocacion.SQL.Add(':TASA_INTERES_LIQUIDACION,:ID_EMPLEADO,:INTERES_PAGO_HASTA,:CAPITAL_PAGO_HASTA,');
               IBQextractocolocacion.SQL.Add(':TIPO_ABONO');
               IBQextractocolocacion.SQL.Add(')');
               IBQextractocolocacion.ParamByName('ID_AGENCIA').AsInteger := Agencia;
               IBQextractocolocacion.ParamByName('ID_CBTE_COLOCACION').AsInteger := Consec;
               IBQextractocolocacion.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
               IBQextractocolocacion.ParamByName('FECHA_EXTRACTO').AsDate := EdFechaNota.Date;
               IBQextractocolocacion.ParamByName('HORA_EXTRACTO').AsTime := HoraActual;
               IBQextractocolocacion.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaNumero;
               IBQextractocolocacion.ParamByName('TIPO_OPERACION').AsInteger := TipoOperacion;
               IBQextractocolocacion.ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := CDSgrid.FieldByName('SALDO').AsCurrency;
               IBQextractocolocacion.ParamByName('ABONO_CAPITAL').AsCurrency := CDSgridCAPITAL.Value;
               IBQextractocolocacion.ParamByName('ABONO_CXC').AsCurrency := CDSgridINTERES.Value;
               IBQextractocolocacion.ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('ABONO_SERVICIOS').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('ABONO_MORA').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('ABONO_SEGURO').AsCurrency := CDSgridOTROS.Value;
               IBQextractocolocacion.ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('ABONO_OTROS').AsCurrency := 0;
               IBQextractocolocacion.ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := CDSgridTASA.Value;
               IBQextractocolocacion.ParamByName('ID_EMPLEADO').AsString := DBAlias;
               IBQextractocolocacion.ParamByName('INTERES_PAGO_HASTA').AsDate := FechaSiguiente;
               IBQextractocolocacion.ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaSiguiente;
               IBQextractocolocacion.ParamByName('TIPO_ABONO').AsBoolean := False;
               IBQextractocolocacion.ExecSQL;

               // Actualizar tabla liquidacion
               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('UPDATE "col$tablaliquidacion" SET PAGADA = 1 WHERE CUOTA_NUMERO = :CUOTA AND ID_COLOCACION = :ID_COLOCACION');
               IBSQL1.ParamByName('CUOTA').AsInteger := CuotaNumero;
               IBSQL1.ParamByName('ID_COLOCACION').AsString := CDSgridNUMERO.Value;
               IBSQL1.ExecQuery;
           end
           else
           begin

                 IBQdeposito.Close;
                 IBQdeposito.SQL.Clear;
                 IBQdeposito.SQL.Add('SELECT * FROM "cap$maestro" m WHERE m.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and m.NUMERO_CUENTA = :NUMERO_CUENTA');
                 IBQdeposito.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDSgridID_PRODUCTO.Value;
                 IBQdeposito.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(CDSgridNUMERO.Value);
                 IBQdeposito.Open;


                 if (CDSgridDEPOSITO.Value > 0) then
                 begin
                 IBSQL1.Close;
                 IBSQL1.SQL.Clear;
                 IBSQL1.SQL.Add('INSERT INTO "cap$extracto" VALUES (');
                 IBSQL1.SQL.Add(':ID_AGENCIA, :ID_TIPO_CAPTACION, :NUMERO_CUENTA, :DIGITO_CUENTA,');
                 IBSQL1.SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
                 IBSQL1.SQL.Add(':DOCUMENTO_MOVIMIENTO, :DESCRIPCION_MOVIMIENTO, :VALOR_DEBITO, :VALOR_CREDITO');
                 IBSQL1.SQL.Add(')');
                 IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := IBQdeposito.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := IBQdeposito.FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL1.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFechaNota.Date;
                 IBSQL1.ParamByName('HORA_MOVIMIENTO').AsTime := HoraActual;
                 IBSQL1.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                 IBSQL1.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := IntToStr(Consec);
                 IBSQL1.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'ABONO CUOTA DEL PERIODO';
                 IBSQL1.ParamByName('VALOR_DEBITO').AsCurrency := CDSgridDEPOSITO.Value;
                 IBSQL1.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                 IBSQL1.ExecQuery;

                 IBQdeposito.Close;
                 IBQdeposito.SQL.Clear;
                 IBQdeposito.SQL.Add('insert into GEN$DESCUENTODEPOSITO VALUES(');
                 IBQdeposito.SQL.Add(':FECHA_CORTE, :ID_AGENCIA, :ID_TIPO_CAPTACION,:NUMERO_CUENTA, :VALOR, :APLICADO');
                 IBQdeposito.SQL.Add(')');
                 IBQdeposito.ParamByName('FECHA_CORTE').AsDate := EdFechaNota.Date;
                 IBQdeposito.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBQdeposito.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDSgridID_PRODUCTO.Value;
                 IBQdeposito.ParamByName('NUMERO_CUENTA').AsInteger := CDSgridNUMERO.AsInteger;
                 IBQdeposito.ParamByname('VALOR').AsCurrency := CDSgridVALOR.AsCurrency;
                 IBQdeposito.ParamByName('APLICADO').AsInteger := 0;
                 IBQdeposito.ExecSQL;
                 end;
           end;


           Application.ProcessMessages;
           CDSgrid.Next;
      end;


      IBQdeposito.Transaction.Commit;
      btnAplicar.Enabled := False;
      btnComprobante.Enabled := True;
      Showmessage('Valores Aplicados');
end;

procedure TfrmCausacionCarterayOtros.btnPlanoClick(Sender: TObject);
var
        Stream: TFileStream; i: Integer; OutLine: string; sTemp: string;
        frmProgreso: TfrmProgreso;
begin
        if dlgSave.Execute then
                Stream := TFileStream.Create(dlgSave.FileName, fmCreate);
        CDSplano.Open;
        CDSplano.EmptyDataSet;
        CDSgrid.Filtered := False;
        CDSgrid.Filter := '(ID_PRODUCTO = 999 AND ID_GARANTIA = 1) OR (ID_PRODUCTO <> 999 AND ID_TIPO_RELACION = 1)';
        CDSgrid.Filtered := True;
        CDSgrid.IndexName := 'CDSgridIndex1';
        CDSgrid.First;
        while not CDSgrid.Eof do
        begin
           if (CDSgridVALOR.Value > 0) then
           begin
           CDSplano.Filtered := False;
           CDSplano.Filter := 'ID_PERSONA = ' + QuotedStr(CDSgridID_PERSONA.Value);
           CDSplano.Filtered := True;
           if (CDSplano.RecordCount > 0) then
           begin
               CDSplano.Edit;
               CDSplanoVALOR.Value := CDSplanoVALOR.Value + CDSgridValor.Value;
               CDSplano.Post;
           end
           else
           begin
               CDSplano.Insert;
               CDSplanoNIT.Value := '809506399';
               CDSplanoDV.Value := '5';
               CDSplanoTIPO.Value := 'A';
               CDSplanoID_PERSONA.Value := CDSgridID_PERSONA.Value;
               CDSplanoCONCEPTO.Value := 'FAYCEN';
               CDSplanoFECHA_INI.Value := DateToStr(EDfecha.Date); //TODO - evaluar de acuerdo al ingreso del asociado
               CDSplanoFECHA_FIN.Value := '';
               CDSplanoVALOR.Value := CDSgridVALOR.Value;
               CDSplanoTOTAL.Value := '';
               CDSplanoACUMULADO.Value := '';
               CDSplano.Post;
           end;
           end;
           CDSgrid.Next;
        end;

        CDSplano.Filtered := False;
        CDSplano.First;

        try
        while not CDSplano.Eof do
        begin
                OutLine := '';
                for i := 0 to CDSplano.FieldCount - 1 do
                begin
                    sTemp := CDSplano.Fields[i].AsString;
                    OutLine := OutLine + sTemp + ',';
                end; // Remove final unnecessary ','
                //SetLength(OutLine, Length(OutLine) - 1); // Write line to file
                Stream.Write(OutLine[1], Length(OutLine) * SizeOf(Char)); // Write line ending
                Stream.Write(sLineBreak, Length(sLineBreak));
                CDSplano.Next;
        end; // Saves the file end;
        finally
           Stream.Free;
        end;

end;

procedure TfrmCausacionCarterayOtros.btnLibranzaClick(Sender: TObject);
begin
        CDSreporte.Open;
        CDSreporte.EmptyDataSet;
        CDSgrid.Filtered := False;
        CDSgrid.Filter := '(ID_PRODUCTO = 999 AND ID_GARANTIA = 1) OR (ID_PRODUCTO <> 999 AND ID_TIPO_RELACION = 1)';
        CDSgrid.Filtered := True;
        CDSgrid.IndexName := 'CDSgridIndex1';
        CDSgrid.First;
        while not CDSgrid.Eof do
        begin
           if (CDSgridVALOR.Value > 0) then
           begin
           CDSreporte.Filtered := False;
           CDSreporte.Filter := 'ID_PERSONA = ' + QuotedStr(CDSgridID_PERSONA.Value);
           CDSreporte.Filtered := True;
           if (CDSreporte.RecordCount > 0) then
           begin
               CDSreporte.Edit;
               CDSreporteVALOR.Value := CDSreporteVALOR.Value + CDSgridVALOR.Value;
               CDSreporteSEGURO.Value := CDSreporteSEGURO.Value + CDSgridOTROS.Value;
               CDSreporte.Post;
           end
           else
           begin
               CDSreporte.Insert;
               CDSreporteID_PERSONA.Value := CDSgridID_PERSONA.Value;
               CDSreporteNOMBRE.Value := CDSgridNOMBRE.Value + ' ' + CDSgridPRIMER_APELLIDO.Value + ' ' + CDSgridSEGUNDO_APELLIDO.Value;
               CDSreporteVALOR.Value := CDSgridVALOR.Value;
               CDSreporteSEGURO.Value := CDSgridOTROS.Value;
               CDSreporte.Post;
           end;
           end;
           CDSgrid.Next;
        end;

        CDSreporte.Filtered := False;
        CDSreporte.First;
        frReport1.LoadFromFile('ReportesCon\CausacionCarteraYOtros.frf');
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := QuotedStr(Empresa);
        frReport1.Dictionary.Variables.Variable['ANYO'] := QuotedStr(IntToStr(YearOf(EdFecha.Date)));
        frReport1.Dictionary.Variables.Variable['MES'] := QuotedStr(IntToStr(MonthOf(EdFecha.Date)));
        if (frReport1.PrepareReport) then
         frReport1.ShowReport;
end;

procedure TfrmCausacionCarterayOtros.FormShow(Sender: TObject);
var
  Fecha: TDateTime;
begin
        EdFecha.Date := fFechaActual;
        if MonthOf(EdFecha.Date) <> 2 then
        begin
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),30,Fecha) then EdFecha.Date := Fecha;
        end
        else
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),DaysInAMonth(YearOf(EdFecha.Date),MonthOf(EdFecha.Date)),Fecha) then EdFecha.Date := Fecha;
        EdFechaNota.Date := EdFecha.Date;
end;

procedure TfrmCausacionCarterayOtros.btnCajaClick(Sender: TObject);
begin
        CDSreporte.Open;
        CDSreporte.EmptyDataSet;
        CDSgrid.Filtered := False;
        CDSgrid.Filter := '(ID_PRODUCTO = 999 AND ID_GARANTIA = 2) OR (ID_PRODUCTO <> 999 AND ID_TIPO_RELACION = 2)';
        CDSgrid.Filtered := True;
        CDSgrid.IndexName := 'CDSgridIndex1';
        CDSgrid.First;
        while not CDSgrid.Eof do
        begin
           if (CDSgridVALOR.Value > 0) then
           begin
           CDSreporte.Filtered := False;
           CDSreporte.Filter := 'ID_PERSONA = ' + QuotedStr(CDSgridID_PERSONA.Value);
           CDSreporte.Filtered := True;
           if (CDSreporte.RecordCount > 0) then
           begin
               CDSreporte.Edit;
               CDSreporteVALOR.Value := CDSreporteVALOR.Value + CDSgridVALOR.Value;
               CDSreporteSEGURO.Value := CDSreporteSEGURO.Value + CDSgridOTROS.Value;
               CDSreporte.Post;
           end
           else
           begin
               CDSreporte.Insert;
               CDSreporteID_PERSONA.Value := CDSgridID_PERSONA.Value;
               CDSreporteNOMBRE.Value := CDSgridNOMBRE.Value + ' ' + CDSgridPRIMER_APELLIDO.Value + ' ' + CDSgridSEGUNDO_APELLIDO.Value;
               CDSreporteVALOR.Value := CDSgridVALOR.Value;
               CDSreporteSEGURO.Value := CDSgridOTROS.Value;
               CDSreporte.Post;
           end;
           end;
           CDSgrid.Next;
        end;

        CDSreporte.Filtered := False;
        CDSreporte.First;
        //frReport1.LoadFromFile('ReportesCon\CausacionCarteraYOtros.frf');
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := QuotedStr(Empresa);
        frReport1.Dictionary.Variables.Variable['ANYO'] := QuotedStr(IntToStr(YearOf(EdFecha.Date)));
        frReport1.Dictionary.Variables.Variable['MES'] := QuotedStr(IntToStr(MonthOf(EdFecha.Date)));
        if (frReport1.PrepareReport) then
         frReport1.ShowReport;

end;

procedure TfrmCausacionCarterayOtros.btnComprobanteClick(Sender: TObject);
var
//Codigos Cartera
                CodigoCapital : String;
                CodigoInteres : String;
                CodigoSeguro  : String;
                CodigoCapitalCausacionNomina: String;
                CodigoCapitalCausacionCaja: String;
                CodigoInteresCausacion: String;

//Codigos Depositos
                CodigoDeposito: String;
                CodigoDepositoCausacion: String;
//Valores a Contabilizar
         CargoMesCapitalNomina:Currency;
         CargoMesCapitalCaja:Currency;
         CargoMesInteres:Currency;

         TotalLibranza:Currency;
         TotalCaja:Currency;
         TotalInteres: Currency;

         Valor: Currency;
         ConsecLibranza: Integer;
         ConsecCaja: Integer;
         ConsecInteresLibranza: Integer;
         ConsecInteresCaja: Integer;

         frmProgeso : TfrmProgreso;

         HoraHoy: TTime;
begin

        if (MessageDlg('Procesar Comprobante de Nomina?',mtConfirmation, [mbYes,MbNo],0) = mrYes) then
        begin
        // Causacion de Nomina por Libranza: ID_PRODUCTO = 999 AND ID_GARANTIA = 1) OR (ID_PRODUCTO <> 999 AND ID_TIPO_RELACION = 1


        if (IBQPersona.Transaction.InTransaction ) then
        begin
            IBQPersona.Transaction.Rollback;
        end;

        IBQPersona.Transaction.StartTransaction;        
        ConsecLibranza := ObtenerConsecutivo(IBSQLcomprobante, 14);
        ConsecCaja:= ObtenerConsecutivo(IBSQLcomprobante, 15);
        ConsecInteresLibranza := ObtenerConsecutivo(IBSQLcomprobante, 9);

        HoraHoy := fHoraActual;

        IBQpersona.Close;
        IBQpersona.SQL.Clear;
        IBQpersona.SQL.Add('select p.ID_IDENTIFICACION,p.ID_PERSONA,p.ID_TIPO_RELACION, p.NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO FROM "cap$maestrotitular" m ');
        IBQpersona.SQL.Add('inner join "gen$persona" p ON p.ID_IDENTIFICACION = m.ID_IDENTIFICACION and p.ID_PERSONA = m.ID_PERSONA');
        IBQpersona.SQL.Add('WHERE m.ID_TIPO_CAPTACION = 1 ORDER BY p.ID_PERSONA ASC');
        IBQpersona.Open;
        IBQpersona.Last;
        IBQpersona.First;

        // IBQcomprobante
        with IBQcomprobante do
        begin
         sql.Clear;
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');
        end;

        // IBQauxiliar
        with IBQauxiliar do
        begin
         SQL.Clear;
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
        end;


        // Contabilizar  Causacion


        // Codigos puc basico
        IBQcodigopucbasico.Close;
        IBQcodigopucbasico.SQL.Clear;
        IBQcodigopucbasico.SQL.Add('select * from "col$codigospucbasicos" WHERE ID_CODIGOPUCBASICO = :ID_CODIGOPUCBASICO');

        TotalLibranza := 0;
        TotalCaja := 0;
        TotalInteres := 0;

        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Min := 0;
        frmProgreso.Max := IBQpersona.RecordCount;
        frmProgreso.Ejecutar;

        while not IBQpersona.Eof do
        begin

             frmProgreso.Info.Caption := IBQpersona.FieldByName('ID_PERSONA').AsString + '-' + IBQpersona.FieldByName('NOMBRE').AsString + ' ' + IBQpersona.FieldByName('PRIMER_APELLIDO').AsString;
             frmProgreso.Position := IBQpersona.RecNo;
             IBQcartera.Close;

             IBQcartera.SQL.Clear;
             IBQcartera.SQL.Add('SELECT l.FECHA_CORTE, l.ID_COLOCACION,');
             IBQcartera.SQL.Add('l.CAPITAL, l.INTERES, l.DESCUENTO, c.ID_LINEA,');
             IBQcartera.SQL.Add('c.ID_CLASIFICACION, c.ID_GARANTIA, c.ID_CATEGORIA,');
             IBQcartera.SQL.Add('c.ID_IDENTIFICACION, c.ID_PERSONA ');
             IBQcartera.SQL.Add('FROM "col$colocacion" c INNER JOIN GEN$DESCUENTOCARTERA l ');
             IBQcartera.SQL.Add('ON c.ID_COLOCACION = l.ID_COLOCACION');
             IBQcartera.SQL.Add('WHERE c.ID_IDENTIFICACION = :ID_IDENTIFICACION and c.ID_PERSONA = :ID_PERSONA and l.FECHA_CORTE = :FECHA');
             // IBQcartera.SQL.Add('AND c.ID_GARANTIA = 1');
             IBQcartera.ParamByName('FECHA').AsDate := EDfecha.Date;
             IBQcartera.ParamByName('ID_IDENTIFICACION').AsInteger := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQcartera.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByname('ID_PERSONA').AsString;
             IBQcartera.Open;

             CargoMesCapitalNomina := 0;
             CargoMesCapitalCaja := 0;
             CargoMesInteres := 0;

             IBQcodigopucbasico.Close;
             IBQcodigopucbasico.ParamByName('ID_CODIGOPUCBASICO').AsInteger := 99;
             IBQcodigopucbasico.Open;
             CodigoCapitalCausacionNomina := IBQcodigopucbasico.FieldByName('CODIGO').AsString;

             IBQcodigopucbasico.Close;
             IBQcodigopucbasico.ParamByName('ID_CODIGOPUCBASICO').AsInteger := 98;
             IBQcodigopucbasico.Open;
             CodigoCapitalCausacionCaja := IBQcodigopucbasico.FieldByName('CODIGO').AsString;

             IBQcodigopucbasico.Close;
             IBQcodigopucbasico.ParamByName('ID_CODIGOPUCBASICO').AsInteger := 97;
             IBQcodigopucbasico.Open;
             CodigoSeguro := IBQcodigopucbasico.FieldByName('CODIGO').AsString;

             while not IBQcartera.Eof do
             begin
               IBQcodigo.Close;
               IBQcodigo.SQL.Clear;
               IBQcodigo.SQL.Add('SELECT * FROM "col$codigospuc" c WHERE ');
               IBQcodigo.SQL.Add('c.ID_CLASIFICACION = :ID_CLASIFICACION AND');
               IBQcodigo.SQL.Add('c.ID_GARANTIA = :ID_GARANTIA AND ');
               IBQcodigo.SQL.Add('c.ID_CATEGORIA = :ID_CATEGORIA AND');
               IBQcodigo.SQL.Add('c.ID_LINEA = :ID_LINEA');
               IBQcodigo.ParamByName('ID_CLASIFICACION').AsInteger := IBQcartera.FieldByName('ID_CLASIFICACION').AsInteger;
               IBQcodigo.ParamByName('ID_GARANTIA').AsInteger := IBQcartera.FieldByName('ID_GARANTIA').AsInteger;
               IBQcodigo.ParamByName('ID_CATEGORIA').AsString := IBQcartera.FieldByName('ID_CATEGORIA').AsString;
               IBQcodigo.ParamByName('ID_LINEA').AsInteger := IBQcartera.FieldByName('ID_LINEA').AsInteger;
               IBQcodigo.Open;
               CodigoCapital := IBQcodigo.FieldByName('COD_CAPITAL_CP').AsString;
               CodigoInteres := IBQcodigo.FieldByName('COD_CXC').AsString;
               CodigoInteresCausacion := IBQcodigo.FieldByName('COD_INT_MES').AsString;

               IBQauxiliar.Close;

               Valor := IBQcartera.FieldByName('CAPITAL').AsCurrency;
               if (Valor > 0) then
               begin
                if (IBQcartera.FieldByName('ID_GARANTIA').AsInteger = 1) then
                begin
                        CargoMesCapitalNomina := CargoMesCapitalNomina + Valor;
                        IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  14;
                        IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecLibranza;
                end
                else
                begin
                        CargoMesCapitalCaja := CargoMesCapitalCaja + Valor;
                        IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  15;
                        IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecCaja;
                end;
               end;
               IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
               IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCapital;
               IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
               IBQauxiliar.ParamByName('CREDITO').AsCurrency := Valor;
               IBQauxiliar.ParamByName('ID_CUENTA').Clear;
               IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
               IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
               IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
               IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
               IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
               IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
               IBQauxiliar.ExecSQL;



               // Contabilizo Seguro

               Valor := IBQcartera.FieldByName('DESCUENTO').AsCurrency;
               if (Valor > 0) then
               begin
                if (IBQcartera.FieldByName('ID_GARANTIA').AsInteger = 1) then
                begin
                       CargoMesCapitalNomina := CargoMesCapitalNomina + Valor;
                       IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  14;
                       IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecLibranza;
                end
                else
                begin
                       CargoMesCapitalCaja := CargoMesCapitalCaja + Valor;
                       IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  15;
                       IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecCaja;
                end;

                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoSeguro;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;


               end;    // Contabiliza Seguro



               // Contabilizo Interes Causado  Comprobante Aparte

               Valor := IBQcartera.FieldByName('INTERES').AsCurrency;
               if (Valor > 0) then
               begin
                IBQauxiliar.Close;
                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  9;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecInteresLibranza;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoInteres;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;

                IBQauxiliar.Close;
                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  9;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecInteresLibranza;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoInteresCausacion;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;

                // Contabilizo Contra CargoMes
                IBQauxiliar.Close;
                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  9;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecInteresLibranza;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoInteres;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;

                IBQauxiliar.Close;
                if (IBQcartera.FieldByName('ID_GARANTIA').AsInteger = 1) then
                begin
                        IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCapitalCausacionNomina;
                end
                else
                begin
                        IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCapitalCausacionCaja;
                end;

                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  9;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecInteresLibranza;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').AsString := IBQcartera.FieldByName('ID_COLOCACION').AsString;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQcartera.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQcartera.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;                //

                IBQcargomes.Close;
                IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger :=  IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQcargomes.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
                IBQcargomes.ParamByName('FECHA').AsDate :=  EdFechaNota.Date;
                IBQcargomes.ParamByName('HORA').AsTime := HoraHoy;
                IBQcargomes.ParamByName('DEBITO').AsCurrency := Valor;
                IBQcargomes.ParamByName('CREDITO').AsCurrency := 0;
                IBQcargomes.ParamByName('TIPO_COMPROBANTE').AsInteger := 9;
                IBQcargomes.ParamByName('COMPROBANTE').AsInteger := ConsecInteresLibranza;
                IBQcargomes.ExecSQL;

                TotalInteres := TotalInteres + Valor;


               //
               end;

               IBQcartera.Next;
             end;  // while IBQcartera

             IBQdeposito.Close;
             IBQdeposito.SQL.Clear;
             IBQdeposito.SQL.Add('SELECT l.FECHA_CORTE, l.ID_TIPO_CAPTACION, l.NUMERO_CUENTA,l.VALOR, m.ID_IDENTIFICACION, m.ID_PERSONA');
             IBQdeposito.SQL.Add('FROM "cap$maestrotitular" m INNER JOIN GEN$DESCUENTODEPOSITO l ');
             IBQdeposito.SQL.Add('ON m.ID_TIPO_CAPTACION = l.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = l.NUMERO_CUENTA');
             IBQdeposito.SQL.Add('WHERE m.ID_IDENTIFICACION = :ID_IDENTIFICACION and m.ID_PERSONA = :ID_PERSONA and l.FECHA_CORTE = :FECHA');
             IBQdeposito.ParamByName('FECHA').AsDate := EDfecha.Date;
             IBQdeposito.ParamByName('ID_IDENTIFICACION').AsInteger := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQdeposito.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByname('ID_PERSONA').AsString;
             IBQdeposito.Open;

             while not IBQdeposito.Eof do
             begin
                IBQcodigo.Close;
                IBQcodigo.SQL.Clear;
                IBQcodigo.SQL.Add('SELECT * FROM "cap$tipocaptacion" WHERE ID_TIPO_CAPTACION =:ID_TIPO_CAPTACION');
                IBQcodigo.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQdeposito.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBQcodigo.Open;

                CodigoDeposito := IBQcodigo.FieldByName('CODIGO_CONTABLE').AsString;

                Valor := IBQdeposito.FieldByName('VALOR').AsCurrency;
                if (Valor > 0) then
                begin
                 if (IBQpersona.FieldByName('ID_TIPO_RELACION').AsInteger = 1)
                 then
                 begin
                       CargoMesCapitalNomina := CargoMesCapitalNomina + Valor;
                       IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  14;
                       IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecLibranza;
                 end
                 else
                 begin
                       CargoMesCapitalCaja := CargoMesCapitalCaja + Valor;
                       IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  15;
                       IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecCaja;
                 end;

                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoDeposito;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := Valor;
                IBQauxiliar.ParamByName('ID_CUENTA').AsInteger := IBQdeposito.FieldByName('NUMERO_CUENTA').AsInteger;
                IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQdeposito.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQdeposito.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;
               end;

               IBQdeposito.Next;

             end;  // While IBQdeposito

             if (CargoMesCapitalNomina > 0) then
             begin
                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  14;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecLibranza;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCapitalCausacionNomina;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := CargoMesCapitalNomina;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQdeposito.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQdeposito.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;

                IBQcargomes.Close;
                IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger :=  IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQcargomes.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
                IBQcargomes.ParamByName('FECHA').AsDate :=  EdFechaNota.Date;
                IBQcargomes.ParamByName('HORA').AsTime := HoraHoy;
                IBQcargomes.ParamByName('DEBITO').AsCurrency := CargoMesCapitalNomina;
                IBQcargomes.ParamByName('CREDITO').AsCurrency := 0;
                IBQcargomes.ParamByName('TIPO_COMPROBANTE').AsInteger := 14;
                IBQcargomes.ParamByName('COMPROBANTE').AsInteger := ConsecLibranza;
                IBQcargomes.ExecSQL;

                TotalLibranza := TotalLibranza + CargoMesCapitalNomina;
             end;

             if (CargoMesCapitalCaja > 0) then
             begin
                IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsInteger :=  15;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := ConsecCaja;
                IBQauxiliar.ParamByName('ID_AGENCIA').AsInteger:= Agencia;
                IBQauxiliar.ParamByName('FECHA').AsDate := EdFechaNota.Date;
                IBQauxiliar.ParamByName('CODIGO').AsString := CodigoCapitalCausacionCaja;
                IBQauxiliar.ParamByName('DEBITO').AsCurrency := CargoMesCapitalCaja;
                IBQauxiliar.ParamByName('CREDITO').AsCurrency := 0;
                IBQauxiliar.ParamByName('ID_CUENTA').Clear;
                IBQauxiliar.ParamByName('ID_COLOCACION').Clear;
                IBQauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQdeposito.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQauxiliar.ParamByName('ID_PERSONA').AsString := IBQdeposito.FieldByName('ID_PERSONA').AsString;
                IBQauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                IBQauxiliar.ParamByName('TASA_RETENCION').Clear;
                IBQauxiliar.ParamByName('ESTADOAUX').AsString := 'O';
                IBQauxiliar.ExecSQL;

                IBQcargomes.Close;
                IBQcargomes.ParamByName('ID_IDENTIFICACION').AsInteger :=  IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
                IBQcargomes.ParamByName('ID_PERSONA').AsString := IBQpersona.FieldByName('ID_PERSONA').AsString;
                IBQcargomes.ParamByName('FECHA').AsDate :=  EdFechaNota.Date;
                IBQcargomes.ParamByName('HORA').AsTime := HoraHoy;
                IBQcargomes.ParamByName('DEBITO').AsCurrency := CargoMesCapitalCaja;
                IBQcargomes.ParamByName('CREDITO').AsCurrency := 0;
                IBQcargomes.ParamByName('TIPO_COMPROBANTE').AsInteger := 15;
                IBQcargomes.ParamByName('COMPROBANTE').AsInteger := ConsecCaja;
                IBQcargomes.ExecSQL;

                TotalCaja := TotalCaja + CargoMesCapitalCaja;

             end;

             Application.ProcessMessages;
             IBQpersona.Next;
        end;

        frmProgreso.Cerrar;

        // creo encabezado de comprobantes

        if (TotalLibranza > 0) then
        begin
         IBQcomprobante.Close;
         IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger:= ConsecLibranza;
         IBQcomprobante.ParamByname('FECHADIA').AsDate := edFechaNota.Date;
         IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := Agencia;
         IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsInteger := 14;
         IBQcomprobante.ParamByName('DESCRIPCION').AsBlob := 'CAUSACION DE NOMINA DEL PERIODO';
         IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency  := TotalLibranza;
         IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency  := TotalLibranza;
         IBQcomprobante.ParamByName('ESTADO').AsString  := 'O';
         IBQcomprobante.ParamByname('ANULACION').asstring := '';
         IBQcomprobante.ParamByName('IMPRESO').AsInteger  := Ord(false);
         IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
         IBQcomprobante.ExecSQL;
        end;

        if (TotalCaja > 0) then
        begin
         IBQcomprobante.Close;
         IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger:= ConsecCaja;
         IBQcomprobante.ParamByname('FECHADIA').AsDate := edFechaNota.Date;
         IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := Agencia;
         IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsInteger := 15;
         IBQcomprobante.ParamByName('DESCRIPCION').AsBlob := 'CAUSACION DE CAJA DEL PERIODO';
         IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency  := TotalCaja;
         IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCaja;
         IBQcomprobante.ParamByName('ESTADO').AsString  := 'O';
         IBQcomprobante.ParamByname('ANULACION').asstring := '';
         IBQcomprobante.ParamByName('IMPRESO').AsInteger  := Ord(false);
         IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
         IBQcomprobante.ExecSQL;
        end;

        if (TotalInteres > 0) then
        begin
         IBQcomprobante.Close;
         IBQcomprobante.ParamByName('ID_COMPROBANTE').AsInteger:= ConsecInteresLibranza;
         IBQcomprobante.ParamByname('FECHADIA').AsDate := edFechaNota.Date;
         IBQcomprobante.ParamByName('ID_AGENCIA').AsInteger := Agencia;
         IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsInteger := 9;
         IBQcomprobante.ParamByName('DESCRIPCION').AsBlob := 'CAUSACION DE INTERESES DE CARTERA DEL PERIODO';
         IBQcomprobante.ParamByName('TOTAL_DEBITO').AsCurrency  := TotalInteres;
         IBQcomprobante.ParamByName('TOTAL_CREDITO').AsCurrency  := TotalInteres;
         IBQcomprobante.ParamByName('ESTADO').AsString  := 'O';
         IBQcomprobante.ParamByname('ANULACION').asstring := '';
         IBQcomprobante.ParamByName('IMPRESO').AsInteger  := Ord(false);
         IBQcomprobante.ParamByName('ID_EMPLEADO').AsString := DBAlias;
         IBQcomprobante.ExecSQL;
        end;

        IBQpersona.Transaction.Commit;
        btnComprobante.Enabled := False;

        ShowMessage('Proceso Finalizado');
        end;

end;

end.
