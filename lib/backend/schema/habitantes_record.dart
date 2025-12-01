import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitantesRecord extends FirestoreRecord {
  HabitantesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tituloSeccion" field.
  String? _tituloSeccion;
  String get tituloSeccion => _tituloSeccion ?? '';
  bool hasTituloSeccion() => _tituloSeccion != null;

  // "subtituloSeccion" field.
  String? _subtituloSeccion;
  String get subtituloSeccion => _subtituloSeccion ?? '';
  bool hasSubtituloSeccion() => _subtituloSeccion != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagenHabitante" field.
  String? _imagenHabitante;
  String get imagenHabitante => _imagenHabitante ?? '';
  bool hasImagenHabitante() => _imagenHabitante != null;

  // "nombreHabitante" field.
  String? _nombreHabitante;
  String get nombreHabitante => _nombreHabitante ?? '';
  bool hasNombreHabitante() => _nombreHabitante != null;

  // "audioHabitante" field.
  String? _audioHabitante;
  String get audioHabitante => _audioHabitante ?? '';
  bool hasAudioHabitante() => _audioHabitante != null;

  // "tituloseccion2" field.
  String? _tituloseccion2;
  String get tituloseccion2 => _tituloseccion2 ?? '';
  bool hasTituloseccion2() => _tituloseccion2 != null;

  // "habitantePeriodo" field.
  List<HabitantePeriodosStruct>? _habitantePeriodo;
  List<HabitantePeriodosStruct> get habitantePeriodo =>
      _habitantePeriodo ?? const [];
  bool hasHabitantePeriodo() => _habitantePeriodo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _subtituloSeccion = snapshotData['subtituloSeccion'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagenHabitante = snapshotData['imagenHabitante'] as String?;
    _nombreHabitante = snapshotData['nombreHabitante'] as String?;
    _audioHabitante = snapshotData['audioHabitante'] as String?;
    _tituloseccion2 = snapshotData['tituloseccion2'] as String?;
    _habitantePeriodo = getStructList(
      snapshotData['habitantePeriodo'],
      HabitantePeriodosStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('habitantes')
          : FirebaseFirestore.instance.collectionGroup('habitantes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('habitantes').doc(id);

  static Stream<HabitantesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabitantesRecord.fromSnapshot(s));

  static Future<HabitantesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HabitantesRecord.fromSnapshot(s));

  static HabitantesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HabitantesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabitantesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabitantesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabitantesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabitantesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabitantesRecordData({
  String? tituloSeccion,
  String? subtituloSeccion,
  String? descripcion,
  String? imagenHabitante,
  String? nombreHabitante,
  String? audioHabitante,
  String? tituloseccion2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
      'subtituloSeccion': subtituloSeccion,
      'descripcion': descripcion,
      'imagenHabitante': imagenHabitante,
      'nombreHabitante': nombreHabitante,
      'audioHabitante': audioHabitante,
      'tituloseccion2': tituloseccion2,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabitantesRecordDocumentEquality implements Equality<HabitantesRecord> {
  const HabitantesRecordDocumentEquality();

  @override
  bool equals(HabitantesRecord? e1, HabitantesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        e1?.subtituloSeccion == e2?.subtituloSeccion &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagenHabitante == e2?.imagenHabitante &&
        e1?.nombreHabitante == e2?.nombreHabitante &&
        e1?.audioHabitante == e2?.audioHabitante &&
        e1?.tituloseccion2 == e2?.tituloseccion2 &&
        listEquality.equals(e1?.habitantePeriodo, e2?.habitantePeriodo);
  }

  @override
  int hash(HabitantesRecord? e) => const ListEquality().hash([
        e?.tituloSeccion,
        e?.subtituloSeccion,
        e?.descripcion,
        e?.imagenHabitante,
        e?.nombreHabitante,
        e?.audioHabitante,
        e?.tituloseccion2,
        e?.habitantePeriodo
      ]);

  @override
  bool isValidKey(Object? o) => o is HabitantesRecord;
}
