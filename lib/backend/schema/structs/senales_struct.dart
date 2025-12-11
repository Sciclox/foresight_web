// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SenalesStruct extends FFFirebaseStruct {
  SenalesStruct({
    String? imagen,
    String? titulo,
    String? descripcion,
    String? textoEnlace,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagen = imagen,
        _titulo = titulo,
        _descripcion = descripcion,
        _textoEnlace = textoEnlace,
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

  // "textoEnlace" field.
  String? _textoEnlace;
  String get textoEnlace => _textoEnlace ?? '';
  set textoEnlace(String? val) => _textoEnlace = val;

  bool hasTextoEnlace() => _textoEnlace != null;

  static SenalesStruct fromMap(Map<String, dynamic> data) => SenalesStruct(
        imagen: data['imagen'] as String?,
        titulo: data['titulo'] as String?,
        descripcion: data['descripcion'] as String?,
        textoEnlace: data['textoEnlace'] as String?,
      );

  static SenalesStruct? maybeFromMap(dynamic data) =>
      data is Map ? SenalesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imagen': _imagen,
        'titulo': _titulo,
        'descripcion': _descripcion,
        'textoEnlace': _textoEnlace,
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
        'textoEnlace': serializeParam(
          _textoEnlace,
          ParamType.String,
        ),
      }.withoutNulls;

  static SenalesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SenalesStruct(
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
        textoEnlace: deserializeParam(
          data['textoEnlace'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SenalesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SenalesStruct &&
        imagen == other.imagen &&
        titulo == other.titulo &&
        descripcion == other.descripcion &&
        textoEnlace == other.textoEnlace;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([imagen, titulo, descripcion, textoEnlace]);
}

SenalesStruct createSenalesStruct({
  String? imagen,
  String? titulo,
  String? descripcion,
  String? textoEnlace,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SenalesStruct(
      imagen: imagen,
      titulo: titulo,
      descripcion: descripcion,
      textoEnlace: textoEnlace,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SenalesStruct? updateSenalesStruct(
  SenalesStruct? senales, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    senales
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSenalesStructData(
  Map<String, dynamic> firestoreData,
  SenalesStruct? senales,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (senales == null) {
    return;
  }
  if (senales.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && senales.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final senalesData = getSenalesFirestoreData(senales, forFieldValue);
  final nestedData = senalesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = senales.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSenalesFirestoreData(
  SenalesStruct? senales, [
  bool forFieldValue = false,
]) {
  if (senales == null) {
    return {};
  }
  final firestoreData = mapToFirestore(senales.toMap());

  // Add any Firestore field values
  senales.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSenalesListFirestoreData(
  List<SenalesStruct>? senaless,
) =>
    senaless?.map((e) => getSenalesFirestoreData(e, true)).toList() ?? [];
