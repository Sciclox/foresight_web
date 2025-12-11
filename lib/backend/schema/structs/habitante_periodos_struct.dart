// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitantePeriodosStruct extends FFFirebaseStruct {
  HabitantePeriodosStruct({
    String? periodo,
    String? titulo,
    String? subtitulo,
    Color? colorSubtitulo,
    String? descripcion,
    String? cita,
    String? imagen,
    bool? agua,
    bool? urbanizacion,
    bool? dinero,
    String? dineroText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _periodo = periodo,
        _titulo = titulo,
        _subtitulo = subtitulo,
        _colorSubtitulo = colorSubtitulo,
        _descripcion = descripcion,
        _cita = cita,
        _imagen = imagen,
        _agua = agua,
        _urbanizacion = urbanizacion,
        _dinero = dinero,
        _dineroText = dineroText,
        super(firestoreUtilData);

  // "periodo" field.
  String? _periodo;
  String get periodo => _periodo ?? '';
  set periodo(String? val) => _periodo = val;

  bool hasPeriodo() => _periodo != null;

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
  String? _cita;
  String get cita => _cita ?? '';
  set cita(String? val) => _cita = val;

  bool hasCita() => _cita != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  set imagen(String? val) => _imagen = val;

  bool hasImagen() => _imagen != null;

  // "agua" field.
  bool? _agua;
  bool get agua => _agua ?? false;
  set agua(bool? val) => _agua = val;

  bool hasAgua() => _agua != null;

  // "urbanizacion" field.
  bool? _urbanizacion;
  bool get urbanizacion => _urbanizacion ?? false;
  set urbanizacion(bool? val) => _urbanizacion = val;

  bool hasUrbanizacion() => _urbanizacion != null;

  // "dinero" field.
  bool? _dinero;
  bool get dinero => _dinero ?? false;
  set dinero(bool? val) => _dinero = val;

  bool hasDinero() => _dinero != null;

  // "dineroText" field.
  String? _dineroText;
  String get dineroText => _dineroText ?? '';
  set dineroText(String? val) => _dineroText = val;

  bool hasDineroText() => _dineroText != null;

  static HabitantePeriodosStruct fromMap(Map<String, dynamic> data) =>
      HabitantePeriodosStruct(
        periodo: data['periodo'] as String?,
        titulo: data['titulo'] as String?,
        subtitulo: data['subtitulo'] as String?,
        colorSubtitulo: getSchemaColor(data['colorSubtitulo']),
        descripcion: data['descripcion'] as String?,
        cita: data['cita'] as String?,
        imagen: data['imagen'] as String?,
        agua: data['agua'] as bool?,
        urbanizacion: data['urbanizacion'] as bool?,
        dinero: data['dinero'] as bool?,
        dineroText: data['dineroText'] as String?,
      );

  static HabitantePeriodosStruct? maybeFromMap(dynamic data) => data is Map
      ? HabitantePeriodosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'periodo': _periodo,
        'titulo': _titulo,
        'subtitulo': _subtitulo,
        'colorSubtitulo': _colorSubtitulo,
        'descripcion': _descripcion,
        'cita': _cita,
        'imagen': _imagen,
        'agua': _agua,
        'urbanizacion': _urbanizacion,
        'dinero': _dinero,
        'dineroText': _dineroText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'periodo': serializeParam(
          _periodo,
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
          ParamType.String,
        ),
        'imagen': serializeParam(
          _imagen,
          ParamType.String,
        ),
        'agua': serializeParam(
          _agua,
          ParamType.bool,
        ),
        'urbanizacion': serializeParam(
          _urbanizacion,
          ParamType.bool,
        ),
        'dinero': serializeParam(
          _dinero,
          ParamType.bool,
        ),
        'dineroText': serializeParam(
          _dineroText,
          ParamType.String,
        ),
      }.withoutNulls;

  static HabitantePeriodosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HabitantePeriodosStruct(
        periodo: deserializeParam(
          data['periodo'],
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
          ParamType.String,
          false,
        ),
        imagen: deserializeParam(
          data['imagen'],
          ParamType.String,
          false,
        ),
        agua: deserializeParam(
          data['agua'],
          ParamType.bool,
          false,
        ),
        urbanizacion: deserializeParam(
          data['urbanizacion'],
          ParamType.bool,
          false,
        ),
        dinero: deserializeParam(
          data['dinero'],
          ParamType.bool,
          false,
        ),
        dineroText: deserializeParam(
          data['dineroText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HabitantePeriodosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HabitantePeriodosStruct &&
        periodo == other.periodo &&
        titulo == other.titulo &&
        subtitulo == other.subtitulo &&
        colorSubtitulo == other.colorSubtitulo &&
        descripcion == other.descripcion &&
        cita == other.cita &&
        imagen == other.imagen &&
        agua == other.agua &&
        urbanizacion == other.urbanizacion &&
        dinero == other.dinero &&
        dineroText == other.dineroText;
  }

  @override
  int get hashCode => const ListEquality().hash([
        periodo,
        titulo,
        subtitulo,
        colorSubtitulo,
        descripcion,
        cita,
        imagen,
        agua,
        urbanizacion,
        dinero,
        dineroText
      ]);
}

HabitantePeriodosStruct createHabitantePeriodosStruct({
  String? periodo,
  String? titulo,
  String? subtitulo,
  Color? colorSubtitulo,
  String? descripcion,
  String? cita,
  String? imagen,
  bool? agua,
  bool? urbanizacion,
  bool? dinero,
  String? dineroText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HabitantePeriodosStruct(
      periodo: periodo,
      titulo: titulo,
      subtitulo: subtitulo,
      colorSubtitulo: colorSubtitulo,
      descripcion: descripcion,
      cita: cita,
      imagen: imagen,
      agua: agua,
      urbanizacion: urbanizacion,
      dinero: dinero,
      dineroText: dineroText,
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
