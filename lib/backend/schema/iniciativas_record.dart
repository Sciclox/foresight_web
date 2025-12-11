import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IniciativasRecord extends FirestoreRecord {
  IniciativasRecord._(
    super.reference,
    super.data,
  ) {
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

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  bool hasHabilitado() => _habilitado != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _subtituloSeccion = snapshotData['subtituloSeccion'] as String?;
    _habilitado = snapshotData['habilitado'] as bool?;
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
  String? tituloSeccion,
  String? subtituloSeccion,
  bool? habilitado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
      'subtituloSeccion': subtituloSeccion,
      'habilitado': habilitado,
    }.withoutNulls,
  );

  return firestoreData;
}

class IniciativasRecordDocumentEquality implements Equality<IniciativasRecord> {
  const IniciativasRecordDocumentEquality();

  @override
  bool equals(IniciativasRecord? e1, IniciativasRecord? e2) {
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        e1?.subtituloSeccion == e2?.subtituloSeccion &&
        e1?.habilitado == e2?.habilitado;
  }

  @override
  int hash(IniciativasRecord? e) =>
      const ListEquality().hash([e?.tituloSeccion, e?.subtituloSeccion, e?.habilitado]);

  @override
  bool isValidKey(Object? o) => o is IniciativasRecord;
}
