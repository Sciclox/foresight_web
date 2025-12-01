// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitantePeriodosStruct extends FFFirebaseStruct {
  HabitantePeriodosStruct({
    String? imagen,
    String? titulo,
    String? subtitulo,
    Color? colorSubtitulo,
    String? descripcion,
    bool? cita,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagen = imagen,
        _titulo = titulo,
        _subtitulo = subtitulo,
        _colorSubtitulo = colorSubtitulo,
        _descripcion = descripcion,
        _cita = cita,
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

  // "subtitulo" field.
  String? _subtitulo;
  String get subtitulo => _subtitulo ?? '';
  set subtitulo(String? val) => _subtitulo = val;

  bool hasSubtitulo() => _subtitulo != null;

  // "colorSubtitulo" field.
  Color? _colorSubtitulo;
  Color? get colorSubtitulo => _colorSubtitulo;
  set colorSubtitulo(Color? val) => _colorSubtitulo = val;

  bool hasColorSubtitulo() => _colorSubtitulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "cita" field.
  bool? _cita;
  bool get cita => _cita ?? false;
  set cita(bool? val) => _cita = val;

  bool hasCita() => _cita != null;

  static HabitantePeriodosStruct fromMap(Map<String, dynamic> data) =>
      HabitantePeriodosStruct(
        imagen: data['imagen'] as String?,
        titulo: data['titulo'] as String?,
        subtitulo: data['subtitulo'] as String?,
        colorSubtitulo: getSchemaColor(data['colorSubtitulo']),
        descripcion: data['descripcion'] as String?,
        cita: data['cita'] as bool?,
      );

  static HabitantePeriodosStruct? maybeFromMap(dynamic data) => data is Map
      ? HabitantePeriodosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagen': _imagen,
        'titulo': _titulo,
        'subtitulo': _subtitulo,
        'colorSubtitulo': _colorSubtitulo,
        'descripcion': _descripcion,
        'cita': _cita,
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
        'subtitulo': serializeParam(
          _subtitulo,
          ParamType.String,
        ),
        'colorSubtitulo': serializeParam(
          _colorSubtitulo,
          ParamType.Color,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'cita': serializeParam(
          _cita,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HabitantePeriodosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HabitantePeriodosStruct(
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
        subtitulo: deserializeParam(
          data['subtitulo'],
          ParamType.String,
          false,
        ),
        colorSubtitulo: deserializeParam(
          data['colorSubtitulo'],
          ParamType.Color,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        cita: deserializeParam(
          data['cita'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'HabitantePeriodosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HabitantePeriodosStruct &&
        imagen == other.imagen &&
        titulo == other.titulo &&
        subtitulo == other.subtitulo &&
        colorSubtitulo == other.colorSubtitulo &&
        descripcion == other.descripcion &&
        cita == other.cita;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([imagen, titulo, subtitulo, colorSubtitulo, descripcion, cita]);
}

HabitantePeriodosStruct createHabitantePeriodosStruct({
  String? imagen,
  String? titulo,
  String? subtitulo,
  Color? colorSubtitulo,
  String? descripcion,
  bool? cita,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HabitantePeriodosStruct(
      imagen: imagen,
      titulo: titulo,
      subtitulo: subtitulo,
      colorSubtitulo: colorSubtitulo,
      descripcion: descripcion,
      cita: cita,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HabitantePeriodosStruct? updateHabitantePeriodosStruct(
  HabitantePeriodosStruct? habitantePeriodos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    habitantePeriodos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHabitantePeriodosStructData(
  Map<String, dynamic> firestoreData,
  HabitantePeriodosStruct? habitantePeriodos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (habitantePeriodos == null) {
    return;
  }
  if (habitantePeriodos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && habitantePeriodos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final habitantePeriodosData =
      getHabitantePeriodosFirestoreData(habitantePeriodos, forFieldValue);
  final nestedData =
      habitantePeriodosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = habitantePeriodos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHabitantePeriodosFirestoreData(
  HabitantePeriodosStruct? habitantePeriodos, [
  bool forFieldValue = false,
]) {
  if (habitantePeriodos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(habitantePeriodos.toMap());

  // Add any Firestore field values
  habitantePeriodos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHabitantePeriodosListFirestoreData(
  List<HabitantePeriodosStruct>? habitantePeriodoss,
) =>
    habitantePeriodoss
        ?.map((e) => getHabitantePeriodosFirestoreData(e, true))
        .toList() ??
    [];
