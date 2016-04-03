program Creditos;

uses
  Forms,
  Consts in '..\..\units\Consts.pas',
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitCalculoTasas in '..\..\units\UnitCalculoTasas.pas' {frmCalculoTasas},
  UnitConsultaGarantias in '..\..\units\UnitConsultaGarantias.pas' {frmConsultaGarantias},
  UnitdmPersona in '..\..\units\UnitdmPersona.pas' {dmPersona: TDataModule},
  UnitGarantiaPersonal in '..\..\units\UnitGarantiaPersonal.pas' {frmGarantiaPersonal},
  UnitGarantiaReal in '..\..\units\UnitGarantiaReal.pas' {frmGarantiaReal},
  UnitInformeDiarioDesembolsos in '..\..\units\UnitInformeDiarioDesembolsos.pas' {frmInformeDiarioDesembolsos},
  UnitInformeGralColocaciones in '..\..\units\UnitInformeGralColocaciones.pas' {frmInformeGralColocaciones},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitRecuperarTablaLiq in '..\..\units\UnitRecuperarTablaLiq.pas' {frmRecuperarTablaLiq},
  UnitTablaLiquidacion in '..\..\units\UnitTablaLiquidacion.pas' {frmTablaLiquidacion},
  UnitTablaPagoColocacion in '..\..\units\UnitTablaPagoColocacion.pas' {frmTablaPagoColocacion},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitDireccionesAsociados in '..\..\units\UnitDireccionesAsociados.pas' {frmDireccionesAsociado},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  Unit_DmComprobante in '..\..\Globales\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitControlCobroCartera in '..\..\units\UnitControlCobroCartera.pas' {frmControlCobroCartera},
  UnitAgregarObservacionSol in '..\..\units\UnitAgregarObservacionSol.pas' {frmAgregarObservacionSol},
  UnitConsultaLiquidacion in '..\..\units\UnitConsultaLiquidacion.pas' {frmConsultaLiquidacion},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  Unit_Comprobante in '..\..\units\Unit_Comprobante.pas' {frmComprobante},
  UnitCalendario in '..\..\units\UnitCalendario.pas' {frmCalendario},
  Unit_RecInformeColocacion in '..\..\units\Unit_RecInformeColocacion.pas' {frmRecuperarInformeColocacion},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  unitMain in 'Unit\unitMain.pas' {frmMain},
  digitacuenta in '..\..\units\digitacuenta.pas' {digita},
  Unit_Dmpuc in '..\..\units\Unit_Dmpuc.pas' {Dmpuc: TDataModule},
  Unit_BuscarCodigo in '..\..\units\Unit_BuscarCodigo.pas' {frmBuscarCodigo},
  Unit_BuscarClave in '..\..\units\Unit_BuscarClave.pas' {frmBuscarClave},
  Unit_buscarcomprobante in '..\..\units\Unit_buscarcomprobante.pas' {frmbuscarcomprobante},
  UnitConsultaColocacion in '..\..\units\UnitConsultaColocacion.pas' {frmConsultaColocacion},
  unitCausacionCdat in '..\..\units\unitCausacionCdat.pas' {frmcausacioncdat},
  Unit_Mantenimientopuc in '..\..\units\Unit_Mantenimientopuc.pas' {frmMantenimientopuc},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitLiquidaciondePrueba in '..\..\units\UnitLiquidaciondePrueba.pas' {frmLiquidaciondePrueba},
  UnitBuscarControlCobro in '..\..\units\UnitBuscarControlCobro.pas' {frmBusquedaControlCobro},
  UnitBuscarColocacion in '..\..\units\UnitBuscarColocacion.pas' {frmBusquedadeColocacion},
  UnitBuscarEscritura in '..\..\units\UnitBuscarEscritura.pas' {frmBusquedadeEscritura},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitInformeColocacionFiltrado in '..\..\units\Copia 120404\UnitInformeColocacionFiltrado.pas' {frmInformeColocacionesFiltrado},
  UnitImpresionCaptacion in '..\..\units\UnitImpresionCaptacion.pas' {frmImpresionCaptacion},
  UnitdmCaptacion in '..\..\units\UnitdmCaptacion.pas' {dmCaptacion: TDataModule},
  FR_View in '..\..\..\..\Archivos de programa\FastReports\FastReport\source\FR_View.pas' {frPreviewForm},
  UnitTomarFoto in '..\..\units\UnitTomarFoto.pas' {frmTomarFoto},
  UnitTomaHuella in '..\..\units\UnitTomaHuella.pas' {frmRegister},
  UnitVerificarHuella in '..\..\units\UnitVerificarHuella.pas' {frmVerify},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitNuevaColocacion in '..\..\units\UnitNuevaColocacion.pas' {frmNuevaColocacion},
  FR_ChBox in '..\..\..\..\Archivos de programa\FastReports\FastReport\source\FR_ChBox.pas',
  UnitVisarColocacion in 'Unit\UnitVisarColocacion.pas' {frmVisarColocacion},
  UnitDesembolsoTmp in 'Temporal\UnitDesembolsoTmp.pas' {FrmDesembolsoTmp},
  UnitRecuperadesembolso in '..\..\units\UnitRecuperadesembolso.pas' {FrmRecuperarInforme},
  UnitAdicion in '..\..\units\UnitAdicion.pas' {FrmAdicion},
  UnitRangosColocacion in '..\..\units\UnitRangosColocacion.pas' {FrmRangosColocacion},
  UnitDmSolicitud in '..\..\units\UnitDmSolicitud.pas' {DmSolicitud: TDataModule},
  UnitBuscaSolicitud in '..\..\units\UnitBuscaSolicitud.pas' {FrmBuscaSolicitud},
  UnitConsultaSol in '..\..\units\UnitConsultaSol.pas' {FrmConsultaSol},
  UnitDescObservacion in '..\..\units\UnitDescObservacion.pas' {FrmDescObsrevacion},
  UnitEstadoSolicitud in '..\..\units\UnitEstadoSolicitud.pas' {FrmEstadoSolicitud},
  UnitImpresion in '..\..\units\UnitImpresion.pas' {FrmImpresion},
  UnitInformacion in '..\..\units\UnitInformacion.pas' {FrmInformacion},
  UnitRequisitoNuevo in '..\..\units\UnitRequisitoNuevo.pas' {FrmRequisitoNuevo},
  UnitRequisitos in '..\..\units\UnitRequisitos.pas' {FrmRequisitos},
  UnitRequisitoscre in '..\..\units\UnitRequisitoscre.pas' {FrmRequisitoscre},
  UnitActualizaSol in '..\..\units\UnitActualizaSol.pas' {FrmActualizaSol},
  UnitRiesgos in '..\..\units\UnitRiesgos.pas' {FrmRiesgos},
  UnitVisarDesembolsoPrueba in 'Unit\UnitVisarDesembolsoPrueba.pas' {frmVisarDesembolsoPrueba},
  UnitAnalisiscre in '..\..\units\UnitAnalisiscre.pas' {FrmAnalisiscre},
  UnitDesreferencias in '..\..\units\UnitDesreferencias.pas' {FrmReferencias},
  UnitComCreditos in '..\..\units\UnitComCreditos.pas' {FrmComCreditos},
  FR_Cross in '..\..\..\..\Archivos de programa\FastReports\FastReport\source\fr_cross.pas' {frCrossForm},
  UnitBarridoSolicitudes in '..\..\units\UnitBarridoSolicitudes.pas' {FrmBarridoSolicitudes},
  Videocap in '..\..\units\Videocap.pas',
  VFW in '..\..\units\VfW.pas',
  UnitSolicitudCre in '..\..\units\UnitSolicitudCre.pas' {FrmSolicitudCre},
  UnitLiquidacionGral in '..\..\units\UnitLiquidacionGral.pas' {frmLiquidacionGral},
  UnitFormatoPagare in '..\..\units\UnitFormatoPagare.pas' {frmFormatoPagare},
  UnitTipoImpresion in '..\..\units\UnitTipoImpresion.pas' {frmTipoImpresion},
  UnitRelacionChequesEnCanje in '..\..\units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitPagarePrueba in 'Unit\UnitPagarePrueba.pas' {frmPagarePrueba},
  UnitPagare in '..\..\units\UnitPagare.pas' {frmPagare},
  UnitRegistroPoder in '..\..\units\UnitRegistroPoder.pas' {FrmRegistroPoder},
  UnitRegistroPersoneria in '..\..\units\UnitRegistroPersoneria.pas' {FrmRegistroPersoneria},
  UnitActualizaReal in '..\..\units\UnitActualizaReal.pas' {frmActualizaReal},
  UnitMantenimientoGarReal in '..\..\units\UnitMantenimientoGarReal.pas' {frmMantenimientoGarReal},
  UnitIncluirGarReal in '..\..\units\UnitIncluirGarReal.pas' {frmIncluirGarReal},
  UnitAgregaGarantia in '..\..\units\UnitAgregaGarantia.pas' {FrmAgregaGarantia},
  UnitVisarDesembolsoTmp in 'Temporal\UnitVisarDesembolsoTmp.pas' {frmVisarDesembolsoTmp},
  UnitBarridoCredivida in '..\..\units\UnitBarridoCredivida.pas' {FrmBarridoCredivida},
  UnitCdatSoliicutd in '..\..\units\UnitCdatSoliicutd.pas' {FrmCdatSolicitud},
  UnitNotificacionSolicitud in '..\..\units\UnitNotificacionSolicitud.pas' {FrmNotificacionSolicitud},
  UnitReporteGarReal in '..\..\units\UnitReporteGarReal.pas' {frmReporteGarReal},
  scExcelExport in '..\..\units\scExcelExport.pas',
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitInformeCarteraPrivilegiados in '..\..\units\UnitInformeCarteraPrivilegiados.pas' {frmInformeCarteraPrivilegiados},
  UnitExtractoCredito in '..\..\units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitVida in '..\..\units\UnitVida.pas' {FrmVida},
  UnitRegistroSolicitudes in '..\..\units\UnitRegistroSolicitudes.pas' {FrmRegistroSolicitud},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitObservacionCreditos in '..\..\units\UnitObservacionCreditos.pas' {FrmObservacionCreditos},
  UnitPlanoCredivida in '..\..\units\UnitPlanoCredivida.pas' {FrmPlanoCredivida},
  DataSetToExcel in '..\..\units\DataSetToExcel.pas',
  UnitSolicituRemota in '..\..\units\UnitSolicituRemota.pas' {FrmSolicitudRemota},
  UnitCambios in '..\..\units\UnitCambios.pas' {FrmCambios},
  UnitControlSolicitud in '..\..\units\UnitControlSolicitud.pas' {frmControlSolicitud},
  UnitReporteEndoso in '..\..\units\UnitReporteEndoso.pas' {FrmReporteEndoso},
  UnitEndosoPagare in '..\..\units\UnitEndosoPagare.pas' {FrmEndosoPagare},
  UnitDescargaPagare in '..\..\units\UnitDescargaPagare.pas' {FrmDescargaPagare},
  UnitExencionGMF in '..\..\units\UnitExencionGMF.pas' {frmExencionGMF},
  UnitInformeCreditosCanceladosReales in '..\..\units\UnitInformeCreditosCanceladosReales.pas' {frmInformeCreditosCanceladosReales},
  UnitBuscarCiiu in '..\..\units\UnitBuscarCiiu.pas' {frmBuscarCIIU},
  UnitInformeCreditosBancoldex in '..\..\units\UnitInformeCreditosBancoldex.pas' {frmInformeCreditosBancoldex},
  UnitInformeSolicitudesBancoldex in '..\..\units\UnitInformeSolicitudesBancoldex.pas' {frmInformeSolicitudesBancoldex},
  UnitAgregarCreditosBancoldex in '..\..\units\UnitAgregarCreditosBancoldex.pas' {frmAgregarCreditosBancoldex},
  UnitCreacionPersonaIndependiente in '..\..\units\UnitCreacionPersonaIndependiente.pas' {frmCreacionPersonaIndependiente},
  UnitDesembolso in '..\..\units\UnitDesembolso.pas' {FrmDesembolso},
  UnitVisarDesembolso in '..\..\units\UnitVisarDesembolso.pas' {frmVisarDesembolso},
  UnitPlanillaConsolidada in '..\..\units\UnitPlanillaConsolidada.pas' {FrmPlanillaConsolidada},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitCreaciondePersona in '..\..\Units\UnitCreaciondePersona.pas' {frmCreacionPersona},
  UnitGeneraCartas in '..\..\Units\UnitGeneraCartas.pas' {FrmGeneraCarta},
  UnitAgregarObservacion in '..\..\Units\UnitAgregarObservacion.pas' {frmAgregarObservacionCobro},
  UnitInformacionBancoldex in '..\..\Units\UnitInformacionBancoldex.pas' {frmInformacionBancoldex};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Creditos';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
