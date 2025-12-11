import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'formulario_cifras_widget.dart' show FormularioCifrasWidget;
import 'package:flutter/material.dart';

// Clase para representar un formulario de cifra individual
class CifraFormData {
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;

  CifraFormData({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        descripcionController =
            descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode();

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
  }

  CifraFormData copyWith({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
  }) {
    return CifraFormData(
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      descripcionController:
          descripcionController ?? this.descripcionController,
      descripcionFocusNode:
          descripcionFocusNode ?? this.descripcionFocusNode,
    );
  }
}

class FormularioCifrasModel extends FlutterFlowModel<FormularioCifrasWidget> {
  ///  Local state fields for this component.

  // Lista de formularios de cifras
  List<CifraFormData> cifrasForms = [];

  // Datos finales que se guardarán en Firestore
  List<HabitanteCardStruct> cifrasList = [];

  void addCifraForm() {
    cifrasForms.add(CifraFormData());
  }

  void removeCifraForm(int index) {
    if (index >= 0 && index < cifrasForms.length) {
      cifrasForms[index].dispose();
      cifrasForms.removeAt(index);
    }
  }

  void updateCifraForm(int index, CifraFormData Function(CifraFormData) updateFn) {
    if (index >= 0 && index < cifrasForms.length) {
      cifrasForms[index] = updateFn(cifrasForms[index]);
    }
  }

  void buildCifrasList() {
    cifrasList = cifrasForms.map((form) {
      return HabitanteCardStruct(
        titulo: form.tituloController.text,
        descripcion: form.descripcionController.text,
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
    
    // Dispose all cifra forms
    for (var form in cifrasForms) {
      form.dispose();
    }
    cifrasForms.clear();
  }
}

