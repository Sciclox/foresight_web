import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'formulario_escenarios_widget.dart' show FormularioEscenariosWidget;
import 'package:flutter/material.dart';

// Clase para representar un habitante de escenario
class EscenarioHabitanteFormData {
  final TextEditingController audioController;
  final FocusNode audioFocusNode;
  final TextEditingController imagenController;
  final FocusNode imagenFocusNode;
  final TextEditingController nombreController;
  final FocusNode nombreFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final FFUploadedFile? uploadedAudio;
  final String? audioUrl;
  final bool isUploadingAudio;
  final FFUploadedFile? uploadedImage;
  final String? imageUrl;
  final bool isUploadingImage;

  EscenarioHabitanteFormData({
    TextEditingController? audioController,
    FocusNode? audioFocusNode,
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    TextEditingController? nombreController,
    FocusNode? nombreFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    this.uploadedAudio,
    this.audioUrl,
    this.isUploadingAudio = false,
    this.uploadedImage,
    this.imageUrl,
    this.isUploadingImage = false,
  })  : audioController = audioController ?? TextEditingController(),
        audioFocusNode = audioFocusNode ?? FocusNode(),
        imagenController = imagenController ?? TextEditingController(),
        imagenFocusNode = imagenFocusNode ?? FocusNode(),
        nombreController = nombreController ?? TextEditingController(),
        nombreFocusNode = nombreFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode();

  void dispose() {
    audioController.dispose();
    audioFocusNode.dispose();
    imagenController.dispose();
    imagenFocusNode.dispose();
    nombreController.dispose();
    nombreFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
  }

  EscenarioHabitanteFormData copyWith({
    TextEditingController? audioController,
    FocusNode? audioFocusNode,
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    TextEditingController? nombreController,
    FocusNode? nombreFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    FFUploadedFile? uploadedAudio,
    String? audioUrl,
    bool? isUploadingAudio,
    FFUploadedFile? uploadedImage,
    String? imageUrl,
    bool? isUploadingImage,
  }) {
    return EscenarioHabitanteFormData(
      audioController: audioController ?? this.audioController,
      audioFocusNode: audioFocusNode ?? this.audioFocusNode,
      imagenController: imagenController ?? this.imagenController,
      imagenFocusNode: imagenFocusNode ?? this.imagenFocusNode,
      nombreController: nombreController ?? this.nombreController,
      nombreFocusNode: nombreFocusNode ?? this.nombreFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      uploadedAudio: uploadedAudio ?? this.uploadedAudio,
      audioUrl: audioUrl ?? this.audioUrl,
      isUploadingAudio: isUploadingAudio ?? this.isUploadingAudio,
      uploadedImage: uploadedImage ?? this.uploadedImage,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
    );
  }
}

// Clase para representar una card de escenario
class EscenarioCardFormData {
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final TextEditingController fuenteController;
  final FocusNode fuenteFocusNode;

  EscenarioCardFormData({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? fuenteController,
    FocusNode? fuenteFocusNode,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        fuenteController = fuenteController ?? TextEditingController(),
        fuenteFocusNode = fuenteFocusNode ?? FocusNode();

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    fuenteController.dispose();
    fuenteFocusNode.dispose();
  }

  EscenarioCardFormData copyWith({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    TextEditingController? fuenteController,
    FocusNode? fuenteFocusNode,
  }) {
    return EscenarioCardFormData(
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      fuenteController: fuenteController ?? this.fuenteController,
      fuenteFocusNode: fuenteFocusNode ?? this.fuenteFocusNode,
    );
  }
}

// Clase para representar una manifestación
class EscenarioManifestacionFormData {
  final TextEditingController imagenController;
  final FocusNode imagenFocusNode;
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final FFUploadedFile? uploadedImage;
  final String? imageUrl;
  final bool isUploadingImage;

  EscenarioManifestacionFormData({
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    this.uploadedImage,
    this.imageUrl,
    this.isUploadingImage = false,
  })  : imagenController = imagenController ?? TextEditingController(),
        imagenFocusNode = imagenFocusNode ?? FocusNode(),
        tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode();

  void dispose() {
    imagenController.dispose();
    imagenFocusNode.dispose();
    tituloController.dispose();
    tituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
  }

  EscenarioManifestacionFormData copyWith({
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    FFUploadedFile? uploadedImage,
    String? imageUrl,
    bool? isUploadingImage,
  }) {
    return EscenarioManifestacionFormData(
      imagenController: imagenController ?? this.imagenController,
      imagenFocusNode: imagenFocusNode ?? this.imagenFocusNode,
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      uploadedImage: uploadedImage ?? this.uploadedImage,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
    );
  }
}

// Clase para representar una capacidad individual (párrafo)
class CapacidadFormData {
  final TextEditingController textoController;
  final FocusNode textoFocusNode;

  CapacidadFormData({
    TextEditingController? textoController,
    FocusNode? textoFocusNode,
  })  : textoController = textoController ?? TextEditingController(),
        textoFocusNode = textoFocusNode ?? FocusNode();

  void dispose() {
    textoController.dispose();
    textoFocusNode.dispose();
  }

  CapacidadFormData copyWith({
    TextEditingController? textoController,
    FocusNode? textoFocusNode,
  }) {
    return CapacidadFormData(
      textoController: textoController ?? this.textoController,
      textoFocusNode: textoFocusNode ?? this.textoFocusNode,
    );
  }
}

// Clase para representar una iniciativa
class EscenarioIniciativaFormData {
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  final List<CapacidadFormData> capacidadesForms;
  final TextEditingController imagenController;
  final FocusNode imagenFocusNode;
  final FFUploadedFile? uploadedImage;
  final String? imageUrl;
  final bool isUploadingImage;

  EscenarioIniciativaFormData({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    List<CapacidadFormData>? capacidadesForms,
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    this.uploadedImage,
    this.imageUrl,
    this.isUploadingImage = false,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        capacidadesForms = capacidadesForms ?? [],
        imagenController = imagenController ?? TextEditingController(),
        imagenFocusNode = imagenFocusNode ?? FocusNode();

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    imagenController.dispose();
    imagenFocusNode.dispose();
    for (var capacidad in capacidadesForms) {
      capacidad.dispose();
    }
  }

  EscenarioIniciativaFormData copyWith({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    List<CapacidadFormData>? capacidadesForms,
    TextEditingController? imagenController,
    FocusNode? imagenFocusNode,
    FFUploadedFile? uploadedImage,
    String? imageUrl,
    bool? isUploadingImage,
  }) {
    return EscenarioIniciativaFormData(
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      capacidadesForms: capacidadesForms ?? this.capacidadesForms,
      imagenController: imagenController ?? this.imagenController,
      imagenFocusNode: imagenFocusNode ?? this.imagenFocusNode,
      uploadedImage: uploadedImage ?? this.uploadedImage,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
    );
  }
}

// Clase para representar un formulario de escenario individual
class EscenarioFormData {
  final TextEditingController tituloController;
  final FocusNode tituloFocusNode;
  final TextEditingController subtituloController;
  final FocusNode subtituloFocusNode;
  final TextEditingController descripcionController;
  final FocusNode descripcionFocusNode;
  
  // Imagen principal
  final FFUploadedFile? uploadedImagenPrincipal;
  final String? imagenPrincipalUrl;
  final bool isUploadingImagenPrincipal;
  
  // Imágenes secundarias
  final List<String> imagenSecundariasUrls;
  final List<FFUploadedFile> uploadedImagenesSecundarias;
  
  // Listas de formularios
  final List<EscenarioHabitanteFormData> habitantesForms;
  final List<EscenarioCardFormData> cardsForms;
  final List<EscenarioManifestacionFormData> manifestacionesForms;
  final List<EscenarioIniciativaFormData> iniciativasForms;
  
  // Tendencias originales (DocumentReferences de tendencias seleccionadas, máximo 3)
  final List<DocumentReference> tendenciasOrigina;

  EscenarioFormData({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    this.uploadedImagenPrincipal,
    this.imagenPrincipalUrl,
    this.isUploadingImagenPrincipal = false,
    List<String>? imagenSecundariasUrls,
    List<FFUploadedFile>? uploadedImagenesSecundarias,
    List<EscenarioHabitanteFormData>? habitantesForms,
    List<EscenarioCardFormData>? cardsForms,
    List<EscenarioManifestacionFormData>? manifestacionesForms,
    List<EscenarioIniciativaFormData>? iniciativasForms,
    List<DocumentReference>? tendenciasOrigina,
  })  : tituloController = tituloController ?? TextEditingController(),
        tituloFocusNode = tituloFocusNode ?? FocusNode(),
        subtituloController = subtituloController ?? TextEditingController(),
        subtituloFocusNode = subtituloFocusNode ?? FocusNode(),
        descripcionController = descripcionController ?? TextEditingController(),
        descripcionFocusNode = descripcionFocusNode ?? FocusNode(),
        imagenSecundariasUrls = imagenSecundariasUrls ?? [],
        uploadedImagenesSecundarias = uploadedImagenesSecundarias ?? [],
        habitantesForms = habitantesForms ?? [],
        cardsForms = cardsForms ?? [],
        manifestacionesForms = manifestacionesForms ?? [],
        iniciativasForms = iniciativasForms ?? [],
        tendenciasOrigina = tendenciasOrigina ?? [];

  void dispose() {
    tituloController.dispose();
    tituloFocusNode.dispose();
    subtituloController.dispose();
    subtituloFocusNode.dispose();
    descripcionController.dispose();
    descripcionFocusNode.dispose();
    
    for (var habitante in habitantesForms) {
      habitante.dispose();
    }
    for (var card in cardsForms) {
      card.dispose();
    }
    for (var manifestacion in manifestacionesForms) {
      manifestacion.dispose();
    }
    for (var iniciativa in iniciativasForms) {
      iniciativa.dispose();
    }
  }

  EscenarioFormData copyWith({
    TextEditingController? tituloController,
    FocusNode? tituloFocusNode,
    TextEditingController? subtituloController,
    FocusNode? subtituloFocusNode,
    TextEditingController? descripcionController,
    FocusNode? descripcionFocusNode,
    FFUploadedFile? uploadedImagenPrincipal,
    String? imagenPrincipalUrl,
    bool? isUploadingImagenPrincipal,
    List<String>? imagenSecundariasUrls,
    List<FFUploadedFile>? uploadedImagenesSecundarias,
    List<EscenarioHabitanteFormData>? habitantesForms,
    List<EscenarioCardFormData>? cardsForms,
    List<EscenarioManifestacionFormData>? manifestacionesForms,
    List<EscenarioIniciativaFormData>? iniciativasForms,
    List<DocumentReference>? tendenciasOrigina,
  }) {
    return EscenarioFormData(
      tituloController: tituloController ?? this.tituloController,
      tituloFocusNode: tituloFocusNode ?? this.tituloFocusNode,
      subtituloController: subtituloController ?? this.subtituloController,
      subtituloFocusNode: subtituloFocusNode ?? this.subtituloFocusNode,
      descripcionController: descripcionController ?? this.descripcionController,
      descripcionFocusNode: descripcionFocusNode ?? this.descripcionFocusNode,
      uploadedImagenPrincipal: uploadedImagenPrincipal ?? this.uploadedImagenPrincipal,
      imagenPrincipalUrl: imagenPrincipalUrl ?? this.imagenPrincipalUrl,
      isUploadingImagenPrincipal: isUploadingImagenPrincipal ?? this.isUploadingImagenPrincipal,
      imagenSecundariasUrls: imagenSecundariasUrls ?? this.imagenSecundariasUrls,
      uploadedImagenesSecundarias: uploadedImagenesSecundarias ?? this.uploadedImagenesSecundarias,
      habitantesForms: habitantesForms ?? this.habitantesForms,
      cardsForms: cardsForms ?? this.cardsForms,
      manifestacionesForms: manifestacionesForms ?? this.manifestacionesForms,
      iniciativasForms: iniciativasForms ?? this.iniciativasForms,
      tendenciasOrigina: tendenciasOrigina ?? this.tendenciasOrigina,
    );
  }
}

class FormularioEscenariosModel extends FlutterFlowModel<FormularioEscenariosWidget> {
  ///  Local state fields for this component.

  // Lista de formularios de escenarios (máximo 5)
  List<EscenarioFormData> escenariosForms = [];

  // Datos finales que se guardarán en Firestore
  List<EscenariosListStruct> escenariosList = [];

  void addEscenarioForm() {
    if (escenariosForms.length < 5) {
      escenariosForms.add(EscenarioFormData());
    }
  }

  void removeEscenarioForm(int index) {
    if (index >= 0 && index < escenariosForms.length) {
      escenariosForms[index].dispose();
      escenariosForms.removeAt(index);
    }
  }

  void updateEscenarioForm(int index, EscenarioFormData Function(EscenarioFormData) updateFn) {
    if (index >= 0 && index < escenariosForms.length) {
      escenariosForms[index] = updateFn(escenariosForms[index]);
    }
  }

  // Métodos para manejar habitantes
  void addHabitanteForm(int escenarioIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      final newHabitantes = List<EscenarioHabitanteFormData>.from(form.habitantesForms);
      newHabitantes.add(EscenarioHabitanteFormData());
      updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        uploadedImagenPrincipal: f.uploadedImagenPrincipal,
        imagenPrincipalUrl: f.imagenPrincipalUrl,
        isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
        imagenSecundariasUrls: f.imagenSecundariasUrls,
        uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
        habitantesForms: newHabitantes,
        cardsForms: f.cardsForms,
        manifestacionesForms: f.manifestacionesForms,
        iniciativasForms: f.iniciativasForms,
      ));
    }
  }

  void removeHabitanteForm(int escenarioIndex, int habitanteIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (habitanteIndex >= 0 && habitanteIndex < form.habitantesForms.length) {
        form.habitantesForms[habitanteIndex].dispose();
        final newHabitantes = List<EscenarioHabitanteFormData>.from(form.habitantesForms);
        newHabitantes.removeAt(habitanteIndex);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: newHabitantes,
          cardsForms: f.cardsForms,
          manifestacionesForms: f.manifestacionesForms,
          iniciativasForms: f.iniciativasForms,
        ));
      }
    }
  }

  void updateHabitanteForm(int escenarioIndex, int habitanteIndex, EscenarioHabitanteFormData Function(EscenarioHabitanteFormData) updateFn) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (habitanteIndex >= 0 && habitanteIndex < form.habitantesForms.length) {
        final newHabitantes = List<EscenarioHabitanteFormData>.from(form.habitantesForms);
        newHabitantes[habitanteIndex] = updateFn(newHabitantes[habitanteIndex]);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: newHabitantes,
          cardsForms: f.cardsForms,
          manifestacionesForms: f.manifestacionesForms,
          iniciativasForms: f.iniciativasForms,
        ));
      }
    }
  }

  // Métodos para manejar cards
  void addCardForm(int escenarioIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      final newCards = List<EscenarioCardFormData>.from(form.cardsForms);
      newCards.add(EscenarioCardFormData());
      updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        uploadedImagenPrincipal: f.uploadedImagenPrincipal,
        imagenPrincipalUrl: f.imagenPrincipalUrl,
        isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
        imagenSecundariasUrls: f.imagenSecundariasUrls,
        uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
        habitantesForms: f.habitantesForms,
        cardsForms: newCards,
        manifestacionesForms: f.manifestacionesForms,
        iniciativasForms: f.iniciativasForms,
      ));
    }
  }

  void removeCardForm(int escenarioIndex, int cardIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (cardIndex >= 0 && cardIndex < form.cardsForms.length) {
        form.cardsForms[cardIndex].dispose();
        final newCards = List<EscenarioCardFormData>.from(form.cardsForms);
        newCards.removeAt(cardIndex);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: f.habitantesForms,
          cardsForms: newCards,
          manifestacionesForms: f.manifestacionesForms,
          iniciativasForms: f.iniciativasForms,
        ));
      }
    }
  }

  // Métodos para manejar manifestaciones
  void addManifestacionForm(int escenarioIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      final newManifestaciones = List<EscenarioManifestacionFormData>.from(form.manifestacionesForms);
      newManifestaciones.add(EscenarioManifestacionFormData());
      updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        uploadedImagenPrincipal: f.uploadedImagenPrincipal,
        imagenPrincipalUrl: f.imagenPrincipalUrl,
        isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
        imagenSecundariasUrls: f.imagenSecundariasUrls,
        uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
        habitantesForms: f.habitantesForms,
        cardsForms: f.cardsForms,
        manifestacionesForms: newManifestaciones,
        iniciativasForms: f.iniciativasForms,
      ));
    }
  }

  void removeManifestacionForm(int escenarioIndex, int manifestacionIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (manifestacionIndex >= 0 && manifestacionIndex < form.manifestacionesForms.length) {
        form.manifestacionesForms[manifestacionIndex].dispose();
        final newManifestaciones = List<EscenarioManifestacionFormData>.from(form.manifestacionesForms);
        newManifestaciones.removeAt(manifestacionIndex);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: f.habitantesForms,
          cardsForms: f.cardsForms,
          manifestacionesForms: newManifestaciones,
          iniciativasForms: f.iniciativasForms,
        ));
      }
    }
  }

  void updateManifestacionForm(int escenarioIndex, int manifestacionIndex, EscenarioManifestacionFormData Function(EscenarioManifestacionFormData) updateFn) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (manifestacionIndex >= 0 && manifestacionIndex < form.manifestacionesForms.length) {
        final newManifestaciones = List<EscenarioManifestacionFormData>.from(form.manifestacionesForms);
        newManifestaciones[manifestacionIndex] = updateFn(newManifestaciones[manifestacionIndex]);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: f.habitantesForms,
          cardsForms: f.cardsForms,
          manifestacionesForms: newManifestaciones,
          iniciativasForms: f.iniciativasForms,
        ));
      }
    }
  }

  // Métodos para manejar iniciativas
  void addIniciativaForm(int escenarioIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      final newIniciativas = List<EscenarioIniciativaFormData>.from(form.iniciativasForms);
      newIniciativas.add(EscenarioIniciativaFormData());
      updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
        tituloController: f.tituloController,
        tituloFocusNode: f.tituloFocusNode,
        subtituloController: f.subtituloController,
        subtituloFocusNode: f.subtituloFocusNode,
        descripcionController: f.descripcionController,
        descripcionFocusNode: f.descripcionFocusNode,
        uploadedImagenPrincipal: f.uploadedImagenPrincipal,
        imagenPrincipalUrl: f.imagenPrincipalUrl,
        isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
        imagenSecundariasUrls: f.imagenSecundariasUrls,
        uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
        habitantesForms: f.habitantesForms,
        cardsForms: f.cardsForms,
        manifestacionesForms: f.manifestacionesForms,
        iniciativasForms: newIniciativas,
      ));
    }
  }

  void removeIniciativaForm(int escenarioIndex, int iniciativaIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (iniciativaIndex >= 0 && iniciativaIndex < form.iniciativasForms.length) {
        form.iniciativasForms[iniciativaIndex].dispose();
        final newIniciativas = List<EscenarioIniciativaFormData>.from(form.iniciativasForms);
        newIniciativas.removeAt(iniciativaIndex);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: f.habitantesForms,
          cardsForms: f.cardsForms,
          manifestacionesForms: f.manifestacionesForms,
          iniciativasForms: newIniciativas,
        ));
      }
    }
  }

  void updateIniciativaForm(int escenarioIndex, int iniciativaIndex, EscenarioIniciativaFormData Function(EscenarioIniciativaFormData) updateFn) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (iniciativaIndex >= 0 && iniciativaIndex < form.iniciativasForms.length) {
        final newIniciativas = List<EscenarioIniciativaFormData>.from(form.iniciativasForms);
        newIniciativas[iniciativaIndex] = updateFn(newIniciativas[iniciativaIndex]);
        updateEscenarioForm(escenarioIndex, (f) => EscenarioFormData(
          tituloController: f.tituloController,
          tituloFocusNode: f.tituloFocusNode,
          subtituloController: f.subtituloController,
          subtituloFocusNode: f.subtituloFocusNode,
          descripcionController: f.descripcionController,
          descripcionFocusNode: f.descripcionFocusNode,
          uploadedImagenPrincipal: f.uploadedImagenPrincipal,
          imagenPrincipalUrl: f.imagenPrincipalUrl,
          isUploadingImagenPrincipal: f.isUploadingImagenPrincipal,
          imagenSecundariasUrls: f.imagenSecundariasUrls,
          uploadedImagenesSecundarias: f.uploadedImagenesSecundarias,
          habitantesForms: f.habitantesForms,
          cardsForms: f.cardsForms,
          manifestacionesForms: f.manifestacionesForms,
          iniciativasForms: newIniciativas,
        ));
      }
    }
  }

  // Métodos para manejar capacidades dentro de iniciativas
  void addCapacidadForm(int escenarioIndex, int iniciativaIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (iniciativaIndex >= 0 && iniciativaIndex < form.iniciativasForms.length) {
        final iniciativa = form.iniciativasForms[iniciativaIndex];
        final newCapacidades = List<CapacidadFormData>.from(iniciativa.capacidadesForms);
        newCapacidades.add(CapacidadFormData());
        updateIniciativaForm(escenarioIndex, iniciativaIndex, (i) => EscenarioIniciativaFormData(
          tituloController: i.tituloController,
          tituloFocusNode: i.tituloFocusNode,
          descripcionController: i.descripcionController,
          descripcionFocusNode: i.descripcionFocusNode,
          capacidadesForms: newCapacidades,
          imagenController: i.imagenController,
          imagenFocusNode: i.imagenFocusNode,
          uploadedImage: i.uploadedImage,
          imageUrl: i.imageUrl,
          isUploadingImage: i.isUploadingImage,
        ));
      }
    }
  }

  void removeCapacidadForm(int escenarioIndex, int iniciativaIndex, int capacidadIndex) {
    if (escenarioIndex >= 0 && escenarioIndex < escenariosForms.length) {
      final form = escenariosForms[escenarioIndex];
      if (iniciativaIndex >= 0 && iniciativaIndex < form.iniciativasForms.length) {
        final iniciativa = form.iniciativasForms[iniciativaIndex];
        if (capacidadIndex >= 0 && capacidadIndex < iniciativa.capacidadesForms.length) {
          iniciativa.capacidadesForms[capacidadIndex].dispose();
          final newCapacidades = List<CapacidadFormData>.from(iniciativa.capacidadesForms);
          newCapacidades.removeAt(capacidadIndex);
          updateIniciativaForm(escenarioIndex, iniciativaIndex, (i) => EscenarioIniciativaFormData(
            tituloController: i.tituloController,
            tituloFocusNode: i.tituloFocusNode,
            descripcionController: i.descripcionController,
            descripcionFocusNode: i.descripcionFocusNode,
            capacidadesForms: newCapacidades,
            imagenController: i.imagenController,
            imagenFocusNode: i.imagenFocusNode,
            uploadedImage: i.uploadedImage,
            imageUrl: i.imageUrl,
            isUploadingImage: i.isUploadingImage,
          ));
        }
      }
    }
  }

  void buildEscenariosList() {
    escenariosList = escenariosForms.map((form) {
      // Descripción es String

      // Convertir habitantes
      final habitantesStructs = form.habitantesForms.map((h) {
        double? nombreDouble;
        try {
          nombreDouble = double.tryParse(h.nombreController.text);
        } catch (e) {
          nombreDouble = null;
        }
        return EscenarioHabitantesStruct(
          audio: h.audioUrl ?? '',
          imagen: h.imageUrl ?? '',
          nombre: nombreDouble,
          descripcion: h.descripcionController.text,
        );
      }).toList();

      // Convertir cards
      final cardsStructs = form.cardsForms.map((c) {
        return EscenarioCardDataStruct(
          titulo: c.tituloController.text,
          descripcion: c.descripcionController.text,
          fuente: c.fuenteController.text,
        );
      }).toList();

      // Convertir manifestaciones
      final manifestacionesStructs = form.manifestacionesForms.map((m) {
        return EscenarioCardManifestacionStruct(
          imagen: m.imageUrl ?? '',
          titulo: m.tituloController.text,
          descripcion: m.descripcionController.text,
        );
      }).toList();

      // Convertir iniciativas
      final iniciativasStructs = form.iniciativasForms.map((i) {
        return IniciativaCardStruct(
          titulo: i.tituloController.text,
          descripcion: i.descripcionController.text,
          capacidades: i.capacidadesForms.map((c) => c.textoController.text).toList(),
          imagen: i.imageUrl ?? '',
        );
      }).toList();

      return EscenariosListStruct(
        titulo: form.tituloController.text,
        subtitulo: form.subtituloController.text,
        descripcion: double.tryParse(form.descripcionController.text) ?? 0.0, // Mantener como double para compatibilidad con struct
        imagenPrincipal: form.imagenPrincipalUrl ?? '',
        imagenSecundarias: form.imagenSecundariasUrls,
        habitantes: habitantesStructs.isNotEmpty ? habitantesStructs : null,
        cards: cardsStructs.isNotEmpty ? cardsStructs : null,
        manifestaciones: manifestacionesStructs.isNotEmpty ? manifestacionesStructs : null,
        iniciativas: iniciativasStructs.isNotEmpty ? iniciativasStructs : null,
        tendenciasOrigina: form.tendenciasOrigina.isNotEmpty ? form.tendenciasOrigina : null,
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

  // Referencia opcional a las tendencias disponibles (DocumentReferences desde Firestore)
  // Esta se establecerá desde el widget padre para permitir seleccionar tendencias
  List<DocumentReference> Function()? getTendenciasDisponibles;
  
  // Cache de tendencias cargadas para evitar recargar en cada reconstrucción
  List<TendenciasRecord>? _tendenciasCachedData;
  bool _isLoadingTendencias = false;
  
  // Obtener tendencias cacheadas (null si aún no se han cargado)
  List<TendenciasRecord>? get tendenciasCachedData => _tendenciasCachedData;
  
  // Verificar si se están cargando las tendencias
  bool get isLoadingTendencias => _isLoadingTendencias;
  
  // Inicializar y cargar tendencias una sola vez
  void initializeTendencias() {
    // Si ya están cargadas o se están cargando, no hacer nada
    if (_tendenciasCachedData != null || _isLoadingTendencias) {
      return;
    }
    
    // Obtener referencias
    final tendenciasDisponibles = getTendenciasDisponibles?.call() ?? [];
    if (tendenciasDisponibles.isEmpty) {
      _tendenciasCachedData = [];
      return;
    }
    
    // Marcar como cargando
    _isLoadingTendencias = true;
    
    // Forzar una notificación inicial para mostrar el loading
    onUpdate();
    
    // Cargar asíncronamente
    Future.wait(
      tendenciasDisponibles.map((ref) => TendenciasRecord.getDocumentOnce(ref))
    ).then((data) {
      _tendenciasCachedData = data;
      _isLoadingTendencias = false;
      // Notificar cambios para que el widget se reconstruya
      onUpdate();
    }).catchError((error) {
      print('Error al cargar tendencias: $error');
      _isLoadingTendencias = false;
      _tendenciasCachedData = [];
      onUpdate();
    });
  }
  
  // Limpiar el cache si es necesario recargar
  void clearTendenciasCache() {
    _tendenciasCachedData = null;
    _isLoadingTendencias = false;
  }
  
  // Método para establecer tendencias cargadas externamente (desde el widget padre)
  void setTendenciasCachedData(List<TendenciasRecord>? data) {
    _tendenciasCachedData = data;
    _isLoadingTendencias = false;
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
    
    // Dispose all escenario forms
    for (var form in escenariosForms) {
      form.dispose();
    }
    escenariosForms.clear();
  }
}

