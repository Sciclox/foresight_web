// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HabitanteCardStruct extends FFFirebaseStruct {
  HabitanteCardStruct({
    String? titulo,
    String? descripcion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _descripcion = descripcion,
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

  static HabitanteCardStruct fromMap(Map<String, dynamic> data) =>
      HabitanteCardStruct(
        titulo: data['titulo'] as String?,
        descripcion: data['descripcion'] as String?,
      );

  static HabitanteCardStruct? maybeFromMap(dynamic data) => data is Map
      ? HabitanteCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'descripcion': _descripcion,
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
      }.withoutNulls;

  static HabitanteCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      HabitanteCardStruct(
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
      );

  @override
  String toString() => 'HabitanteCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HabitanteCardStruct &&
        titulo == other.titulo &&
        descripcion == other.descripcion;
  }

  @override
  int get hashCode => const ListEquality().hash([titulo, descripcion]);
}

HabitanteCardStruct createHabitanteCardStruct({
  String? titulo,
  String? descripcion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HabitanteCardStruct(
      titulo: titulo,
      descripcion: descripcion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HabitanteCardStruct? updateHabitanteCardStruct(
  HabitanteCardStruct? habitanteCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    habitanteCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHabitanteCardStructData(
  Map<String, dynamic> firestoreData,
  HabitanteCardStruct? habitanteCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (habitanteCard == null) {
    return;
  }
  if (habitanteCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && habitanteCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final habitanteCardData =
      getHabitanteCardFirestoreData(habitanteCard, forFieldValue);
  final nestedData =
      habitanteCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = habitanteCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHabitanteCardFirestoreData(
  HabitanteCardStruct? habitanteCard, [
  bool forFieldValue = false,
]) {
  if (habitanteCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(habitanteCard.toMap());

  // Add any Firestore field values
  habitanteCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHabitanteCardListFirestoreData(
  List<HabitanteCardStruct>? habitanteCards,
) =>
    habitanteCards
        ?.map((e) => getHabitanteCardFirestoreData(e, true))
        .toList() ??
    [];
