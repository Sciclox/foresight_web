import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'formulario_proceso_widget.dart' show FormularioProcesoWidget;
import 'package:flutter/material.dart';

// Clase para representar un formulario de proceso individual
class ProcesoFormData {
  final String? periodo;
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController subtituloController;
  final FocusNode subtituloFocusNode;
  final TextEditingController colorSubtituloController;
  final FocusNode colorSubtituloFocusNode;
  final Color? selectedColor;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final TextEditingController citaController;
  final FocusNode citaFocusNode;
  final TextEditingController dineroTextController;
  final FocusNode dineroTextFocusNode;
  final bool agua;
  final bool urbanizacion;
  final bool dinero;
  final FFUploadedFile? uploadedImage;
  final String? imageUrl;
  final bool isUploadingImage;

  ProcesoFormData({
    this.periodo,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? colorSubtituloController,
    FocusNode? colorSubtituloFocusNode,
    Color? selectedColor,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? citaController,
    FocusNode? citaFocusNode,
    TextEditingController? dineroTextController,
    FocusNode? dineroTextFocusNode,
    this.agua = false,
    this.urbanizacion = false,
    this.dinero = false,
    this.uploadedImage,
    this.imageUrl,
    this.isUploadingImage = false,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        subtituloController = subtituloController ?? TextEditingController(),
        subtituloFocusNode = subtituloFocusNode ?? FocusNode(),
        colorSubtituloController =
            colorSubtituloController ?? TextEditingController(),
        colorSubtituloFocusNode =
            colorSubtituloFocusNode ?? FocusNode(),
        selectedColor = selectedColor,
        descripcionController =
            descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        citaController = citaController ?? TextEditingController(),
        citaFocusNode = citaFocusNode ?? FocusNode(),
        dineroTextController =
            dineroTextController ?? TextEditingController(),
        dineroTextFocusNode = dineroTextFocusNode ?? FocusNode();

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    subtituloController.dispose();
    subtituloFocusNode.dispose();
    colorSubtituloController.dispose();
    colorSubtituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    citaController.dispose();
    citaFocusNode.dispose();
    dineroTextController.dispose();
    dineroTextFocusNode.dispose();
  }

  ProcesoFormData copyWith({
    String? periodo,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? colorSubtituloController,
    FocusNode? colorSubtituloFocusNode,
    Color? selectedColor,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? citaController,
    FocusNode? citaFocusNode,
    TextEditingController? dineroTextController,
    FocusNode? dineroTextFocusNode,
    bool? agua,
    bool? urbanizacion,
    bool? dinero,
    FFUploadedFile? uploadedImage,
    String? imageUrl,
    bool? isUploadingImage,
  }) {
    return ProcesoFormData(
      periodo: periodo ?? this.periodo,
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      subtituloController: subtituloController ?? this.subtituloController,
      subtituloFocusNode: subtituloFocusNode ?? this.subtituloFocusNode,
      colorSubtituloController:
          colorSubtituloController ?? this.colorSubtituloController,
      colorSubtituloFocusNode:
          colorSubtituloFocusNode ?? this.colorSubtituloFocusNode,
      selectedColor: selectedColor ?? this.selectedColor,
      descripcionController:
          descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      citaController: citaController ?? this.citaController,
      citaFocusNode: citaFocusNode ?? this.citaFocusNode,
      dineroTextController: dineroTextController ?? this.dineroTextController,
      dineroTextFocusNode: dineroTextFocusNode ?? this.dineroTextFocusNode,
      agua: agua ?? this.agua,
      urbanizacion: urbanizacion ?? this.urbanizacion,
      dinero: dinero ?? this.dinero,
      uploadedImage: uploadedImage ?? this.uploadedImage,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
    );
  }
}

class FormularioProcesoModel extends FlutterFlowModel<FormularioProcesoWidget> {
  ///  Local state fields for this component.

  // Lista de formularios de proceso (máximo 5)
  List<ProcesoFormData> procesosForms = [];

  // Datos finales que se guardarán en Firestore
  List<HabitantePeriodosStruct> procesosPeriodos = [];

  void addProcesoForm() {
    if (procesosForms.length < 5) {
      procesosForms.add(ProcesoFormData());
    }
  }

  void removeProcesoForm(int index) {
    if (index >= 0 && index < procesosForms.length) {
      procesosForms[index].dispose();
      procesosForms.removeAt(index);
    }
  }

  void updateProcesoForm(int index, ProcesoFormData Function(ProcesoFormData) updateFn) {
    if (index >= 0 && index < procesosForms.length) {
      procesosForms[index] = updateFn(procesosForms[index]);
    }
  }

  void buildProcesosPeriodos() {
    procesosPeriodos = procesosForms.map((form) {
      Color? colorSubtitulo = form.selectedColor;
      if (colorSubtitulo == null && form.colorSubtituloController.text.isNotEmpty) {
        try {
          final hex = form.colorSubtituloController.text.replaceAll('#', '');
          colorSubtitulo = Color(int.parse('FF$hex', radix: 16));
        } catch (e) {
          colorSubtitulo = null;
        }
      }
      return HabitantePeriodosStruct(
        periodo: form.periodo,
        titulo: form.tituloController.text,
        subtitulo: form.subtituloController.text,
        colorSubtitulo: colorSubtitulo,
        descripcion: form.descripcionController.text,
        cita: form.citaController.text,
        imagen: form.imageUrl ?? '',
        agua: form.agua,
        urbanizacion: form.urbanizacion,
        dinero: form.dinero,
        dineroText: form.dineroTextController.text,
      );
    }).toList();
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    // Dispose all proceso forms
    for (var form in procesosForms) {
      form.dispose();
    }
    procesosForms.clear();
  }
}
