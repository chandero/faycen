program GeneraPlanos;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  Consts in '..\..\Modulo Fogacoop\unit\Consts.pas',
  UnitPantallaProgreso in '..\..\Modulo Fogacoop\unit\UnitPantallaProgreso.pas' {frmProgreso},
  UnitVistaPreliminar in '..\..\Modulo Fogacoop\unit\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitdmGeneral in '..\..\Modulo Fogacoop\unit\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobales in '..\..\..\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '..\..\..\Globales\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitGlobalesCol in '..\..\..\Globales\UnitGlobalesCol.pas',
  UnitdmColocacion in '..\..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitBuscarTexto in '..\..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitImpresion in '\\Winserver\Repositorio\Sistemas\units\UnitImpresion.pas' {FrmImpresion},
  UnitReportePersonasFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitReportePersonasFogacoop.pas' {frmReportePersonasFogacoop},
  UnitCancelacionCdats in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitCancelacionCdats.pas' {frmCancelacionCdats},
  UnitReporteAportesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitReporteAportesFogacoop.pas' {frmReporteAportesFogacoop},
  UnitReporteCaptacionesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitReporteCaptacionesFogacoop.pas' {frmReporteCaptacionesFogacoop},
  UnitReporteCdatFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitReporteCdatFogacoop.pas' {frmReporteCdatFogacoop},
  UnitReporteColocacionesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitReporteColocacionesFogacoop.pas' {frmReporteColocacionesFogacoop},
  UnitCarteraFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitCarteraFogacoop.pas' {frmCarteraFogacoop};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
