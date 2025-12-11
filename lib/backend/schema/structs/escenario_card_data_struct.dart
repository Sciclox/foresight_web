// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EscenarioCardDataStruct extends FFFirebaseStruct {
  EscenarioCardDataStruct({
    String? titulo,
    String? descripcion,
    String? fuente,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _descripcion = descripcion,
        _fuente = fuente,
        super(firestoreUtilData);

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "fuente" field.
  String? _fuente;
  String get fuente => _fuente ?? '';
  set fuente(String? val) => _fuente = val;

  bool hasFuente() => _fuente != null;

  static EscenarioCardDataStruct fromMap(Map<String, dynamic> data) =>
      EscenarioCardDataStruct(
        titulo: data['titulo'] as String?,
        descripcion: data['descripcion'] as String?,
        fuente: data['fuente'] as String?,
      );

  static EscenarioCardDataStruct? maybeFromMap(dynamic data) => data is Map
      ? EscenarioCardDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'descripcion': _descripcion,
        'fuente': _fuente,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'fuente': serializeParam(
          _fuente,
          ParamType.String,
        ),
      }.withoutNulls;

  static EscenarioCardDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EscenarioCardDataStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        fuente: deserializeParam(
          data['fuente'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EscenarioCardDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EscenarioCardDataStruct &&
        titulo == other.titulo &&
        descripcion == other.descripcion &&
        fuente == other.fuente;
  }

  @override
  int get hashCode => const ListEquality().hash([titulo, descripcion, fuente]);
}

EscenarioCardDataStruct createEscenarioCardDataStruct({
  String? titulo,
  String? descripcion,
  String? fuente,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EscenarioCardDataStruct(
      titulo: titulo,
      descripcion: descripcion,
      fuente: fuente,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EscenarioCardDataStruct? updateEscenarioCardDataStruct(
  EscenarioCardDataStruct? escenarioCardData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    escenarioCardData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEscenarioCardDataStructData(
  Map<String, dynamic> firestoreData,
  EscenarioCardDataStruct? escenarioCardData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (escenarioCardData == null) {
    return;
  }
  if (escenarioCardData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && escenarioCardData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final escenarioCardDataData =
      getEscenarioCardDataFirestoreData(escenarioCardData, forFieldValue);
  final nestedData =
      escenarioCardDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = escenarioCardData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEscenarioCardDataFirestoreData(
  EscenarioCardDataStruct? escenarioCardData, [
  bool forFieldValue = false,
]) {
  if (escenarioCardData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(escenarioCardData.toMap());

  // Add any Firestore field values
  escenarioCardData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEscenarioCardDataListFirestoreData(
  List<EscenarioCardDataStruct>? escenarioCardDatas,
) =>
    escenarioCardDatas
        ?.map((e) => getEscenarioCardDataFirestoreData(e, true))
        .toList() ??
    [];
