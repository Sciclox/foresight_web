import '/backend/backend.dart';
import '/components/formulario_escenarios_model.dart';
import '/components/formulario_iniciativas_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reporte_formulario2_widget.dart' show ReporteFormulario2Widget;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Model for ReporteFormulario2Page.
///
/// This class handles the state and logic for the ReporteFormulario2Page.
/// It is responsible for loading the reporte from Firestore and managing
/// the models for the Escenarios and Iniciativas forms.
class ReporteFormulario2Model extends FlutterFlowModel<ReporteFormulario2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for FormularioEscenarios widget.
  late FormularioEscenariosModel formularioEscenariosModel;
  // State field(s) for FormularioIniciativas widget.
  late FormularioIniciativasModel formularioIniciativasModel;

  // Reporte cargado desde Firestore
  ReporteRecord? reporte;
  
  // Lista de tendencias disponibles (DocumentReferences cargadas desde Firestore)
  List<DocumentReference> tendenciasDisponibles = [];
  
  // Estado de carga
  bool isLoading = true;
  
  // Estado de guardado
  bool isSaving = false;

  // Helper function to download file from URL and convert to FFUploadedFile
  Future<FFUploadedFile?> _downloadFileFromUrl(String? url, String filename) async {
    if (url == null || url.isEmpty) {
      return null;
    }
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return FFUploadedFile(
          bytes: response.bodyBytes,
          originalFilename: filename,
          name: filename,
        );
      }
    } catch (e) {
      print('Error downloading file from $url: $e');
    }
    return null;
  }

  // Callback para notificar al widget cuando el modelo de escenarios se actualice
  VoidCallback? _escenariosUpdateCallback;
  
  void setEscenariosUpdateCallback(VoidCallback callback) {
    _escenariosUpdateCallback = callback;
    // Configurar el callback en el modelo de escenarios si ya está inicializado
    formularioEscenariosModel.setOnUpdate(
      onUpdate: callback,
      updateOnChange: true,
    );
    }
  
  @override
  void initState(BuildContext context) {
    formularioEscenariosModel = createModel(context, () => FormularioEscenariosModel());
    formularioIniciativasModel = createModel(context, () => FormularioIniciativasModel());
  }

  @override
  void dispose() {
    formularioEscenariosModel.dispose();
    formularioIniciativasModel.dispose();
  }

  /// Load reporte from Firestore using reporteId
  Future<void> loadReporte(String reporteId) async {
    try {
      isLoading = true;
      onUpdate();
      
      // Cargar el reporte
      final reporteDoc = await ReporteRecord.getDocumentOnce(
        ReporteRecord.collection.doc(reporteId),
      );
      reporte = reporteDoc;
      
      // Cargar las tendencias disponibles desde la subcolección de tendencias del reporte
      // Filtrar solo documentos que tienen un título válido (excluir documentos "principales" antiguos)
      if (reporte != null) {
        final tendenciasSnapshot = await TendenciasRecord.collection(reporte!.reference).get();
        // Filtrar documentos que tienen un título válido en el campo tendencias
        final List<DocumentReference> validTendencias = [];
        for (var doc in tendenciasSnapshot.docs) {
          try {
            // Intentar parsear como TendenciasRecord para verificar si tiene título válido
            final record = TendenciasRecord.fromSnapshot(doc);
            final tendenciaData = record.tendencias;
            // Solo incluir si tiene título (excluye documentos "principales" sin título individual)
            if (tendenciaData.hasTitulo() && tendenciaData.titulo.isNotEmpty) {
              validTendencias.add(doc.reference);
            }
          } catch (e) {
            // Si hay error al parsear, omitir el documento
            print('Error al parsear tendencia ${doc.id}: $e');
          }
        }
        tendenciasDisponibles = validTendencias;
        
        // Configurar la función para obtener tendencias disponibles
        formularioEscenariosModel.getTendenciasDisponibles = () {
          return tendenciasDisponibles;
        };
        
        // Cargar las tendencias directamente y almacenarlas en el cache del modelo
        if (tendenciasDisponibles.isNotEmpty) {
          try {
            final tendenciasRecords = await Future.wait(
              tendenciasDisponibles.map((ref) => TendenciasRecord.getDocumentOnce(ref))
            );
            // Almacenar directamente en el cache del modelo usando el método público
            formularioEscenariosModel.setTendenciasCachedData(tendenciasRecords);
            // Notificar al modelo de escenarios para que el widget se reconstruya
            if (_escenariosUpdateCallback != null) {
              _escenariosUpdateCallback!();
            } else {
              formularioEscenariosModel.onUpdate();
            }
          } catch (e) {
            print('Error al cargar tendencias: $e');
            formularioEscenariosModel.setTendenciasCachedData([]);
            if (_escenariosUpdateCallback != null) {
              _escenariosUpdateCallback!();
            } else {
              formularioEscenariosModel.onUpdate();
            }
          }
        } else {
          formularioEscenariosModel.setTendenciasCachedData([]);
          if (_escenariosUpdateCallback != null) {
            _escenariosUpdateCallback!();
          } else {
            formularioEscenariosModel.onUpdate();
          }
        }
      }
      
      // Cargar datos existentes de Escenarios e Iniciativas si existen
      if (reporte == null) {
        isLoading = false;
        onUpdate();
        return;
      }
      
      final escenariosList = await queryEscenariosRecordOnce(
        parent: reporte!.reference,
        limit: 1,
        singleRecord: false,
      );
      
      if (escenariosList.isNotEmpty) {
        final escenariosData = escenariosList.first;
        
        // Cargar datos en el modelo de escenarios
        formularioEscenariosModel.textController1.text = escenariosData.tituloSeccion ?? '';
        formularioEscenariosModel.textController2.text = escenariosData.subtituloSeccion ?? '';
        
        // Cargar escenarios
        if (escenariosData.escenarios.isNotEmpty) {
          formularioEscenariosModel.escenariosForms = escenariosData.escenarios.map((escenarioStruct) {
            return EscenarioFormData(
              tituloController: TextEditingController(text: escenarioStruct.titulo),
              tituloFocusNode: FocusNode(),
              subtituloController: TextEditingController(text: escenarioStruct.subtitulo),
              subtituloFocusNode: FocusNode(),
              descripcionController: TextEditingController(text: escenarioStruct.descripcion.toString() ?? ''),
              descripcionFocusNode: FocusNode(),
              uploadedImagenPrincipal: null,
              imagenPrincipalUrl: escenarioStruct.imagenPrincipal,
              isUploadingImagenPrincipal: false,
              imagenSecundariasUrls: escenarioStruct.imagenSecundarias ?? [],
              uploadedImagenesSecundarias: [],
              habitantesForms: (escenarioStruct.habitantes ?? []).map((h) {
                return EscenarioHabitanteFormData(
                  audioController: TextEditingController(text: h.audio ?? ''),
                  audioFocusNode: FocusNode(),
                  imagenController: TextEditingController(text: h.imagen ?? ''),
                  imagenFocusNode: FocusNode(),
                  nombreController: TextEditingController(text: h.nombre.toString() ?? ''),
                  nombreFocusNode: FocusNode(),
                  descripcionController: TextEditingController(text: h.descripcion ?? ''),
                  descripcionFocusNode: FocusNode(),
                  uploadedAudio: null,
                  audioUrl: h.audio,
                  isUploadingAudio: false,
                  uploadedImage: null,
                  imageUrl: h.imagen,
                  isUploadingImage: false,
                );
              }).toList(),
              cardsForms: (escenarioStruct.cards ?? []).map((c) {
                return EscenarioCardFormData(
                  tituloController: TextEditingController(text: c.titulo ?? ''),
                  tituloFocusNode: FocusNode(),
                  descripcionController: TextEditingController(text: c.descripcion ?? ''),
                  descripcionFocusNode: FocusNode(),
                );
              }).toList(),
              manifestacionesForms: (escenarioStruct.manifestaciones ?? []).map((m) {
                return EscenarioManifestacionFormData(
                  imagenController: TextEditingController(text: m.imagen ?? ''),
                  imagenFocusNode: FocusNode(),
                  tituloController: TextEditingController(text: m.titulo ?? ''),
                  tituloFocusNode: FocusNode(),
                  descripcionController: TextEditingController(text: m.descripcion ?? ''),
                  descripcionFocusNode: FocusNode(),
                  uploadedImage: null,
                  imageUrl: m.imagen,
                  isUploadingImage: false,
                );
              }).toList(),
              iniciativasForms: (escenarioStruct.iniciativas ?? []).map((i) {
                return EscenarioIniciativaFormData(
                  tituloController: TextEditingController(text: i.titulo ?? ''),
                  tituloFocusNode: FocusNode(),
                  descripcionController: TextEditingController(text: i.descripcion ?? ''),
                  descripcionFocusNode: FocusNode(),
                  capacidadesForms: (i.capacidades ?? []).map((cap) {
                    return CapacidadFormData(
                      textoController: TextEditingController(text: cap ?? ''),
                      textoFocusNode: FocusNode(),
                    );
                  }).toList(),
                  imagenController: TextEditingController(text: i.imagen ?? ''),
                  imagenFocusNode: FocusNode(),
                  uploadedImage: null,
                  imageUrl: i.imagen,
                  isUploadingImage: false,
                );
              }).toList(),
              tendenciasOrigina: escenarioStruct.tendenciasOrigina ?? [],
            );
          }).toList();
          
          // Descargar imágenes de escenarios
          for (var i = 0; i < formularioEscenariosModel.escenariosForms.length; i++) {
            final escenarioForm = formularioEscenariosModel.escenariosForms[i];
            
            // Descargar imagen principal
            if (escenarioForm.imagenPrincipalUrl != null && escenarioForm.imagenPrincipalUrl!.isNotEmpty) {
              final imageFile = await _downloadFileFromUrl(escenarioForm.imagenPrincipalUrl, 'escenario_principal_$i.jpg');
              if (imageFile != null) {
                formularioEscenariosModel.updateEscenarioForm(i, (form) => EscenarioFormData(
                  tituloController: form.tituloController,
                  tituloFocusNode: form.tituloFocusNode,
                  subtituloController: form.subtituloController,
                  subtituloFocusNode: form.subtituloFocusNode,
                  descripcionController: form.descripcionController,
                  descripcionFocusNode: form.descripcionFocusNode,
                  uploadedImagenPrincipal: imageFile,
                  imagenPrincipalUrl: form.imagenPrincipalUrl,
                  isUploadingImagenPrincipal: false,
                  imagenSecundariasUrls: form.imagenSecundariasUrls,
                  uploadedImagenesSecundarias: form.uploadedImagenesSecundarias,
                  habitantesForms: form.habitantesForms,
                  cardsForms: form.cardsForms,
                  manifestacionesForms: form.manifestacionesForms,
                  iniciativasForms: form.iniciativasForms,
                  tendenciasOrigina: form.tendenciasOrigina,
                ));
              }
            }
            
            // Descargar imágenes de habitantes
            for (var h = 0; h < escenarioForm.habitantesForms.length; h++) {
              final habitanteForm = escenarioForm.habitantesForms[h];
              if (habitanteForm.imageUrl != null && habitanteForm.imageUrl!.isNotEmpty) {
                final imageFile = await _downloadFileFromUrl(habitanteForm.imageUrl, 'escenario_habitante_${i}_$h.jpg');
                if (imageFile != null) {
                  formularioEscenariosModel.updateHabitanteForm(i, h, (form) => EscenarioHabitanteFormData(
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
                    uploadedImage: imageFile,
                    imageUrl: form.imageUrl,
                    isUploadingImage: false,
                  ));
                }
              }
              if (habitanteForm.audioUrl != null && habitanteForm.audioUrl!.isNotEmpty) {
                final audioFile = await _downloadFileFromUrl(habitanteForm.audioUrl, 'escenario_habitante_audio_${i}_$h.mp3');
                if (audioFile != null) {
                  formularioEscenariosModel.updateHabitanteForm(i, h, (form) => EscenarioHabitanteFormData(
                    audioController: form.audioController,
                    audioFocusNode: form.audioFocusNode,
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    nombreController: form.nombreController,
                    nombreFocusNode: form.nombreFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedAudio: audioFile,
                    audioUrl: form.audioUrl,
                    isUploadingAudio: false,
                    uploadedImage: form.uploadedImage,
                    imageUrl: form.imageUrl,
                    isUploadingImage: form.isUploadingImage,
                  ));
                }
              }
            }
            
            // Descargar imágenes de manifestaciones
            for (var m = 0; m < escenarioForm.manifestacionesForms.length; m++) {
              final manifestacionForm = escenarioForm.manifestacionesForms[m];
              if (manifestacionForm.imageUrl != null && manifestacionForm.imageUrl!.isNotEmpty) {
                final imageFile = await _downloadFileFromUrl(manifestacionForm.imageUrl, 'escenario_manifestacion_${i}_$m.jpg');
                if (imageFile != null) {
                  formularioEscenariosModel.updateManifestacionForm(i, m, (form) => EscenarioManifestacionFormData(
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedImage: imageFile,
                    imageUrl: form.imageUrl,
                    isUploadingImage: false,
                  ));
                }
              }
            }
            
            // Descargar imágenes de iniciativas
            for (var ini = 0; ini < escenarioForm.iniciativasForms.length; ini++) {
              final iniciativaForm = escenarioForm.iniciativasForms[ini];
              if (iniciativaForm.imageUrl != null && iniciativaForm.imageUrl!.isNotEmpty) {
                final imageFile = await _downloadFileFromUrl(iniciativaForm.imageUrl, 'escenario_iniciativa_${i}_$ini.jpg');
                if (imageFile != null) {
                  formularioEscenariosModel.updateIniciativaForm(i, ini, (form) => EscenarioIniciativaFormData(
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    capacidadesForms: form.capacidadesForms,
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    uploadedImage: imageFile,
                    imageUrl: form.imageUrl,
                    isUploadingImage: false,
                  ));
                }
              }
            }
          }
        }
      }
      
      // Cargar datos existentes de Iniciativas si existen
      final iniciativasList = await queryIniciativasRecordOnce(
        parent: reporte!.reference,
        limit: 1,
        singleRecord: false,
      );
      
      if (iniciativasList.isNotEmpty) {
        final iniciativasData = iniciativasList.first;
        
        // Cargar datos en el modelo de iniciativas
        formularioIniciativasModel.textController1.text = iniciativasData.tituloSeccion ?? '';
        formularioIniciativasModel.textController2.text = iniciativasData.subtituloSeccion ?? '';
        formularioIniciativasModel.switchValue1 = iniciativasData.habilitado ?? false;
      }
      
      isLoading = false;
      onUpdate();
    } catch (e) {
      print('Error loading reporte: $e');
      isLoading = false;
      onUpdate();
      // No re-lanzar el error, solo establecer isLoading en false
    }
  }
}

