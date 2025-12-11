import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/formulario_cifras_widget.dart';
import '/components/formulario_habitante_widget.dart';
import '/components/formulario_proceso_widget.dart';
import '/components/formulario_reporte_principal_widget.dart';
import '/components/formulario_tendencias_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/serialization_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reporte_formulario_model.dart';
export 'reporte_formulario_model.dart';

class ReporteFormularioWidget extends StatefulWidget {
  const ReporteFormularioWidget({
    super.key,
    String? reporteId,
  }) : reporteId = reporteId ?? '';

  final String reporteId;

  static String routeName = 'ReporteFormulario';
  static String routePath = '/reporteFormulario';

  @override
  State<ReporteFormularioWidget> createState() =>
      _ReporteFormularioWidgetState();
}

class _ReporteFormularioWidgetState extends State<ReporteFormularioWidget> {
  late ReporteFormularioModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReporteFormularioModel());

    // Cargar el reporte desde Firestore usando reporteId si está presente
    if (widget.reporteId.isNotEmpty) {
      _model.loadReporte(widget.reporteId);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0F092C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F092C),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Registrar Reporte',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0F092C),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 24.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        wrapWithModel(
                          model: _model.formularioReportePrincipalModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const FormularioReportePrincipalWidget(),
                        ),
                        wrapWithModel(
                          model: _model.formularioHabitanteModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const FormularioHabitanteWidget(),
                        ),
                        wrapWithModel(
                          model: _model.formularioProcesoModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const FormularioProcesoWidget(),
                        ),
                        wrapWithModel(
                          model: _model.formularioCifrasModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const FormularioCifrasWidget(),
                        ),
                        wrapWithModel(
                          model: _model.formularioTendenciasModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const FormularioTendenciasWidget(),
                        ),
                      ].divide(const SizedBox(height: 30.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 24.0, 16.0, 32.0),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 800.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _model.isSaving
                              ? null
                              : () async {
                                  try {
                                    safeSetState(() {
                                      _model.isSaving = true;
                                    });

                                    // PASO 0: Subir todos los archivos al Storage primero

                                    // 1.1. Subir imagen de portada del reporte principal
                                    if (_model
                                                .formularioReportePrincipalModel
                                                .uploadedLocalFile_imagenesReportePortada
                                                .bytes !=
                                            null &&
                                        _model
                                            .formularioReportePrincipalModel
                                            .uploadedLocalFile_imagenesReportePortada
                                            .bytes!
                                            .isNotEmpty) {
                                      final file = _model
                                          .formularioReportePrincipalModel
                                          .uploadedLocalFile_imagenesReportePortada;
                                      final storagePath =
                                          'imagenesReportePortada/${DateTime.now().millisecondsSinceEpoch}_${file.name}';
                                      final url = await uploadData(
                                          storagePath, file.bytes!);
                                      if (url != null) {
                                        _model.formularioReportePrincipalModel
                                                .uploadedFileUrl_imagenesReportePortada =
                                            url;
                                      }
                                    }

                                    // 1.2. Subir PDF del reporte principal
                                    if (_model
                                                .formularioReportePrincipalModel
                                                .uploadedLocalFile_reportesReportePDF
                                                .bytes !=
                                            null &&
                                        _model
                                            .formularioReportePrincipalModel
                                            .uploadedLocalFile_reportesReportePDF
                                            .bytes!
                                            .isNotEmpty) {
                                      final file = _model
                                          .formularioReportePrincipalModel
                                          .uploadedLocalFile_reportesReportePDF;
                                      final storagePath =
                                          'reportesReportePDF/${DateTime.now().millisecondsSinceEpoch}_${file.originalFilename}';
                                      final url = await uploadData(
                                          storagePath, file.bytes!);
                                      if (url != null) {
                                        _model.formularioReportePrincipalModel
                                                .uploadedFileUrl_reportesReportePDF =
                                            url;
                                      }
                                    }

                                    // 2.1. Subir imagen de habitante
                                    if (_model
                                                .formularioHabitanteModel
                                                .uploadedLocalFile_imagenesHabitantePortada
                                                .bytes !=
                                            null &&
                                        _model
                                            .formularioHabitanteModel
                                            .uploadedLocalFile_imagenesHabitantePortada
                                            .bytes!
                                            .isNotEmpty) {
                                      final file = _model
                                          .formularioHabitanteModel
                                          .uploadedLocalFile_imagenesHabitantePortada;
                                      final storagePath =
                                          'imagenesHabitantePortada/${DateTime.now().millisecondsSinceEpoch}_${file.name}';
                                      final url = await uploadData(
                                          storagePath, file.bytes!);
                                      if (url != null) {
                                        _model.formularioHabitanteModel
                                                .uploadedFileUrl_imagenesHabitantePortada =
                                            url;
                                      }
                                    }

                                    // 2.2. Subir audio de habitante
                                    if (_model
                                                .formularioHabitanteModel
                                                .uploadedLocalFile_audiosAudioHabitante
                                                .bytes !=
                                            null &&
                                        _model
                                            .formularioHabitanteModel
                                            .uploadedLocalFile_audiosAudioHabitante
                                            .bytes!
                                            .isNotEmpty) {
                                      final file = _model
                                          .formularioHabitanteModel
                                          .uploadedLocalFile_audiosAudioHabitante;
                                      final storagePath =
                                          'audiosAudioHabitante/${DateTime.now().millisecondsSinceEpoch}_${file.originalFilename}';
                                      final url = await uploadData(
                                          storagePath, file.bytes!);
                                      if (url != null) {
                                        _model.formularioHabitanteModel
                                                .uploadedFileUrl_audiosAudioHabitante =
                                            url;
                                      }
                                    }

                                    // 3. Subir imágenes de procesos
                                    for (var i = 0;
                                        i <
                                            _model.formularioProcesoModel
                                                .procesosForms.length;
                                        i++) {
                                      final procesoForm = _model
                                          .formularioProcesoModel
                                          .procesosForms[i];
                                      if (procesoForm.uploadedImage?.bytes !=
                                              null &&
                                          procesoForm.uploadedImage!.bytes!
                                              .isNotEmpty) {
                                        final file = procesoForm.uploadedImage!;
                                        final storagePath =
                                            'imagenesProcesoImagenes/${DateTime.now().millisecondsSinceEpoch}_${i}_${file.name}';
                                        final url = await uploadData(
                                            storagePath, file.bytes!);
                                        if (url != null) {
                                          _model.formularioProcesoModel
                                              .updateProcesoForm(
                                            i,
                                            (form) => ProcesoFormData(
                                              periodo: form.periodo,
                                              tituloController:
                                                  form.tituloController,
                                              tituloFocusNode:
                                                  form.tituloFocusNode,
                                              subtituloController:
                                                  form.subtituloController,
                                              subtituloFocusNode:
                                                  form.subtituloFocusNode,
                                              colorSubtituloController:
                                                  form.colorSubtituloController,
                                              colorSubtituloFocusNode:
                                                  form.colorSubtituloFocusNode,
                                              selectedColor: form.selectedColor,
                                              descripcionController:
                                                  form.descripcionController,
                                              descripcionFocusNode:
                                                  form.descripcionFocusNode,
                                              citaController:
                                                  form.citaController,
                                              citaFocusNode: form.citaFocusNode,
                                              dineroTextController:
                                                  form.dineroTextController,
                                              dineroTextFocusNode:
                                                  form.dineroTextFocusNode,
                                              agua: form.agua,
                                              urbanizacion: form.urbanizacion,
                                              dinero: form.dinero,
                                              uploadedImage: form.uploadedImage,
                                              imageUrl: url,
                                              isUploadingImage: false,
                                            ),
                                          );
                                        }
                                      }
                                    }

                                    // 4. Subir imágenes de portada y señales de tendencias
                                    for (var t = 0;
                                        t <
                                            _model.formularioTendenciasModel
                                                .tendenciasForms.length;
                                        t++) {
                                      final tendenciaForm = _model
                                          .formularioTendenciasModel
                                          .tendenciasForms[t];

                                      // 4.1. Subir imagen de portada
                                      if (tendenciaForm.uploadedImagenPortada
                                                  ?.bytes !=
                                              null &&
                                          tendenciaForm.uploadedImagenPortada!
                                              .bytes!.isNotEmpty) {
                                        final file = tendenciaForm
                                            .uploadedImagenPortada!;
                                        final storagePath =
                                            'imagenesTendenciasPortada/${DateTime.now().millisecondsSinceEpoch}_${t}_${file.name}';
                                        final url = await uploadData(
                                            storagePath, file.bytes!);
                                        if (url != null) {
                                          _model.formularioTendenciasModel
                                              .updateTendenciaForm(
                                            t,
                                            (form) => TendenciaFormData(
                                              tempId: form.tempId,
                                              tituloController:
                                                  form.tituloController,
                                              tituloFocusNode:
                                                  form.tituloFocusNode,
                                              subtituloController:
                                                  form.subtituloController,
                                              subtituloFocusNode:
                                                  form.subtituloFocusNode,
                                              descripcionController:
                                                  form.descripcionController,
                                              descripcionFocusNode:
                                                  form.descripcionFocusNode,
                                              subtituloCardController:
                                                  form.subtituloCardController,
                                              subtituloCardFocusNode:
                                                  form.subtituloCardFocusNode,
                                              probabilidad: form.probabilidad,
                                              uploadedImagenPortada:
                                                  form.uploadedImagenPortada,
                                              imagenPortadaUrl: url,
                                              impactosForms: form.impactosForms,
                                              senalesForms: form.senalesForms,
                                            ),
                                          );
                                        }
                                      }

                                      // 4.2. Subir imágenes de señales
                                      for (var s = 0;
                                          s < tendenciaForm.senalesForms.length;
                                          s++) {
                                        final senaleForm =
                                            tendenciaForm.senalesForms[s];
                                        if (senaleForm.uploadedImage?.bytes !=
                                                null &&
                                            senaleForm.uploadedImage!.bytes!
                                                .isNotEmpty) {
                                          final file =
                                              senaleForm.uploadedImage!;
                                          final storagePath =
                                              'imagenesSenales/${DateTime.now().millisecondsSinceEpoch}_${t}_${s}_${file.name}';
                                          final url = await uploadData(
                                              storagePath, file.bytes!);
                                          if (url != null) {
                                            _model.formularioTendenciasModel
                                                .updateSenaleForm(
                                              t,
                                              s,
                                              (form) => SenaleFormData(
                                                tituloController:
                                                    form.tituloController,
                                                tituloFocusNode:
                                                    form.tituloFocusNode,
                                                descripcionController:
                                                    form.descripcionController,
                                                descripcionFocusNode:
                                                    form.descripcionFocusNode,
                                                textoEnlaceController:
                                                    form.textoEnlaceController,
                                                textoEnlaceFocusNode:
                                                    form.textoEnlaceFocusNode,
                                                uploadedImage:
                                                    form.uploadedImage,
                                                imageUrl: url,
                                                isUploadingImage: false,
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    }

                                    // PASO 1: Guardar Reporte Principal
                                    var reporteRecordReference =
                                        ReporteRecord.collection.doc();
                                    await reporteRecordReference
                                        .set(createReporteRecordData(
                                      titulo: _model
                                          .formularioReportePrincipalModel
                                          .textController2
                                          .text,
                                      descripcion: _model
                                          .formularioReportePrincipalModel
                                          .textController3
                                          .text,
                                      categoriaReporte: _model
                                          .formularioReportePrincipalModel
                                          .textController1
                                          .text,
                                      habilitado: _model
                                          .formularioReportePrincipalModel
                                          .switchValue,
                                      enlaceDropdown: _model
                                          .formularioReportePrincipalModel
                                          .textController4
                                          .text,
                                      imagenPortada: _model
                                          .formularioReportePrincipalModel
                                          .uploadedFileUrl_imagenesReportePortada,
                                      urlDescargable: _model
                                          .formularioReportePrincipalModel
                                          .uploadedFileUrl_reportesReportePDF,
                                    ));

                                    _model.reporte =
                                        ReporteRecord.getDocumentFromData(
                                            createReporteRecordData(
                                              titulo: _model
                                                  .formularioReportePrincipalModel
                                                  .textController2
                                                  .text,
                                              descripcion: _model
                                                  .formularioReportePrincipalModel
                                                  .textController3
                                                  .text,
                                              categoriaReporte: _model
                                                  .formularioReportePrincipalModel
                                                  .textController1
                                                  .text,
                                              habilitado: _model
                                                  .formularioReportePrincipalModel
                                                  .switchValue,
                                              enlaceDropdown: _model
                                                  .formularioReportePrincipalModel
                                                  .textController4
                                                  .text,
                                              imagenPortada: _model
                                                  .formularioReportePrincipalModel
                                                  .uploadedFileUrl_imagenesReportePortada,
                                              urlDescargable: _model
                                                  .formularioReportePrincipalModel
                                                  .uploadedFileUrl_reportesReportePDF,
                                            ),
                                            reporteRecordReference);

                                    // 2. Guardar Habitantes (subcolección)
                                    await HabitantesRecord.createDoc(
                                            _model.reporte!.reference)
                                        .set(createHabitantesRecordData(
                                      tituloSeccion: _model
                                          .formularioHabitanteModel
                                          .textController1
                                          .text,
                                      subtituloSeccion: _model
                                          .formularioHabitanteModel
                                          .textController2
                                          .text,
                                      descripcion: _model
                                          .formularioHabitanteModel
                                          .textController4
                                          .text,
                                      imagenHabitante: _model
                                          .formularioHabitanteModel
                                          .uploadedFileUrl_imagenesHabitantePortada,
                                      nombreHabitante: _model
                                          .formularioHabitanteModel
                                          .textController3
                                          .text,
                                      audioHabitante: _model
                                          .formularioHabitanteModel
                                          .uploadedFileUrl_audiosAudioHabitante,
                                      habilitado: _model
                                          .formularioHabitanteModel.switchValue,
                                    ));

                                    // 3. Guardar Procesos (subcolección)
                                    _model.formularioProcesoModel
                                        .buildProcesosPeriodos();
                                    await ProcesosRecord.createDoc(
                                            _model.reporte!.reference)
                                        .set({
                                      ...createProcesosRecordData(
                                        tituloSeccion: _model
                                            .formularioProcesoModel
                                            .textController1
                                            .text,
                                        habilitado: _model
                                            .formularioProcesoModel
                                            .switchValue1,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'senales':
                                              getHabitantePeriodosListFirestoreData(
                                            _model.formularioProcesoModel
                                                .procesosPeriodos,
                                          ),
                                        },
                                      ),
                                    });

                                    // 4. Guardar Cifras (subcolección)
                                    _model.formularioCifrasModel
                                        .buildCifrasList();
                                    await CifrasRecord.createDoc(
                                            _model.reporte!.reference)
                                        .set({
                                      ...createCifrasRecordData(
                                        tituloSeccion: _model
                                            .formularioCifrasModel
                                            .textController1
                                            .text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'cifras':
                                              getHabitanteCardListFirestoreData(
                                            _model.formularioCifrasModel
                                                .cifrasList,
                                          ),
                                        },
                                      ),
                                    });

                                    // 5. Guardar Tendencias (subcolección)
                                    // Primero construir la lista
                                    _model.formularioTendenciasModel
                                        .buildTendenciasList();

                                    // Guardar cada tendencia como documento separado usando tempId como ID
                                    // NO guardamos un documento "principal" porque cada tendencia es un documento individual
                                    for (var i = 0;
                                        i <
                                            _model.formularioTendenciasModel
                                                .tendenciasForms.length;
                                        i++) {
                                      final tendenciaForm = _model
                                          .formularioTendenciasModel
                                          .tendenciasForms[i];
                                      final tendenciaStruct = _model
                                          .formularioTendenciasModel
                                          .tendenciasList[i];

                                      // Crear documento usando tempId como ID del documento
                                      final tendenciaDocRef =
                                          TendenciasRecord.createDoc(
                                        _model.reporte!.reference,
                                        id: tendenciaForm.tempId
                                            .replaceAll('temp_tendencia_', ''),
                                      );

                                      // Guardar la tendencia como documento separado
                                      await tendenciaDocRef.set(
                                        createTendenciasRecordData(
                                          tituloSeccion: _model
                                              .formularioTendenciasModel
                                              .textController1
                                              .text,
                                          subtituloSeccion: _model
                                              .formularioTendenciasModel
                                              .textController2
                                              .text,
                                          tendencias: tendenciaStruct,
                                        ),
                                      );
                                    }

                                    // NOTA: Los escenarios e iniciativas se guardarán en la segunda parte del formulario

                                    // Mostrar mensaje de éxito
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Primera parte del reporte guardada exitosamente',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration:
                                            Duration(milliseconds: 3000),
                                        backgroundColor:
                                            Color(0xFF10B981),
                                      ),
                                    );

                                    safeSetState(() {
                                      _model.isSaving = false;
                                    });

                                    // Navegar a la segunda parte del formulario
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    if (context.mounted) {
                                      context.pushNamed(
                                        'ReporteFormulario2',
                                        queryParameters: {
                                          'reporteId': serializeParam(
                                                _model.reporte!.reference.id,
                                                ParamType.String,
                                              ) ??
                                              '',
                                        },
                                      );
                                    }
                                  } catch (e) {
                                    // Manejar errores
                                    safeSetState(() {
                                      _model.isSaving = false;
                                    });

                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error al guardar el reporte: ${e.toString()}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 5000),
                                        backgroundColor:
                                            const Color(0xFFEF4444),
                                      ),
                                    );
                                  }
                                },
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 64.0,
                            decoration: BoxDecoration(
                              gradient: _model.isSaving
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF6B7280),
                                        Color(0xFF4B5563),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : const LinearGradient(
                                      colors: [
                                        Color(0xFF6366F1),
                                        Color(0xFF8B5CF6),
                                        Color(0xFF462B99),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.0, 0.5, 1.0],
                                    ),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: _model.isSaving
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: const Color(0xFF6366F1)
                                            .withOpacity(0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: const Color(0xFF8B5CF6)
                                            .withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: const Offset(0, 5),
                                        spreadRadius: -5,
                                      ),
                                    ],
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.isSaving)
                                  SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Icon(
                                      Icons.save_rounded,
                                      color: Colors.white,
                                      size: 22.0,
                                    ),
                                  ),
                                const SizedBox(width: 16.0),
                                Text(
                                  _model.isSaving
                                      ? 'Guardando reporte...'
                                      : 'Registrar Reporte',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                if (!_model.isSaving) ...[
                                  const SizedBox(width: 12.0),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 22.0,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
