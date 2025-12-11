import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcesosRecord extends FirestoreRecord {
  ProcesosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tituloSeccion" field.
  String? _tituloSeccion;
  String get tituloSeccion => _tituloSeccion ?? '';
  bool hasTituloSeccion() => _tituloSeccion != null;

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  bool hasHabilitado() => _habilitado != null;

  // "senales" field.
  List<HabitantePeriodosStruct>? _senales;
  List<HabitantePeriodosStruct> get senales => _senales ?? const [];
  bool hasSenales() => _senales != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _habilitado = snapshotData['habilitado'] as bool?;
    _senales = getStructList(
      snapshotData['senales'],
      HabitantePeriodosStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('procesos')
          : FirebaseFirestore.instance.collectionGroup('procesos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('procesos').doc(id);

  static Stream<ProcesosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProcesosRecord.fromSnapshot(s));

  static Future<ProcesosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProcesosRecord.fromSnapshot(s));

  static ProcesosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProcesosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProcesosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProcesosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProcesosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProcesosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProcesosRecordData({
  String? tituloSeccion,
  bool? habilitado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
      'habilitado': habilitado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProcesosRecordDocumentEquality implements Equality<ProcesosRecord> {
  const ProcesosRecordDocumentEquality();

  @override
  bool equals(ProcesosRecord? e1, ProcesosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        e1?.habilitado == e2?.habilitado &&
        listEquality.equals(e1?.senales, e2?.senales);
  }

  @override
  int hash(ProcesosRecord? e) =>
      const ListEquality().hash([e?.tituloSeccion, e?.habilitado, e?.senales]);

  @override
  bool isValidKey(Object? o) => o is ProcesosRecord;
}
