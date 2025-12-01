import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IniciativasRecord extends FirestoreRecord {
  IniciativasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "iniciativaCards" field.
  List<IniciativaCardStruct>? _iniciativaCards;
  List<IniciativaCardStruct> get iniciativaCards =>
      _iniciativaCards ?? const [];
  bool hasIniciativaCards() => _iniciativaCards != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _iniciativaCards = getStructList(
      snapshotData['iniciativaCards'],
      IniciativaCardStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('iniciativas')
          : FirebaseFirestore.instance.collectionGroup('iniciativas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('iniciativas').doc(id);

  static Stream<IniciativasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IniciativasRecord.fromSnapshot(s));

  static Future<IniciativasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IniciativasRecord.fromSnapshot(s));

  static IniciativasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IniciativasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IniciativasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IniciativasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IniciativasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IniciativasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIniciativasRecordData({
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class IniciativasRecordDocumentEquality implements Equality<IniciativasRecord> {
  const IniciativasRecordDocumentEquality();

  @override
  bool equals(IniciativasRecord? e1, IniciativasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titulo == e2?.titulo &&
        listEquality.equals(e1?.iniciativaCards, e2?.iniciativaCards);
  }

  @override
  int hash(IniciativasRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.iniciativaCards]);

  @override
  bool isValidKey(Object? o) => o is IniciativasRecord;
}
