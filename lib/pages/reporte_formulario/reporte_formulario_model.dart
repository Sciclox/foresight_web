import '/backend/backend.dart';
import '/components/formulario_cifras_widget.dart';
import '/components/formulario_habitante_widget.dart';
import '/components/formulario_proceso_widget.dart';
import '/components/formulario_reporte_principal_widget.dart';
import '/components/formulario_tendencias_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reporte_formulario_widget.dart' show ReporteFormularioWidget;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReporteFormularioModel
    extends FlutterFlowModel<ReporteFormularioWidget> {
  ///  Local state fields for this page.

  List<HabitantePeriodosStruct> cardsItems = [];
  void addToCardsItems(HabitantePeriodosStruct item) => cardsItems.add(item);
  void removeFromCardsItems(HabitantePeriodosStruct item) =>
      cardsItems.remove(item);
  void removeAtIndexFromCardsItems(int index) => cardsItems.removeAt(index);
  void insertAtIndexInCardsItems(int index, HabitantePeriodosStruct item) =>
      cardsItems.insert(index, item);
  void updateCardsItemsAtIndex(
          int index, Function(HabitantePeriodosStruct) updateFn) =>
      cardsItems[index] = updateFn(cardsItems[index]);

  List<HabitanteCardStruct> cardsItems2 = [];
  void addToCardsItems2(HabitanteCardStruct item) => cardsItems2.add(item);
  void removeFromCardsItems2(HabitanteCardStruct item) =>
      cardsItems2.remove(item);
  void removeAtIndexFromCardsItems2(int index) => cardsItems2.removeAt(index);
  void insertAtIndexInCardsItems2(int index, HabitanteCardStruct item) =>
      cardsItems2.insert(index, item);
  void updateCardsItems2AtIndex(
          int index, Function(HabitanteCardStruct) updateFn) =>
      cardsItems2[index] = updateFn(cardsItems2[index]);

  // Lista de EscenariosListStruct
  List<EscenariosListStruct> escenariosList = [];
  void addToEscenariosList(EscenariosListStruct item) => escenariosList.add(item);
  void removeFromEscenariosList(EscenariosListStruct item) =>
      escenariosList.remove(item);
  void removeAtIndexFromEscenariosList(int index) => escenariosList.removeAt(index);
  
  // Lista de IniciativaCardStruct para IniciativasRecord
  List<IniciativaCardStruct> iniciativasList = [];
  void addToIniciativasList(IniciativaCardStruct item) => iniciativasList.add(item);
  void removeFromIniciativasList(IniciativaCardStruct item) =>
      iniciativasList.remove(item);
  void removeAtIndexFromIniciativasList(int index) => iniciativasList.removeAt(index);

  String? urlPDF;

  ///  State fields for stateful widgets in this page.

  // Model for formularioReportePrincipal component.
  late FormularioReportePrincipalModel formularioReportePrincipalModel;
  // Model for formularioHabitante component.
  late FormularioHabitanteModel formularioHabitanteModel;
  // Model for formularioProceso component.
  late FormularioProcesoModel formularioProcesoModel;
  // Model for formularioCifras component.
  late FormularioCifrasModel formularioCifrasModel;
  // Model for formularioTendencias component.
  late FormularioTendenciasModel formularioTendenciasModel;
  // Nota: formularioEscenariosModel e formularioIniciativasModel se usarán en ReporteFormulario2
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;

  // Campos para Tendencias
  FocusNode? tendenciasTituloSeccionFocusNode;
  TextEditingController? tendenciasTituloSeccionController;
  FocusNode? tendenciasSubtituloSeccionFocusNode;
  TextEditingController? tendenciasSubtituloSeccionController;
  bool? tendenciasHabilitado;
  
  // Campos para TendenciasListStruct (objeto tendencias)
  FocusNode? tendenciasListTituloFocusNode;
  TextEditingController? tendenciasListTituloController;
  FocusNode? tendenciasListSubtituloFocusNode;
  TextEditingController? tendenciasListSubtituloController;
  FocusNode? tendenciasListDescripcionFocusNode;
  TextEditingController? tendenciasListDescripcionController;
  FocusNode? tendenciasListProbabilidadFocusNode;
  TextEditingController? tendenciasListProbabilidadController;
  
  // Lista de impactos para TendenciasListStruct
  List<String> tendenciasListImpactos = [];
  FocusNode? tendenciasImpactoFocusNode;
  TextEditingController? tendenciasImpactoController;
  
  // Campos para SenalesStruct dentro de TendenciasListStruct
  FocusNode? tendenciasSenalesImagenFocusNode;
  TextEditingController? tendenciasSenalesImagenController;
  FocusNode? tendenciasSenalesTituloFocusNode;
  TextEditingController? tendenciasSenalesTituloController;
  FocusNode? tendenciasSenalesDescripcionFocusNode;
  TextEditingController? tendenciasSenalesDescripcionController;
  FocusNode? tendenciasSenalesTextoEnlaceFocusNode;
  TextEditingController? tendenciasSenalesTextoEnlaceController;
  String? tendenciasSenalesImagenUrl;
  bool isDataUploading_tendenciasSenales = false;
  FFUploadedFile? uploadedLocalFile_tendenciasSenales;

  // Campos para Escenarios
  FocusNode? escenariosTituloSeccionFocusNode;
  TextEditingController? escenariosTituloSeccionController;
  FocusNode? escenariosSubtituloSeccionFocusNode;
  TextEditingController? escenariosSubtituloSeccionController;

  // Campos para Iniciativas
  FocusNode? iniciativasTituloSeccionFocusNode;
  TextEditingController? iniciativasTituloSeccionController;
  FocusNode? iniciativasSubtituloSeccionFocusNode;
  TextEditingController? iniciativasSubtituloSeccionController;

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReporteRecord? reporte;
  
  // Estado para controlar el guardado
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

  @override
  void initState(BuildContext context) {
    formularioReportePrincipalModel =
        createModel(context, () => FormularioReportePrincipalModel());
    formularioHabitanteModel =
        createModel(context, () => FormularioHabitanteModel());
    formularioProcesoModel =
        createModel(context, () => FormularioProcesoModel());
    formularioCifrasModel =
        createModel(context, () => FormularioCifrasModel());
    formularioTendenciasModel =
        createModel(context, () => FormularioTendenciasModel());
    // formularioEscenariosModel e formularioIniciativasModel se inicializarán en ReporteFormulario2
        
    // Inicializar controladores de TendenciasListStruct
    tendenciasListTituloController ??= TextEditingController();
    tendenciasListTituloFocusNode ??= FocusNode();
    tendenciasListSubtituloController ??= TextEditingController();
    tendenciasListSubtituloFocusNode ??= FocusNode();
    tendenciasListDescripcionController ??= TextEditingController();
    tendenciasListDescripcionFocusNode ??= FocusNode();
    tendenciasListProbabilidadController ??= TextEditingController();
    tendenciasListProbabilidadFocusNode ??= FocusNode();
    tendenciasImpactoController ??= TextEditingController();
    tendenciasImpactoFocusNode ??= FocusNode();
    tendenciasSenalesImagenController ??= TextEditingController();
    tendenciasSenalesImagenFocusNode ??= FocusNode();
    tendenciasSenalesTituloController ??= TextEditingController();
    tendenciasSenalesTituloFocusNode ??= FocusNode();
    tendenciasSenalesDescripcionController ??= TextEditingController();
    tendenciasSenalesDescripcionFocusNode ??= FocusNode();
    tendenciasSenalesTextoEnlaceController ??= TextEditingController();
    tendenciasSenalesTextoEnlaceFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    formularioReportePrincipalModel.dispose();
    formularioHabitanteModel.dispose();
    formularioProcesoModel.dispose();
    formularioCifrasModel.dispose();
    formularioTendenciasModel.dispose();
    // formularioEscenariosModel e formularioIniciativasModel se manejarán en ReporteFormulario2
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    tendenciasTituloSeccionFocusNode?.dispose();
    tendenciasTituloSeccionController?.dispose();
    tendenciasSubtituloSeccionFocusNode?.dispose();
    tendenciasSubtituloSeccionController?.dispose();

    escenariosTituloSeccionFocusNode?.dispose();
    escenariosTituloSeccionController?.dispose();
    escenariosSubtituloSeccionFocusNode?.dispose();
    escenariosSubtituloSeccionController?.dispose();

    iniciativasTituloSeccionFocusNode?.dispose();
    iniciativasTituloSeccionController?.dispose();
    iniciativasSubtituloSeccionFocusNode?.dispose();
    iniciativasSubtituloSeccionController?.dispose();

    tendenciasListTituloFocusNode?.dispose();
    tendenciasListTituloController?.dispose();
    tendenciasListSubtituloFocusNode?.dispose();
    tendenciasListSubtituloController?.dispose();
    tendenciasListDescripcionFocusNode?.dispose();
    tendenciasListDescripcionController?.dispose();
    tendenciasListProbabilidadFocusNode?.dispose();
    tendenciasListProbabilidadController?.dispose();
    tendenciasImpactoFocusNode?.dispose();
    tendenciasImpactoController?.dispose();
    tendenciasSenalesImagenFocusNode?.dispose();
    tendenciasSenalesImagenController?.dispose();
    tendenciasSenalesTituloFocusNode?.dispose();
    tendenciasSenalesTituloController?.dispose();
    tendenciasSenalesDescripcionFocusNode?.dispose();
    tendenciasSenalesDescripcionController?.dispose();
    tendenciasSenalesTextoEnlaceFocusNode?.dispose();
    tendenciasSenalesTextoEnlaceController?.dispose();
  }

  /// Load reporte from Firestore using reporteId and populate all forms
  Future<void> loadReporte(String reporteId) async {
    try {
      // Cargar el reporte principal
      final reporteDoc = await ReporteRecord.getDocumentOnce(
        ReporteRecord.collection.doc(reporteId),
      );
      reporte = reporteDoc;

      if (reporte == null) {
        return;
      }

      // 1. Poblar FormularioReportePrincipal
      formularioReportePrincipalModel.textController1.text = reporte!.categoriaReporte;
      formularioReportePrincipalModel.textController2.text = reporte!.titulo;
      formularioReportePrincipalModel.textController3.text = reporte!.descripcion;
      formularioReportePrincipalModel.textController4.text = reporte!.enlaceDropdown;
      formularioReportePrincipalModel.switchValue = reporte!.habilitado;
      formularioReportePrincipalModel.uploadedFileUrl_imagenesReportePortada = reporte!.imagenPortada;
      formularioReportePrincipalModel.uploadedFileUrl_reportesReportePDF = reporte!.urlDescargable;
      
      // Descargar imagen de portada si existe
      if (reporte!.imagenPortada.isNotEmpty) {
        final imageFile = await _downloadFileFromUrl(reporte!.imagenPortada, 'portada.jpg');
        if (imageFile != null) {
          formularioReportePrincipalModel.uploadedLocalFile_imagenesReportePortada = imageFile;
        }
      }
      
      // Descargar PDF si existe
      if (reporte!.urlDescargable.isNotEmpty) {
        final pdfFile = await _downloadFileFromUrl(reporte!.urlDescargable, 'reporte.pdf');
        if (pdfFile != null) {
          formularioReportePrincipalModel.uploadedLocalFile_reportesReportePDF = pdfFile;
        }
      }

      // 2. Cargar y poblar Habitantes
      final habitantesList = await queryHabitantesRecordOnce(
        parent: reporte!.reference,
        limit: 1,
        singleRecord: false,
      );

      if (habitantesList.isNotEmpty) {
        final habitantesData = habitantesList.first;
        formularioHabitanteModel.textController1.text = habitantesData.tituloSeccion ?? '';
        formularioHabitanteModel.textController2.text = habitantesData.subtituloSeccion ?? '';
        formularioHabitanteModel.textController3.text = habitantesData.nombreHabitante ?? '';
        formularioHabitanteModel.textController4.text = habitantesData.descripcion ?? '';
        formularioHabitanteModel.switchValue = habitantesData.habilitado ?? false;
        formularioHabitanteModel.uploadedFileUrl_imagenesHabitantePortada = habitantesData.imagenHabitante ?? '';
        formularioHabitanteModel.uploadedFileUrl_audiosAudioHabitante = habitantesData.audioHabitante ?? '';
        
        // Descargar imagen de habitante si existe
        if (habitantesData.imagenHabitante.isNotEmpty) {
          final imageFile = await _downloadFileFromUrl(habitantesData.imagenHabitante, 'habitante.jpg');
          if (imageFile != null) {
            formularioHabitanteModel.uploadedLocalFile_imagenesHabitantePortada = imageFile;
          }
        }
        
        // Descargar audio de habitante si existe
        if (habitantesData.audioHabitante.isNotEmpty) {
          final audioFile = await _downloadFileFromUrl(habitantesData.audioHabitante, 'habitante.mp3');
          if (audioFile != null) {
            formularioHabitanteModel.uploadedLocalFile_audiosAudioHabitante = audioFile;
          }
        }
      }

      // 3. Cargar y poblar Procesos
      final procesosList = await queryProcesosRecordOnce(
        parent: reporte!.reference,
        limit: 1,
        singleRecord: false,
      );

      if (procesosList.isNotEmpty) {
        final procesosData = procesosList.first;
        formularioProcesoModel.textController1.text = procesosData.tituloSeccion ?? '';
        formularioProcesoModel.switchValue1 = procesosData.habilitado ?? false;

        // Poblar procesosForms desde senales (que es la lista de procesos)
        if (procesosData.senales.isNotEmpty) {
          formularioProcesoModel.procesosForms = procesosData.senales.map((procesoStruct) {
            return ProcesoFormData(
              periodo: procesoStruct.periodo,
              tituloController: TextEditingController(text: procesoStruct.titulo ?? ''),
              tituloFocusNode: FocusNode(),
              subtituloController: TextEditingController(text: procesoStruct.subtitulo ?? ''),
              subtituloFocusNode: FocusNode(),
              colorSubtituloController: TextEditingController(
                text: procesoStruct.colorSubtitulo != null
                    ? '#${procesoStruct.colorSubtitulo!.value.toRadixString(16).substring(2).toUpperCase()}'
                    : '',
              ),
              colorSubtituloFocusNode: FocusNode(),
              selectedColor: procesoStruct.colorSubtitulo,
              descripcionController: TextEditingController(text: procesoStruct.descripcion ?? ''),
              descripcionFocusNode: FocusNode(),
              citaController: TextEditingController(text: procesoStruct.cita ?? ''),
              citaFocusNode: FocusNode(),
              dineroTextController: TextEditingController(text: procesoStruct.dineroText ?? ''),
              dineroTextFocusNode: FocusNode(),
              agua: procesoStruct.agua ?? false,
              urbanizacion: procesoStruct.urbanizacion ?? false,
              dinero: procesoStruct.dinero ?? false,
              imageUrl: procesoStruct.imagen,
              isUploadingImage: false,
            );
          }).toList();
          
          // Descargar imágenes de procesos
          for (var i = 0; i < formularioProcesoModel.procesosForms.length; i++) {
            final procesoForm = formularioProcesoModel.procesosForms[i];
            if (procesoForm.imageUrl != null && procesoForm.imageUrl!.isNotEmpty) {
              final imageFile = await _downloadFileFromUrl(procesoForm.imageUrl, 'proceso_$i.jpg');
              if (imageFile != null) {
                formularioProcesoModel.updateProcesoForm(i, (form) => ProcesoFormData(
                  periodo: form.periodo,
                  tituloController: form.tituloController,
                  tituloFocusNode: form.tituloFocusNode,
                  subtituloController: form.subtituloController,
                  subtituloFocusNode: form.subtituloFocusNode,
                  colorSubtituloController: form.colorSubtituloController,
                  colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                  selectedColor: form.selectedColor,
                  descripcionController: form.descripcionController,
                  descripcionFocusNode: form.descripcionFocusNode,
                  citaController: form.citaController,
                  citaFocusNode: form.citaFocusNode,
                  dineroTextController: form.dineroTextController,
                  dineroTextFocusNode: form.dineroTextFocusNode,
                  agua: form.agua,
                  urbanizacion: form.urbanizacion,
                  dinero: form.dinero,
                  uploadedImage: imageFile,
                  imageUrl: form.imageUrl,
                  isUploadingImage: false,
                ));
              }
            }
          }
        }
      }

      // 4. Cargar y poblar Cifras
      final cifrasList = await queryCifrasRecordOnce(
        parent: reporte!.reference,
        limit: 1,
        singleRecord: false,
      );

      if (cifrasList.isNotEmpty) {
        final cifrasData = cifrasList.first;
        formularioCifrasModel.textController1.text = cifrasData.tituloSeccion ?? '';

        // Poblar cifrasForms desde cifras
        if (cifrasData.cifras.isNotEmpty) {
          formularioCifrasModel.cifrasForms = cifrasData.cifras.map((cifraStruct) {
            return CifraFormData(
              tituloController: TextEditingController(text: cifraStruct.titulo ?? ''),
              tituloFocusNode: FocusNode(),
              descripcionController: TextEditingController(text: cifraStruct.descripcion ?? ''),
              descripcionFocusNode: FocusNode(),
            );
          }).toList();
        }
      }

      // 5. Cargar y poblar Tendencias
      final tendenciasSnapshot = await TendenciasRecord.collection(reporte!.reference).get();
      
      // Filtrar documentos que tienen un título válido (excluir documentos "principales" antiguos)
      final List<TendenciasRecord> validTendencias = [];
      for (var doc in tendenciasSnapshot.docs) {
        try {
          final record = TendenciasRecord.fromSnapshot(doc);
          final tendenciaData = record.tendencias;
          // Solo incluir si tiene título (excluye documentos "principales" sin título individual)
          if (tendenciaData.hasTitulo() && tendenciaData.titulo.isNotEmpty) {
            validTendencias.add(record);
          }
        } catch (e) {
          print('Error al parsear tendencia ${doc.id}: $e');
        }
      }

      if (validTendencias.isNotEmpty) {
        // Usar el primer documento para obtener tituloSeccion y subtituloSeccion
        final primeraTendencia = validTendencias.first;
        formularioTendenciasModel.textController1.text = primeraTendencia.tituloSeccion ?? '';
        formularioTendenciasModel.textController2.text = primeraTendencia.subtituloSeccion ?? '';

        // Poblar tendenciasForms desde todos los documentos de tendencias
        formularioTendenciasModel.tendenciasForms = validTendencias.map((tendenciaRecord) {
          final tendenciaStruct = tendenciaRecord.tendencias;
          
          // Mapear impactos
          final impactosForms = (tendenciaStruct.impactos ?? []).map((impacto) {
            return ImpactoFormData(
              controller: TextEditingController(text: impacto ?? ''),
              focusNode: FocusNode(),
            );
          }).toList();

          // Mapear señales - senales es un solo SenalesStruct, no una lista
          final senalesForms = <SenaleFormData>[];
          if (tendenciaStruct.hasSenales()) {
            final senaleStruct = tendenciaStruct.senales;
            senalesForms.add(SenaleFormData(
              tituloController: TextEditingController(text: senaleStruct.titulo ?? ''),
              tituloFocusNode: FocusNode(),
              descripcionController: TextEditingController(text: senaleStruct.descripcion ?? ''),
              descripcionFocusNode: FocusNode(),
              textoEnlaceController: TextEditingController(text: senaleStruct.textoEnlace ?? ''),
              textoEnlaceFocusNode: FocusNode(),
              imageUrl: senaleStruct.imagen,
              isUploadingImage: false,
            ));
          }

          return TendenciaFormData(
            tempId: 'temp_tendencia_${tendenciaRecord.reference.id}',
            tituloController: TextEditingController(text: tendenciaStruct.titulo ?? ''),
            tituloFocusNode: FocusNode(),
            subtituloController: TextEditingController(text: tendenciaStruct.subtitulo ?? ''),
            subtituloFocusNode: FocusNode(),
            descripcionController: TextEditingController(text: tendenciaStruct.descripcion ?? ''),
            descripcionFocusNode: FocusNode(),
            subtituloCardController: TextEditingController(text: tendenciaStruct.subtituloCard ?? ''),
            subtituloCardFocusNode: FocusNode(),
            probabilidad: tendenciaStruct.probabilidad,
            imagenPortadaUrl: tendenciaStruct.imagenPortada,
            impactosForms: impactosForms,
            senalesForms: senalesForms,
          );
        }).toList();
        
        // Descargar imágenes de portada y señales de tendencias
        for (var i = 0; i < formularioTendenciasModel.tendenciasForms.length; i++) {
          final tendenciaForm = formularioTendenciasModel.tendenciasForms[i];
          
          // Descargar imagen de portada
          if (tendenciaForm.imagenPortadaUrl != null && tendenciaForm.imagenPortadaUrl!.isNotEmpty) {
            final imageFile = await _downloadFileFromUrl(tendenciaForm.imagenPortadaUrl, 'tendencia_portada_$i.jpg');
            if (imageFile != null) {
              formularioTendenciasModel.updateTendenciaForm(i, (form) => TendenciaFormData(
                tempId: form.tempId,
                tituloController: form.tituloController,
                tituloFocusNode: form.tituloFocusNode,
                subtituloController: form.subtituloController,
                subtituloFocusNode: form.subtituloFocusNode,
                descripcionController: form.descripcionController,
                descripcionFocusNode: form.descripcionFocusNode,
                subtituloCardController: form.subtituloCardController,
                subtituloCardFocusNode: form.subtituloCardFocusNode,
                probabilidad: form.probabilidad,
                uploadedImagenPortada: imageFile,
                imagenPortadaUrl: form.imagenPortadaUrl,
                impactosForms: form.impactosForms,
                senalesForms: form.senalesForms,
              ));
            }
          }
          
          // Descargar imágenes de señales
          for (var s = 0; s < tendenciaForm.senalesForms.length; s++) {
            final senaleForm = tendenciaForm.senalesForms[s];
            if (senaleForm.imageUrl != null && senaleForm.imageUrl!.isNotEmpty) {
              final imageFile = await _downloadFileFromUrl(senaleForm.imageUrl, 'senale_${i}_$s.jpg');
              if (imageFile != null) {
                formularioTendenciasModel.updateSenaleForm(i, s, (form) => SenaleFormData(
                  tituloController: form.tituloController,
                  tituloFocusNode: form.tituloFocusNode,
                  descripcionController: form.descripcionController,
                  descripcionFocusNode: form.descripcionFocusNode,
                  textoEnlaceController: form.textoEnlaceController,
                  textoEnlaceFocusNode: form.textoEnlaceFocusNode,
                  uploadedImage: imageFile,
                  imageUrl: form.imageUrl,
                  isUploadingImage: false,
                ));
              }
            }
          }
        }
      }

      onUpdate();
    } catch (e) {
      print('Error loading reporte: $e');
      // No re-lanzar el error, solo loguearlo
    }
  }
}
