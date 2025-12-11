// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TendenciasListStruct extends FFFirebaseStruct {
  TendenciasListStruct({
    String? titulo,
    String? subtitulo,
    String? descripcion,
    String? probabilidad,
    String? imagenPortada,
    String? subtituloCard,
    List<String>? impactos,
    SenalesStruct? senales,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _subtitulo = subtitulo,
        _descripcion = descripcion,
        _probabilidad = probabilidad,
        _imagenPortada = imagenPortada,
        _subtituloCard = subtituloCard,
        _impactos = impactos,
        _senales = senales,
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
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "probabilidad" field.
  String? _probabilidad;
  String get probabilidad => _probabilidad ?? '';
  set probabilidad(String? val) => _probabilidad = val;

  bool hasProbabilidad() => _probabilidad != null;

  // "imagenPortada" field.
  String? _imagenPortada;
  String get imagenPortada => _imagenPortada ?? '';
  set imagenPortada(String? val) => _imagenPortada = val;

  bool hasImagenPortada() => _imagenPortada != null;

  // "subtituloCard" field.
  String? _subtituloCard;
  String get subtituloCard => _subtituloCard ?? '';
  set subtituloCard(String? val) => _subtituloCard = val;

  bool hasSubtituloCard() => _subtituloCard != null;

  // "impactos" field.
  List<String>? _impactos;
  List<String> get impactos => _impactos ?? const [];
  set impactos(List<String>? val) => _impactos = val;

  void updateImpactos(Function(List<String>) updateFn) {
    updateFn(_impactos ??= []);
  }

  bool hasImpactos() => _impactos != null;

  // "senales" field.
  SenalesStruct? _senales;
  SenalesStruct get senales => _senales ?? SenalesStruct();
  set senales(SenalesStruct? val) => _senales = val;

  void updateSenales(Function(SenalesStruct) updateFn) {
    updateFn(_senales ??= SenalesStruct());
  }

  bool hasSenales() => _senales != null;

  static TendenciasListStruct fromMap(Map<String, dynamic> data) =>
      TendenciasListStruct(
        titulo: data['titulo'] as String?,
        subtitulo: data['subtitulo'] as String?,
        descripcion: data['descripcion'] as String?,
        probabilidad: data['probabilidad'] as String?,
        imagenPortada: data['imagenPortada'] as String?,
        subtituloCard: data['subtituloCard'] as String?,
        impactos: getDataList(data['impactos']),
        senales: data['senales'] is SenalesStruct
            ? data['senales']
            : SenalesStruct.maybeFromMap(data['senales']),
      );

  static TendenciasListStruct? maybeFromMap(dynamic data) => data is Map
      ? TendenciasListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'subtitulo': _subtitulo,
        'descripcion': _descripcion,
        'probabilidad': _probabilidad,
        'imagenPortada': _imagenPortada,
        'subtituloCard': _subtituloCard,
        'impactos': _impactos,
        'senales': _senales?.toMap(),
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
          ParamType.String,
        ),
        'probabilidad': serializeParam(
          _probabilidad,
          ParamType.String,
        ),
        'imagenPortada': serializeParam(
          _imagenPortada,
          ParamType.String,
        ),
        'subtituloCard': serializeParam(
          _subtituloCard,
          ParamType.String,
        ),
        'impactos': serializeParam(
          _impactos,
          ParamType.String,
          isList: true,
        ),
        'senales': serializeParam(
          _senales,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TendenciasListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TendenciasListStruct(
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
          ParamType.String,
          false,
        ),
        probabilidad: deserializeParam(
          data['probabilidad'],
          ParamType.String,
          false,
        ),
        imagenPortada: deserializeParam(
          data['imagenPortada'],
          ParamType.String,
          false,
        ),
        subtituloCard: deserializeParam(
          data['subtituloCard'],
          ParamType.String,
          false,
        ),
        impactos: deserializeParam<String>(
          data['impactos'],
          ParamType.String,
          true,
        ),
        senales: deserializeStructParam(
          data['senales'],
          ParamType.DataStruct,
          false,
          structBuilder: SenalesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TendenciasListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TendenciasListStruct &&
        titulo == other.titulo &&
        subtitulo == other.subtitulo &&
        descripcion == other.descripcion &&
        probabilidad == other.probabilidad &&
        imagenPortada == other.imagenPortada &&
        subtituloCard == other.subtituloCard &&
        listEquality.equals(impactos, other.impactos) &&
        senales == other.senales;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([titulo, subtitulo, descripcion, probabilidad, imagenPortada, subtituloCard, impactos, senales]);
}

TendenciasListStruct createTendenciasListStruct({
  String? titulo,
  String? subtitulo,
  String? descripcion,
  String? probabilidad,
  String? imagenPortada,
  String? subtituloCard,
  SenalesStruct? senales,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TendenciasListStruct(
      titulo: titulo,
      subtitulo: subtitulo,
      descripcion: descripcion,
      probabilidad: probabilidad,
      imagenPortada: imagenPortada,
      subtituloCard: subtituloCard,
      senales: senales ?? (clearUnsetFields ? SenalesStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TendenciasListStruct? updateTendenciasListStruct(
  TendenciasListStruct? tendenciasList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tendenciasList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTendenciasListStructData(
  Map<String, dynamic> firestoreData,
  TendenciasListStruct? tendenciasList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tendenciasList == null) {
    return;
  }
  if (tendenciasList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tendenciasList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tendenciasListData =
      getTendenciasListFirestoreData(tendenciasList, forFieldValue);
  final nestedData =
      tendenciasListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tendenciasList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTendenciasListFirestoreData(
  TendenciasListStruct? tendenciasList, [
  bool forFieldValue = false,
]) {
  if (tendenciasList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tendenciasList.toMap());

  // Handle nested data for "senales" field.
  addSenalesStructData(
    firestoreData,
    tendenciasList.hasSenales() ? tendenciasList.senales : null,
    'senales',
    forFieldValue,
  );

  // Add any Firestore field values
  tendenciasList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTendenciasListListFirestoreData(
  List<TendenciasListStruct>? tendenciasLists,
) =>
    tendenciasLists
        ?.map((e) => getTendenciasListFirestoreData(e, true))
        .toList() ??
    [];
