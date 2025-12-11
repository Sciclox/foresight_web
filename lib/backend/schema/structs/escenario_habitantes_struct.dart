// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EscenarioHabitantesStruct extends FFFirebaseStruct {
  EscenarioHabitantesStruct({
    String? audio,
    String? imagen,
    double? nombre,
    String? descripcion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _audio = audio,
        _imagen = imagen,
        _nombre = nombre,
        _descripcion = descripcion,
        super(firestoreUtilData);

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  set audio(String? val) => _audio = val;

  bool hasAudio() => _audio != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  set imagen(String? val) => _imagen = val;

  bool hasImagen() => _imagen != null;

  // "nombre" field.
  double? _nombre;
  double get nombre => _nombre ?? 0.0;
  set nombre(double? val) => _nombre = val;

  void incrementNombre(double amount) => nombre = nombre + amount;

  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  static EscenarioHabitantesStruct fromMap(Map<String, dynamic> data) =>
      EscenarioHabitantesStruct(
        audio: data['audio'] as String?,
        imagen: data['imagen'] as String?,
        nombre: castToType<double>(data['nombre']),
        descripcion: data['descripcion'] as String?,
      );

  static EscenarioHabitantesStruct? maybeFromMap(dynamic data) => data is Map
      ? EscenarioHabitantesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'audio': _audio,
        'imagen': _imagen,
        'nombre': _nombre,
        'descripcion': _descripcion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audio': serializeParam(
          _audio,
          ParamType.String,
        ),
        'imagen': serializeParam(
          _imagen,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.double,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
      }.withoutNulls;

  static EscenarioHabitantesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EscenarioHabitantesStruct(
        audio: deserializeParam(
          data['audio'],
          ParamType.String,
          false,
        ),
        imagen: deserializeParam(
          data['imagen'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.double,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EscenarioHabitantesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EscenarioHabitantesStruct &&
        audio == other.audio &&
        imagen == other.imagen &&
        nombre == other.nombre &&
        descripcion == other.descripcion;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([audio, imagen, nombre, descripcion]);
}

EscenarioHabitantesStruct createEscenarioHabitantesStruct({
  String? audio,
  String? imagen,
  double? nombre,
  String? descripcion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EscenarioHabitantesStruct(
      audio: audio,
      imagen: imagen,
      nombre: nombre,
      descripcion: descripcion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EscenarioHabitantesStruct? updateEscenarioHabitantesStruct(
  EscenarioHabitantesStruct? escenarioHabitantes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    escenarioHabitantes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEscenarioHabitantesStructData(
  Map<String, dynamic> firestoreData,
  EscenarioHabitantesStruct? escenarioHabitantes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (escenarioHabitantes == null) {
    return;
  }
  if (escenarioHabitantes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && escenarioHabitantes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final escenarioHabitantesData =
      getEscenarioHabitantesFirestoreData(escenarioHabitantes, forFieldValue);
  final nestedData =
      escenarioHabitantesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      escenarioHabitantes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEscenarioHabitantesFirestoreData(
  EscenarioHabitantesStruct? escenarioHabitantes, [
  bool forFieldValue = false,
]) {
  if (escenarioHabitantes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(escenarioHabitantes.toMap());

  // Add any Firestore field values
  escenarioHabitantes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEscenarioHabitantesListFirestoreData(
  List<EscenarioHabitantesStruct>? escenarioHabitantess,
) =>
    escenarioHabitantess
        ?.map((e) => getEscenarioHabitantesFirestoreData(e, true))
        .toList() ??
    [];
