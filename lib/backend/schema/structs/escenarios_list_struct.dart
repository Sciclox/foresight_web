// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EscenariosListStruct extends FFFirebaseStruct {
  EscenariosListStruct({
    String? titulo,
    String? subtitulo,
    double? descripcion,
    String? imagenPrincipal,
    List<String>? imagenSecundarias,
    List<EscenarioHabitantesStruct>? habitantes,
    List<EscenarioCardDataStruct>? cards,
    List<EscenarioCardManifestacionStruct>? manifestaciones,
    List<IniciativaCardStruct>? iniciativas,
    List<DocumentReference>? tendenciasOrigina,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _subtitulo = subtitulo,
        _descripcion = descripcion,
        _imagenPrincipal = imagenPrincipal,
        _imagenSecundarias = imagenSecundarias,
        _habitantes = habitantes,
        _cards = cards,
        _manifestaciones = manifestaciones,
        _iniciativas = iniciativas,
        _tendenciasOrigina = tendenciasOrigina,
        super(firestoreUtilData);

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "subtitulo" field.
  String? _subtitulo;
  String get subtitulo => _subtitulo ?? '';
  set subtitulo(String? val) => _subtitulo = val;

  bool hasSubtitulo() => _subtitulo != null;

  // "descripcion" field.
  double? _descripcion;
  double get descripcion => _descripcion ?? 0.0;
  set descripcion(double? val) => _descripcion = val;

  void incrementDescripcion(double amount) =>
      descripcion = descripcion + amount;

  bool hasDescripcion() => _descripcion != null;

  // "imagenPrincipal" field.
  String? _imagenPrincipal;
  String get imagenPrincipal => _imagenPrincipal ?? '';
  set imagenPrincipal(String? val) => _imagenPrincipal = val;

  bool hasImagenPrincipal() => _imagenPrincipal != null;

  // "imagenSecundarias" field.
  List<String>? _imagenSecundarias;
  List<String> get imagenSecundarias => _imagenSecundarias ?? const [];
  set imagenSecundarias(List<String>? val) => _imagenSecundarias = val;

  void updateImagenSecundarias(Function(List<String>) updateFn) {
    updateFn(_imagenSecundarias ??= []);
  }

  bool hasImagenSecundarias() => _imagenSecundarias != null;

  // "habitantes" field.
  List<EscenarioHabitantesStruct>? _habitantes;
  List<EscenarioHabitantesStruct> get habitantes => _habitantes ?? const [];
  set habitantes(List<EscenarioHabitantesStruct>? val) => _habitantes = val;

  void updateHabitantes(Function(List<EscenarioHabitantesStruct>) updateFn) {
    updateFn(_habitantes ??= []);
  }

  bool hasHabitantes() => _habitantes != null;

  // "cards" field.
  List<EscenarioCardDataStruct>? _cards;
  List<EscenarioCardDataStruct> get cards => _cards ?? const [];
  set cards(List<EscenarioCardDataStruct>? val) => _cards = val;

  void updateCards(Function(List<EscenarioCardDataStruct>) updateFn) {
    updateFn(_cards ??= []);
  }

  bool hasCards() => _cards != null;

  // "manifestaciones" field.
  List<EscenarioCardManifestacionStruct>? _manifestaciones;
  List<EscenarioCardManifestacionStruct> get manifestaciones =>
      _manifestaciones ?? const [];
  set manifestaciones(List<EscenarioCardManifestacionStruct>? val) =>
      _manifestaciones = val;

  void updateManifestaciones(
      Function(List<EscenarioCardManifestacionStruct>) updateFn) {
    updateFn(_manifestaciones ??= []);
  }

  bool hasManifestaciones() => _manifestaciones != null;

  // "iniciativas" field.
  List<IniciativaCardStruct>? _iniciativas;
  List<IniciativaCardStruct> get iniciativas => _iniciativas ?? const [];
  set iniciativas(List<IniciativaCardStruct>? val) => _iniciativas = val;

  void updateIniciativas(Function(List<IniciativaCardStruct>) updateFn) {
    updateFn(_iniciativas ??= []);
  }

  bool hasIniciativas() => _iniciativas != null;

  // "tendenciasOrigina" field.
  List<DocumentReference>? _tendenciasOrigina;
  List<DocumentReference> get tendenciasOrigina => _tendenciasOrigina ?? const [];
  set tendenciasOrigina(List<DocumentReference>? val) => _tendenciasOrigina = val;

  void updateTendenciasOrigina(Function(List<DocumentReference>) updateFn) {
    updateFn(_tendenciasOrigina ??= []);
  }

  bool hasTendenciasOrigina() => _tendenciasOrigina != null;

  static EscenariosListStruct fromMap(Map<String, dynamic> data) =>
      EscenariosListStruct(
        titulo: data['titulo'] as String?,
        subtitulo: data['subtitulo'] as String?,
        descripcion: castToType<double>(data['descripcion']),
        imagenPrincipal: data['imagenPrincipal'] as String?,
        imagenSecundarias: getDataList(data['imagenSecundarias']),
        habitantes: getStructList(
          data['habitantes'],
          EscenarioHabitantesStruct.fromMap,
        ),
        cards: getStructList(
          data['cards'],
          EscenarioCardDataStruct.fromMap,
        ),
        manifestaciones: getStructList(
          data['manifestaciones'],
          EscenarioCardManifestacionStruct.fromMap,
        ),
        iniciativas: getStructList(
          data['iniciativas'],
          IniciativaCardStruct.fromMap,
        ),
        tendenciasOrigina: (data['tendenciasOrigina'] as List?)
            ?.map((e) => e as DocumentReference)
            .toList(),
      );

  static EscenariosListStruct? maybeFromMap(dynamic data) => data is Map
      ? EscenariosListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'subtitulo': _subtitulo,
        'descripcion': _descripcion,
        'imagenPrincipal': _imagenPrincipal,
        'imagenSecundarias': _imagenSecundarias,
        'habitantes': _habitantes?.map((e) => e.toMap()).toList(),
        'cards': _cards?.map((e) => e.toMap()).toList(),
        'manifestaciones': _manifestaciones?.map((e) => e.toMap()).toList(),
        'iniciativas': _iniciativas?.map((e) => e.toMap()).toList(),
        'tendenciasOrigina': _tendenciasOrigina,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'subtitulo': serializeParam(
          _subtitulo,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.double,
        ),
        'imagenPrincipal': serializeParam(
          _imagenPrincipal,
          ParamType.String,
        ),
        'imagenSecundarias': serializeParam(
          _imagenSecundarias,
          ParamType.String,
          isList: true,
        ),
        'habitantes': serializeParam(
          _habitantes,
          ParamType.DataStruct,
          isList: true,
        ),
        'cards': serializeParam(
          _cards,
          ParamType.DataStruct,
          isList: true,
        ),
        'manifestaciones': serializeParam(
          _manifestaciones,
          ParamType.DataStruct,
          isList: true,
        ),
        'iniciativas': serializeParam(
          _iniciativas,
          ParamType.DataStruct,
          isList: true,
        ),
        'tendenciasOrigina': serializeParam(
          _tendenciasOrigina,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static EscenariosListStruct fromSerializableMap(Map<String, dynamic> data) =>
      EscenariosListStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        subtitulo: deserializeParam(
          data['subtitulo'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.double,
          false,
        ),
        imagenPrincipal: deserializeParam(
          data['imagenPrincipal'],
          ParamType.String,
          false,
        ),
        imagenSecundarias: deserializeParam<String>(
          data['imagenSecundarias'],
          ParamType.String,
          true,
        ),
        habitantes: deserializeStructParam<EscenarioHabitantesStruct>(
          data['habitantes'],
          ParamType.DataStruct,
          true,
          structBuilder: EscenarioHabitantesStruct.fromSerializableMap,
        ),
        cards: deserializeStructParam<EscenarioCardDataStruct>(
          data['cards'],
          ParamType.DataStruct,
          true,
          structBuilder: EscenarioCardDataStruct.fromSerializableMap,
        ),
        manifestaciones:
            deserializeStructParam<EscenarioCardManifestacionStruct>(
          data['manifestaciones'],
          ParamType.DataStruct,
          true,
          structBuilder: EscenarioCardManifestacionStruct.fromSerializableMap,
        ),
        iniciativas: deserializeStructParam<IniciativaCardStruct>(
          data['iniciativas'],
          ParamType.DataStruct,
          true,
          structBuilder: IniciativaCardStruct.fromSerializableMap,
        ),
        tendenciasOrigina: deserializeParam<DocumentReference>(
          data['tendenciasOrigina'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Reporte', 'tendencias'],
        ),
      );

  @override
  String toString() => 'EscenariosListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EscenariosListStruct &&
        titulo == other.titulo &&
        subtitulo == other.subtitulo &&
        descripcion == other.descripcion &&
        imagenPrincipal == other.imagenPrincipal &&
        listEquality.equals(imagenSecundarias, other.imagenSecundarias) &&
        listEquality.equals(habitantes, other.habitantes) &&
        listEquality.equals(cards, other.cards) &&
        listEquality.equals(manifestaciones, other.manifestaciones) &&
        listEquality.equals(iniciativas, other.iniciativas) &&
        listEquality.equals(tendenciasOrigina, other.tendenciasOrigina);
  }

  @override
  int get hashCode => const ListEquality().hash([
        titulo,
        subtitulo,
        descripcion,
        imagenPrincipal,
        imagenSecundarias,
        habitantes,
        cards,
        manifestaciones,
        iniciativas,
        tendenciasOrigina
      ]);
}

EscenariosListStruct createEscenariosListStruct({
  String? titulo,
  String? subtitulo,
  double? descripcion,
  String? imagenPrincipal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EscenariosListStruct(
      titulo: titulo,
      subtitulo: subtitulo,
      descripcion: descripcion,
      imagenPrincipal: imagenPrincipal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EscenariosListStruct? updateEscenariosListStruct(
  EscenariosListStruct? escenariosList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    escenariosList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEscenariosListStructData(
  Map<String, dynamic> firestoreData,
  EscenariosListStruct? escenariosList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (escenariosList == null) {
    return;
  }
  if (escenariosList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && escenariosList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final escenariosListData =
      getEscenariosListFirestoreData(escenariosList, forFieldValue);
  final nestedData =
      escenariosListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = escenariosList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEscenariosListFirestoreData(
  EscenariosListStruct? escenariosList, [
  bool forFieldValue = false,
]) {
  if (escenariosList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(escenariosList.toMap());

  // Add any Firestore field values
  escenariosList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEscenariosListListFirestoreData(
  List<EscenariosListStruct>? escenariosLists,
) =>
    escenariosLists
        ?.map((e) => getEscenariosListFirestoreData(e, true))
        .toList() ??
    [];
