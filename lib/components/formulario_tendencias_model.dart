import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'formulario_tendencias_widget.dart' show FormularioTendenciasWidget;
import 'package:flutter/material.dart';

// FFUploadedFile is needed for SenaleFormData

// Clase para representar un impacto individual (párrafo)
class ImpactoFormData {
  final TextEditingController controller;
  final FocusNode focusNode;

  ImpactoFormData({
    TextEditingController? controller,
    FocusNode? focusNode,
  })  : controller = controller ?? TextEditingController(),
        focusNode = focusNode ?? FocusNode();

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  ImpactoFormData copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    return ImpactoFormData(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
    );
  }
}

// Clase para representar un formulario de señal individual
class SenaleFormData {
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final TextEditingController textoEnlaceController;
  final FocusNode textoEnlaceFocusNode;
  final FFUploadedFile? uploadedImage;
  final String? imageUrl;
  final bool isUploadingImage;

  SenaleFormData({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? textoEnlaceController,
    FocusNode? textoEnlaceFocusNode,
    this.uploadedImage,
    this.imageUrl,
    this.isUploadingImage = false,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        textoEnlaceController = textoEnlaceController ?? TextEditingController(),
        textoEnlaceFocusNode = textoEnlaceFocusNode ?? FocusNode();

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    textoEnlaceController.dispose();
    textoEnlaceFocusNode.dispose();
  }

  SenaleFormData copyWith({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? textoEnlaceController,
    FocusNode? textoEnlaceFocusNode,
    FFUploadedFile? uploadedImage,
    String? imageUrl,
    bool? isUploadingImage,
  }) {
    return SenaleFormData(
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      textoEnlaceController: textoEnlaceController ?? this.textoEnlaceController,
      textoEnlaceFocusNode: textoEnlaceFocusNode ?? this.textoEnlaceFocusNode,
      uploadedImage: uploadedImage ?? this.uploadedImage,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
    );
  }
}

// Clase para representar un formulario de tendencia individual
class TendenciaFormData {
  // ID temporal único para identificar esta tendencia antes de guardarla
  final String tempId;
  
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController subtituloController;
  final FocusNode subtituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final TextEditingController subtituloCardController;
  final FocusNode subtituloCardFocusNode;
  final String? probabilidad; // Cambiado a String para dropdown
  final FFUploadedFile? uploadedImagenPortada;
  final String? imagenPortadaUrl;
  
  // Lista de impactos (párrafos)
  final List<ImpactoFormData> impactosForms;
  
  // Lista de señales
  final List<SenaleFormData> senalesForms;

  TendenciaFormData({
    String? tempId,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? subtituloCardController,
    FocusNode? subtituloCardFocusNode,
    String? probabilidad,
    FFUploadedFile? uploadedImagenPortada,
    String? imagenPortadaUrl,
    List<ImpactoFormData>? impactosForms,
    List<SenaleFormData>? senalesForms,
  })  : tempId = tempId ?? 'temp_tendencia_${DateTime.now().millisecondsSinceEpoch}',
        tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        subtituloController = subtituloController ?? TextEditingController(),
        subtituloFocusNode = subtituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        subtituloCardController = subtituloCardController ?? TextEditingController(),
        subtituloCardFocusNode = subtituloCardFocusNode ?? FocusNode(),
        probabilidad = probabilidad,
        uploadedImagenPortada = uploadedImagenPortada,
        imagenPortadaUrl = imagenPortadaUrl,
        impactosForms = impactosForms ?? [],
        senalesForms = senalesForms ?? [];

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    subtituloController.dispose();
    subtituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    subtituloCardController.dispose();
    subtituloCardFocusNode.dispose();
    
    // Dispose all impactos
    for (var impacto in impactosForms) {
      impacto.dispose();
    }
    
    // Dispose all senales
    for (var senale in senalesForms) {
      senale.dispose();
    }
  }

  TendenciaFormData copyWith({
    String? tempId,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? subtituloCardController,
    FocusNode? subtituloCardFocusNode,
    String? probabilidad,
    FFUploadedFile? uploadedImagenPortada,
    String? imagenPortadaUrl,
    List<ImpactoFormData>? impactosForms,
    List<SenaleFormData>? senalesForms,
  }) {
    return TendenciaFormData(
      tempId: tempId ?? this.tempId,
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      subtituloController: subtituloController ?? this.subtituloController,
      subtituloFocusNode: subtituloFocusNode ?? this.subtituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      subtituloCardController: subtituloCardController ?? this.subtituloCardController,
      subtituloCardFocusNode: subtituloCardFocusNode ?? this.subtituloCardFocusNode,
      probabilidad: probabilidad ?? this.probabilidad,
      uploadedImagenPortada: uploadedImagenPortada ?? this.uploadedImagenPortada,
      imagenPortadaUrl: imagenPortadaUrl ?? this.imagenPortadaUrl,
      impactosForms: impactosForms ?? this.impactosForms,
      senalesForms: senalesForms ?? this.senalesForms,
    );
  }
}

class FormularioTendenciasModel extends FlutterFlowModel<FormularioTendenciasWidget> {
  ///  Local state fields for this component.

  // Lista de formularios de tendencias (máximo 5)
  List<TendenciaFormData> tendenciasForms = [];

  // Datos finales que se guardarán en Firestore
  List<TendenciasListStruct> tendenciasList = [];

  void addTendenciaForm() {
    tendenciasForms.add(TendenciaFormData());
  }

  void removeTendenciaForm(int index) {
    if (index >= 0 && index < tendenciasForms.length) {
      tendenciasForms[index].dispose();
      tendenciasForms.removeAt(index);
    }
  }

  void updateTendenciaForm(int index, TendenciaFormData Function(TendenciaFormData) updateFn) {
    if (index >= 0 && index < tendenciasForms.length) {
      tendenciasForms[index] = updateFn(tendenciasForms[index]);
    }
  }

  void addImpactoForm(int tendenciaIndex) {
    if (tendenciaIndex >= 0 && tendenciaIndex < tendenciasForms.length) {
      final form = tendenciasForms[tendenciaIndex];
      final newImpactos = List<ImpactoFormData>.from(form.impactosForms);
      newImpactos.add(ImpactoFormData());
        updateTendenciaForm(tendenciaIndex, (f) => TendenciaFormData(
        tempId: f.tempId,
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        subtituloCardController: f.subtituloCardController,
        subtituloCardFocusNode: f.subtituloCardFocusNode,
        probabilidad: f.probabilidad,
        uploadedImagenPortada: f.uploadedImagenPortada,
        imagenPortadaUrl: f.imagenPortadaUrl,
        impactosForms: newImpactos,
        senalesForms: f.senalesForms,
      ));
    }
  }

  void removeImpactoForm(int tendenciaIndex, int impactoIndex) {
    if (tendenciaIndex >= 0 && tendenciaIndex < tendenciasForms.length) {
      final form = tendenciasForms[tendenciaIndex];
      if (impactoIndex >= 0 && impactoIndex < form.impactosForms.length) {
        form.impactosForms[impactoIndex].dispose();
        final newImpactos = List<ImpactoFormData>.from(form.impactosForms);
        newImpactos.removeAt(impactoIndex);
        updateTendenciaForm(tendenciaIndex, (f) => TendenciaFormData(
        tempId: f.tempId,
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        subtituloCardController: f.subtituloCardController,
        subtituloCardFocusNode: f.subtituloCardFocusNode,
        probabilidad: f.probabilidad,
        uploadedImagenPortada: f.uploadedImagenPortada,
        imagenPortadaUrl: f.imagenPortadaUrl,
        impactosForms: newImpactos,
        senalesForms: f.senalesForms,
      ));
      }
    }
  }

  void addSenaleForm(int tendenciaIndex) {
    if (tendenciaIndex >= 0 && tendenciaIndex < tendenciasForms.length) {
      final form = tendenciasForms[tendenciaIndex];
      final newSenales = List<SenaleFormData>.from(form.senalesForms);
      newSenales.add(SenaleFormData());
      updateTendenciaForm(tendenciaIndex, (f) => TendenciaFormData(
        tempId: f.tempId,
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        subtituloCardController: f.subtituloCardController,
        subtituloCardFocusNode: f.subtituloCardFocusNode,
        probabilidad: f.probabilidad,
        uploadedImagenPortada: f.uploadedImagenPortada,
        imagenPortadaUrl: f.imagenPortadaUrl,
        impactosForms: f.impactosForms,
        senalesForms: newSenales,
      ));
    }
  }

  void removeSenaleForm(int tendenciaIndex, int senaleIndex) {
    if (tendenciaIndex >= 0 && tendenciaIndex < tendenciasForms.length) {
      final form = tendenciasForms[tendenciaIndex];
      if (senaleIndex >= 0 && senaleIndex < form.senalesForms.length) {
        form.senalesForms[senaleIndex].dispose();
        final newSenales = List<SenaleFormData>.from(form.senalesForms);
        newSenales.removeAt(senaleIndex);
        updateTendenciaForm(tendenciaIndex, (f) => TendenciaFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          probabilidad: f.probabilidad,
          uploadedImagenPortada: f.uploadedImagenPortada,
          imagenPortadaUrl: f.imagenPortadaUrl,
          impactosForms: f.impactosForms,
          senalesForms: newSenales,
        ));
      }
    }
  }

  void updateSenaleForm(int tendenciaIndex, int senaleIndex, SenaleFormData Function(SenaleFormData) updateFn) {
    if (tendenciaIndex >= 0 && tendenciaIndex < tendenciasForms.length) {
      final form = tendenciasForms[tendenciaIndex];
      if (senaleIndex >= 0 && senaleIndex < form.senalesForms.length) {
        final newSenales = List<SenaleFormData>.from(form.senalesForms);
        newSenales[senaleIndex] = updateFn(newSenales[senaleIndex]);
        updateTendenciaForm(tendenciaIndex, (f) => TendenciaFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          probabilidad: f.probabilidad,
          uploadedImagenPortada: f.uploadedImagenPortada,
          imagenPortadaUrl: f.imagenPortadaUrl,
          impactosForms: f.impactosForms,
          senalesForms: newSenales,
        ));
      }
    }
  }

  void buildTendenciasList() {
    tendenciasList = tendenciasForms.map((form) {
      // Convertir impactos a lista de strings
      final impactosStrings = form.impactosForms
          .map((impacto) => impacto.controller.text.trim())
          .where((text) => text.isNotEmpty)
          .toList();

      // Convertir señales - solo tomar la primera si el esquema solo acepta una
      // Si hay múltiples, guardamos la primera
      SenalesStruct? senalesStruct;
      if (form.senalesForms.isNotEmpty) {
        final primeraSenale = form.senalesForms.first;
        if (primeraSenale.imageUrl != null ||
            primeraSenale.tituloController.text.isNotEmpty ||
            primeraSenale.descripcionController.text.isNotEmpty ||
            primeraSenale.textoEnlaceController.text.isNotEmpty) {
          senalesStruct = SenalesStruct(
            imagen: primeraSenale.imageUrl ?? '',
            titulo: primeraSenale.tituloController.text,
            descripcion: primeraSenale.descripcionController.text,
            textoEnlace: primeraSenale.textoEnlaceController.text,
          );
        }
      }

      return TendenciasListStruct(
        titulo: form.tituloController.text,
        subtitulo: form.subtituloController.text,
        descripcion: form.descripcionController.text,
        probabilidad: form.probabilidad ?? '',
        imagenPortada: form.imagenPortadaUrl ?? '',
        subtituloCard: form.subtituloCardController.text,
        impactos: impactosStrings,
        senales: senalesStruct,
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
    
    // Dispose all tendencia forms
    for (var form in tendenciasForms) {
      form.dispose();
    }
    tendenciasForms.clear();
  }
}
