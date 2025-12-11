import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/formulario_escenarios_widget.dart';
import '/components/formulario_iniciativas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reporte_formulario2_model.dart';
export 'reporte_formulario2_model.dart';

class ReporteFormulario2Widget extends StatefulWidget {
  const ReporteFormulario2Widget({
    super.key,
    String? reporteId,
  }) : reporteId = reporteId ?? '';

  final String reporteId;

  static String routeName = 'ReporteFormulario2';
  static String routePath = '/reporteFormulario2';

  @override
  State<ReporteFormulario2Widget> createState() =>
      _ReporteFormulario2WidgetState();
}

class _ReporteFormulario2WidgetState extends State<ReporteFormulario2Widget> {
  late ReporteFormulario2Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReporteFormulario2Model());
    
    // Configurar el callback de actualización del modelo
    _model.setOnUpdate(
      onUpdate: () => safeSetState(() {}),
      updateOnChange: true,
    );

    // Cargar el reporte desde Firestore usando reporteId
    if (widget.reporteId.isNotEmpty) {
      _model.loadReporte(widget.reporteId);
    } else {
      // Si no hay reporteId, establecer isLoading en false
      _model.isLoading = false;
      _model.onUpdate();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
            'Registrar Reporte - Parte 2',
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
            child: _model.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Formulario de Escenarios
                              Builder(
                                builder: (context) {
                                  // Establecer la función para obtener tendencias disponibles
                                  _model.formularioEscenariosModel.getTendenciasDisponibles = () {
                                    return _model.tendenciasDisponibles;
                                  };
                                  // Configurar el callback de actualización si no está configurado
                                  _model.formularioEscenariosModel.setOnUpdate(
                                    onUpdate: () => safeSetState(() {}),
                                    updateOnChange: true,
                                  );
                                  // Inicializar carga de tendencias si están disponibles
                                  if (_model.tendenciasDisponibles.isNotEmpty && 
                                      _model.formularioEscenariosModel.tendenciasCachedData == null &&
                                      !_model.formularioEscenariosModel.isLoadingTendencias) {
                                    _model.formularioEscenariosModel.initializeTendencias();
                                  }
                                  return wrapWithModel(
                                    model: _model.formularioEscenariosModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: const FormularioEscenariosWidget(),
                                  );
                                },
                              ),
                              const SizedBox(height: 30.0),
                              // Formulario de Iniciativas
                              wrapWithModel(
                                model: _model.formularioIniciativasModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const FormularioIniciativasWidget(),
                              ),
                            ],
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
                                onTap: _model.isSaving ? null : () async {
                                  try {
                                    safeSetState(() {
                                      _model.isSaving = true;
                                    });

                                    // PASO 0: Subir todos los archivos al Storage primero
                                    
                                    // Subir archivos de escenarios
                                    for (var e = 0; e < _model.formularioEscenariosModel.escenariosForms.length; e++) {
                                      final escenarioForm = _model.formularioEscenariosModel.escenariosForms[e];
                                      
                                      // Imagen principal
                                      if (escenarioForm.uploadedImagenPrincipal?.bytes != null &&
                                          escenarioForm.uploadedImagenPrincipal!.bytes!.isNotEmpty) {
                                        final file = escenarioForm.uploadedImagenPrincipal!;
                                        final storagePath = 'imagenesEscenarios/${DateTime.now().millisecondsSinceEpoch}_${e}_principal_${file.name}';
                                        final url = await uploadData(storagePath, file.bytes!);
                                        if (url != null) {
                                          _model.formularioEscenariosModel.updateEscenarioForm(
                                            e,
                                            (f) => EscenarioFormData(
                                              tituloController: f.tituloController,
                                              tituloFocusNode: f.tituloFocusNode,
                                              subtituloController: f.subtituloController,
                                              subtituloFocusNode: f.subtituloFocusNode,
                                              descripcionController: f.descripcionController,
                                              descripcionFocusNode: f.descripcionFocusNode,
                                              uploadedImagenPrincipal: f.uploadedImagenPrincipal,
                                              imagenPrincipalUrl: url,
                                              isUploadingImagenPrincipal: false,
                                              imagenSecundariasUrls: f.imagenSecundariasUrls,
                                              uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
                                              habitantesForms: f.habitantesForms,
                                              cardsForms: f.cardsForms,
                                              manifestacionesForms: f.manifestacionesForms,
                                              iniciativasForms: f.iniciativasForms,
                                              tendenciasOrigina: f.tendenciasOrigina,
                                            ),
                                          );
                                        }
                                      }

                                      // Imágenes secundarias
                                      final newUrls = List<String>.from(escenarioForm.imagenSecundariasUrls);
                                      for (var i = 0; i < escenarioForm.uploadedImagenesSecundarias.length; i++) {
                                        final file = escenarioForm.uploadedImagenesSecundarias[i];
                                        if (file.bytes != null && file.bytes!.isNotEmpty) {
                                          final storagePath = 'imagenesEscenarios/${DateTime.now().millisecondsSinceEpoch}_${e}_secundaria_${i}_${file.name}';
                                          final url = await uploadData(storagePath, file.bytes!);
                                          if (url != null) {
                                            if (i >= newUrls.length) {
                                              while (newUrls.length <= i) {
                                                newUrls.add('');
                                              }
                                            }
                                            newUrls[i] = url;
                                          }
                                        }
                                      }
                                      if (newUrls != escenarioForm.imagenSecundariasUrls) {
                                        _model.formularioEscenariosModel.updateEscenarioForm(
                                          e,
                                          (f) => EscenarioFormData(
                                            tituloController: f.tituloController,
                                            tituloFocusNode: f.tituloFocusNode,
                                            subtituloController: f.subtituloController,
                                            subtituloFocusNode: f.subtituloFocusNode,
                                            descripcionController: f.descripcionController,
                                            descripcionFocusNode: f.descripcionFocusNode,
                                            uploadedImagenPrincipal: f.uploadedImagenPrincipal,
                                            imagenPrincipalUrl: f.imagenPrincipalUrl,
                                            isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
                                            imagenSecundariasUrls: newUrls,
                                            uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
                                            habitantesForms: f.habitantesForms,
                                            cardsForms: f.cardsForms,
                                            manifestacionesForms: f.manifestacionesForms,
                                            iniciativasForms: f.iniciativasForms,
                                            tendenciasOrigina: f.tendenciasOrigina,
                                          ),
                                        );
                                      }

                                      // Habitantes (audios e imágenes)
                                      for (var h = 0; h < escenarioForm.habitantesForms.length; h++) {
                                        final habitanteForm = escenarioForm.habitantesForms[h];
                                        
                                        // Audio
                                        if (habitanteForm.uploadedAudio?.bytes != null &&
                                            habitanteForm.uploadedAudio!.bytes!.isNotEmpty) {
                                          final file = habitanteForm.uploadedAudio!;
                                          final storagePath = 'audiosHabitantes/${DateTime.now().millisecondsSinceEpoch}_${e}_${h}_${file.originalFilename}';
                                          final url = await uploadData(storagePath, file.bytes!);
                                          if (url != null) {
                                            _model.formularioEscenariosModel.updateHabitanteForm(
                                              e,
                                              h,
                                              (form) => EscenarioHabitanteFormData(
                                                audioController: form.audioController,
                                                audioFocusNode: form.audioFocusNode,
                                                imagenController: form.imagenController,
                                                imagenFocusNode: form.imagenFocusNode,
                                                nombreController: form.nombreController,
                                                nombreFocusNode: form.nombreFocusNode,
                                                descripcionController: form.descripcionController,
                                                descripcionFocusNode: form.descripcionFocusNode,
                                                uploadedAudio: form.uploadedAudio,
                                                audioUrl: url,
                                                isUploadingAudio: false,
                                                uploadedImage: form.uploadedImage,
                                                imageUrl: form.imageUrl,
                                                isUploadingImage: form.isUploadingImage,
                                              ),
                                            );
                                          }
                                        }
                                        
                                        // Imagen
                                        if (habitanteForm.uploadedImage?.bytes != null &&
                                            habitanteForm.uploadedImage!.bytes!.isNotEmpty) {
                                          final file = habitanteForm.uploadedImage!;
                                          final storagePath = 'imagenesHabitantes/${DateTime.now().millisecondsSinceEpoch}_${e}_${h}_${file.name}';
                                          final url = await uploadData(storagePath, file.bytes!);
                                          if (url != null) {
                                            _model.formularioEscenariosModel.updateHabitanteForm(
                                              e,
                                              h,
                                              (form) => EscenarioHabitanteFormData(
                                                audioController: form.audioController,
                                                audioFocusNode: form.audioFocusNode,
                                                imagenController: form.imagenController,
                                                imagenFocusNode: form.imagenFocusNode,
                                                nombreController: form.nombreController,
                                                nombreFocusNode: form.nombreFocusNode,
                                                descripcionController: form.descripcionController,
                                                descripcionFocusNode: form.descripcionFocusNode,
                                                uploadedAudio: form.uploadedAudio,
                                                audioUrl: form.audioUrl,
                                                isUploadingAudio: form.isUploadingAudio,
                                                uploadedImage: form.uploadedImage,
                                                imageUrl: url,
                                                isUploadingImage: false,
                                              ),
                                            );
                                          }
                                        }
                                      }

                                      // Manifestaciones (imágenes)
                                      for (var m = 0; m < escenarioForm.manifestacionesForms.length; m++) {
                                        final manifestacionForm = escenarioForm.manifestacionesForms[m];
                                        if (manifestacionForm.uploadedImage?.bytes != null &&
                                            manifestacionForm.uploadedImage!.bytes!.isNotEmpty) {
                                          final file = manifestacionForm.uploadedImage!;
                                          final storagePath = 'imagenesManifestaciones/${DateTime.now().millisecondsSinceEpoch}_${e}_${m}_${file.name}';
                                          final url = await uploadData(storagePath, file.bytes!);
                                          if (url != null) {
                                            _model.formularioEscenariosModel.updateManifestacionForm(
                                              e,
                                              m,
                                              (form) => EscenarioManifestacionFormData(
                                                imagenController: form.imagenController,
                                                imagenFocusNode: form.imagenFocusNode,
                                                tituloController: form.tituloController,
                                                tituloFocusNode: form.tituloFocusNode,
                                                descripcionController: form.descripcionController,
                                                descripcionFocusNode: form.descripcionFocusNode,
                                                uploadedImage: form.uploadedImage,
                                                imageUrl: url,
                                                isUploadingImage: false,
                                              ),
                                            );
                                          }
                                        }
                                      }

                                      // Iniciativas (imágenes)
                                      for (var i = 0; i < escenarioForm.iniciativasForms.length; i++) {
                                        final iniciativaForm = escenarioForm.iniciativasForms[i];
                                        if (iniciativaForm.uploadedImage?.bytes != null &&
                                            iniciativaForm.uploadedImage!.bytes!.isNotEmpty) {
                                          final file = iniciativaForm.uploadedImage!;
                                          final storagePath = 'imagenesIniciativas/${DateTime.now().millisecondsSinceEpoch}_${e}_${i}_${file.name}';
                                          final url = await uploadData(storagePath, file.bytes!);
                                          if (url != null) {
                                            _model.formularioEscenariosModel.updateIniciativaForm(
                                              e,
                                              i,
                                              (form) => EscenarioIniciativaFormData(
                                                tituloController: form.tituloController,
                                                tituloFocusNode: form.tituloFocusNode,
                                                descripcionController: form.descripcionController,
                                                descripcionFocusNode: form.descripcionFocusNode,
                                                capacidadesForms: form.capacidadesForms,
                                                imagenController: form.imagenController,
                                                imagenFocusNode: form.imagenFocusNode,
                                                uploadedImage: form.uploadedImage,
                                                imageUrl: url,
                                                isUploadingImage: false,
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    }

                                    // Guardar Escenarios (subcolección)
                                    _model.formularioEscenariosModel.buildEscenariosList();
                                    
                                    await EscenariosRecord.createDoc(
                                            _model.reporte!.reference)
                                        .set({
                                      ...createEscenariosRecordData(
                                        tituloSeccion: _model
                                              .formularioEscenariosModel.textController1.text,
                                        subtituloSeccion: _model
                                              .formularioEscenariosModel.textController2.text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'escenarios': getEscenariosListListFirestoreData(
                                              _model.formularioEscenariosModel.escenariosList,
                                          ),
                                        },
                                      ),
                                    });

                                    // Guardar Iniciativas (subcolección)
                                    await IniciativasRecord.createDoc(
                                            _model.reporte!.reference)
                                        .set(createIniciativasRecordData(
                                      tituloSeccion: _model
                                            .formularioIniciativasModel.textController1.text,
                                      subtituloSeccion: _model
                                            .formularioIniciativasModel.textController2.text,
                                      habilitado: _model
                                            .formularioIniciativasModel.switchValue1,
                                    ));

                                    // Mostrar mensaje de éxito
                                    ScaffoldMessenger.of(context).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Reporte guardado exitosamente',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xFF10B981),
                                      ),
                                    );

                                    safeSetState(() {
                                      _model.isSaving = false;
                                    });

                                    // Navegar hacia atrás después de un breve delay
                                    await Future.delayed(const Duration(milliseconds: 500));
                                    if (context.mounted) {
                                      context.safePop();
                                    }
                                  } catch (e) {
                                    // Manejar errores
                                    safeSetState(() {
                                      _model.isSaving = false;
                                    });

                                    ScaffoldMessenger.of(context).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error al guardar el reporte: ${e.toString()}',
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        duration: const Duration(milliseconds: 5000),
                                        backgroundColor: const Color(0xFFEF4444),
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
                                        const SizedBox(
                                          width: 24.0,
                                          height: 24.0,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              Colors.white,
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
                                            : 'Finalizar Reporte',
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
                                          Icons.check_circle_outline_rounded,
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

