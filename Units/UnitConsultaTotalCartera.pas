unit UnitConsultaTotalCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, ComCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, DateUtils;

type
  TfrmSaldoCarteraAlCorte = class(TForm)
    Label1: TLabel;
    EdCartera: TJvCurrencyEdit;
    Label2: TLabel;
    Label5: TLabel;
    EdCapital: TJvCurrencyEdit;
    Label6: TLabel;
    EdInteres: TJvCurrencyEdit;
    Label7: TLabel;
    EdNuevoSaldo: TJvCurrencyEdit;
    EdFecha: TDateTimePicker;
    btnProcesar: TBitBtn;
    IBQcartera: TIBQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldoCarteraAlCorte: TfrmSaldoCarteraAlCorte;

implementation

{$R *.dfm}

procedure TfrmSaldoCarteraAlCorte.FormShow(Sender: TObject);
var
  Fecha: TDateTime;
begin
        if MonthOf(EdFecha.Date) <> 2 then
        begin
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),30,Fecha) then EdFecha.Date := Fecha;
        end
        else
            if TryEncodeDate(YearOf(EdFecha.Date),MonthOf(EdFecha.Date),DaysInAMonth(YearOf(EdFecha.Date),MonthOf(EdFecha.Date)),Fecha) then EdFecha.Date := Fecha;

end;

end.
