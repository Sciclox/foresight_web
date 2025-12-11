// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EscenarioCardManifestacionStruct extends FFFirebaseStruct {
  EscenarioCardManifestacionStruct({
    String? imagen,
    String? titulo,
    String? descripcion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagen = imagen,
        _titulo = titulo,
        _descripcion = descripcion,
        super(firestoreUtilData);

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  set imagen(String? val) => _imagen = val;

  bool hasImagen() => _imagen != null;

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

  static EscenarioCardManifestacionStruct fromMap(Map<String, dynamic> data) =>
      EscenarioCardManifestacionStruct(
        imagen: data['imagen'] as String?,
        titulo: data['titulo'] as String?,
        descripcion: data['descripcion'] as String?,
      );

  static EscenarioCardManifestacionStruct? maybeFromMap(dynamic data) => data
          is Map
      ? EscenarioCardManifestacionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagen': _imagen,
        'titulo': _titulo,
        'descripcion': _descripcion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imagen': serializeParam(
          _imagen,
          ParamType.String,
        ),
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
      }.withoutNulls;

  static EscenarioCardManifestacionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EscenarioCardManifestacionStruct(
        imagen: deserializeParam(
          data['imagen'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'EscenarioCardManifestacionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EscenarioCardManifestacionStruct &&
        imagen == other.imagen &&
        titulo == other.titulo &&
        descripcion == other.descripcion;
  }

  @override
  int get hashCode => const ListEquality().hash([imagen, titulo, descripcion]);
}

EscenarioCardManifestacionStruct createEscenarioCardManifestacionStruct({
  String? imagen,
  String? titulo,
  String? descripcion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EscenarioCardManifestacionStruct(
      imagen: imagen,
      titulo: titulo,
      descripcion: descripcion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EscenarioCardManifestacionStruct? updateEscenarioCardManifestacionStruct(
  EscenarioCardManifestacionStruct? escenarioCardManifestacion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    escenarioCardManifestacion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEscenarioCardManifestacionStructData(
  Map<String, dynamic> firestoreData,
  EscenarioCardManifestacionStruct? escenarioCardManifestacion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (escenarioCardManifestacion == null) {
    return;
  }
  if (escenarioCardManifestacion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      escenarioCardManifestacion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final escenarioCardManifestacionData =
      getEscenarioCardManifestacionFirestoreData(
          escenarioCardManifestacion, forFieldValue);
  final nestedData = escenarioCardManifestacionData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      escenarioCardManifestacion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEscenarioCardManifestacionFirestoreData(
  EscenarioCardManifestacionStruct? escenarioCardManifestacion, [
  bool forFieldValue = false,
]) {
  if (escenarioCardManifestacion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(escenarioCardManifestacion.toMap());

  // Add any Firestore field values
  escenarioCardManifestacion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEscenarioCardManifestacionListFirestoreData(
  List<EscenarioCardManifestacionStruct>? escenarioCardManifestacions,
) =>
    escenarioCardManifestacions
        ?.map((e) => getEscenarioCardManifestacionFirestoreData(e, true))
        .toList() ??
    [];
