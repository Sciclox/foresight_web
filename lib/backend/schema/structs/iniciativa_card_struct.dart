// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IniciativaCardStruct extends FFFirebaseStruct {
  IniciativaCardStruct({
    String? titulo,
    String? descripcion,
    List<String>? capacidades,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _descripcion = descripcion,
        _capacidades = capacidades,
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

  // "capacidades" field.
  List<String>? _capacidades;
  List<String> get capacidades => _capacidades ?? const [];
  set capacidades(List<String>? val) => _capacidades = val;

  void updateCapacidades(Function(List<String>) updateFn) {
    updateFn(_capacidades ??= []);
  }

  bool hasCapacidades() => _capacidades != null;

  static IniciativaCardStruct fromMap(Map<String, dynamic> data) =>
      IniciativaCardStruct(
        titulo: data['titulo'] as String?,
        descripcion: data['descripcion'] as String?,
        capacidades: getDataList(data['capacidades']),
      );

  static IniciativaCardStruct? maybeFromMap(dynamic data) => data is Map
      ? IniciativaCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'descripcion': _descripcion,
        'capacidades': _capacidades,
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
        'capacidades': serializeParam(
          _capacidades,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static IniciativaCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      IniciativaCardStruct(
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
        capacidades: deserializeParam<String>(
          data['capacidades'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'IniciativaCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is IniciativaCardStruct &&
        titulo == other.titulo &&
        descripcion == other.descripcion &&
        listEquality.equals(capacidades, other.capacidades);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titulo, descripcion, capacidades]);
}

IniciativaCardStruct createIniciativaCardStruct({
  String? titulo,
  String? descripcion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IniciativaCardStruct(
      titulo: titulo,
      descripcion: descripcion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IniciativaCardStruct? updateIniciativaCardStruct(
  IniciativaCardStruct? iniciativaCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    iniciativaCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIniciativaCardStructData(
  Map<String, dynamic> firestoreData,
  IniciativaCardStruct? iniciativaCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (iniciativaCard == null) {
    return;
  }
  if (iniciativaCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && iniciativaCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iniciativaCardData =
      getIniciativaCardFirestoreData(iniciativaCard, forFieldValue);
  final nestedData =
      iniciativaCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = iniciativaCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIniciativaCardFirestoreData(
  IniciativaCardStruct? iniciativaCard, [
  bool forFieldValue = false,
]) {
  if (iniciativaCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(iniciativaCard.toMap());

  // Add any Firestore field values
  iniciativaCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIniciativaCardListFirestoreData(
  List<IniciativaCardStruct>? iniciativaCards,
) =>
    iniciativaCards
        ?.map((e) => getIniciativaCardFirestoreData(e, true))
        .toList() ??
    [];
