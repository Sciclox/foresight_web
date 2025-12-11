import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CifrasRecord extends FirestoreRecord {
  CifrasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tituloSeccion" field.
  String? _tituloSeccion;
  String get tituloSeccion => _tituloSeccion ?? '';
  bool hasTituloSeccion() => _tituloSeccion != null;

  // "cifras" field.
  List<HabitanteCardStruct>? _cifras;
  List<HabitanteCardStruct> get cifras => _cifras ?? const [];
  bool hasCifras() => _cifras != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _cifras = getStructList(
      snapshotData['cifras'],
      HabitanteCardStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cifras')
          : FirebaseFirestore.instance.collectionGroup('cifras');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cifras').doc(id);

  static Stream<CifrasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CifrasRecord.fromSnapshot(s));

  static Future<CifrasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CifrasRecord.fromSnapshot(s));

  static CifrasRecord fromSnapshot(DocumentSnapshot snapshot) => CifrasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CifrasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CifrasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CifrasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CifrasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCifrasRecordData({
  String? tituloSeccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class CifrasRecordDocumentEquality implements Equality<CifrasRecord> {
  const CifrasRecordDocumentEquality();

  @override
  bool equals(CifrasRecord? e1, CifrasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        listEquality.equals(e1?.cifras, e2?.cifras);
  }

  @override
  int hash(CifrasRecord? e) =>
      const ListEquality().hash([e?.tituloSeccion, e?.cifras]);

  @override
  bool isValidKey(Object? o) => o is CifrasRecord;
}
