unit UnitDmSolicitud;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBSQL, UnitDmGeneral;

type
  TDmSolicitud = class(TDataModule)
    IBSolicitud1: TIBQuery;
    IBsolicitud2: TIBQuery;
    IBsolicitud3: TIBQuery;
    IBTsolicitud1: TIBTransaction;
    IBTsolicitud2: TIBTransaction;
    IBTsolicitud3: TIBTransaction;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBSQL2: TIBSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSolicitud: TDmSolicitud;
  dmGeneral : TdmGeneral;

implementation
{$R *.dfm}

procedure TDmSolicitud.DataModuleCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBSolicitud1.Database := dmGeneral.IBDatabase1;
        IBsolicitud2.Database := dmGeneral.IBDatabase1;
        IBsolicitud3.Database := dmGeneral.IBDatabase1;
        IBTsolicitud1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTsolicitud2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTsolicitud3.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
end;

end.
