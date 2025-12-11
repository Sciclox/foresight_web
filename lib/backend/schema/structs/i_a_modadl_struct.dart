// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IAModadlStruct extends FFFirebaseStruct {
  IAModadlStruct({
    String? usuarioMensaje,
    String? botMensaje,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usuarioMensaje = usuarioMensaje,
        _botMensaje = botMensaje,
        super(firestoreUtilData);

  // "usuarioMensaje" field.
  String? _usuarioMensaje;
  String get usuarioMensaje => _usuarioMensaje ?? '';
  set usuarioMensaje(String? val) => _usuarioMensaje = val;

  bool hasUsuarioMensaje() => _usuarioMensaje != null;

  // "botMensaje" field.
  String? _botMensaje;
  String get botMensaje => _botMensaje ?? '';
  set botMensaje(String? val) => _botMensaje = val;

  bool hasBotMensaje() => _botMensaje != null;

  static IAModadlStruct fromMap(Map<String, dynamic> data) => IAModadlStruct(
        usuarioMensaje: data['usuarioMensaje'] as String?,
        botMensaje: data['botMensaje'] as String?,
      );

  static IAModadlStruct? maybeFromMap(dynamic data) =>
      data is Map ? IAModadlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'usuarioMensaje': _usuarioMensaje,
        'botMensaje': _botMensaje,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usuarioMensaje': serializeParam(
          _usuarioMensaje,
          ParamType.String,
        ),
        'botMensaje': serializeParam(
          _botMensaje,
          ParamType.String,
        ),
      }.withoutNulls;

  static IAModadlStruct fromSerializableMap(Map<String, dynamic> data) =>
      IAModadlStruct(
        usuarioMensaje: deserializeParam(
          data['usuarioMensaje'],
          ParamType.String,
          false,
        ),
        botMensaje: deserializeParam(
          data['botMensaje'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IAModadlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IAModadlStruct &&
        usuarioMensaje == other.usuarioMensaje &&
        botMensaje == other.botMensaje;
  }

  @override
  int get hashCode => const ListEquality().hash([usuarioMensaje, botMensaje]);
}

IAModadlStruct createIAModadlStruct({
  String? usuarioMensaje,
  String? botMensaje,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IAModadlStruct(
      usuarioMensaje: usuarioMensaje,
      botMensaje: botMensaje,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IAModadlStruct? updateIAModadlStruct(
  IAModadlStruct? iAModadl, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    iAModadl
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIAModadlStructData(
  Map<String, dynamic> firestoreData,
  IAModadlStruct? iAModadl,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (iAModadl == null) {
    return;
  }
  if (iAModadl.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && iAModadl.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iAModadlData = getIAModadlFirestoreData(iAModadl, forFieldValue);
  final nestedData = iAModadlData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = iAModadl.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIAModadlFirestoreData(
  IAModadlStruct? iAModadl, [
  bool forFieldValue = false,
]) {
  if (iAModadl == null) {
    return {};
  }
  final firestoreData = mapToFirestore(iAModadl.toMap());

  // Add any Firestore field values
  iAModadl.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIAModadlListFirestoreData(
  List<IAModadlStruct>? iAModadls,
) =>
    iAModadls?.map((e) => getIAModadlFirestoreData(e, true)).toList() ?? [];
