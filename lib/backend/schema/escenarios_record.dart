import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EscenariosRecord extends FirestoreRecord {
  EscenariosRecord._(
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

  // "escenarios" field.
  List<EscenariosListStruct>? _escenarios;
  List<EscenariosListStruct> get escenarios => _escenarios ?? const [];
  bool hasEscenarios() => _escenarios != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _subtituloSeccion = snapshotData['subtituloSeccion'] as String?;
    _escenarios = getStructList(
      snapshotData['escenarios'],
      EscenariosListStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('escenarios')
          : FirebaseFirestore.instance.collectionGroup('escenarios');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('escenarios').doc(id);

  static Stream<EscenariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EscenariosRecord.fromSnapshot(s));

  static Future<EscenariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EscenariosRecord.fromSnapshot(s));

  static EscenariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EscenariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EscenariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EscenariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EscenariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EscenariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEscenariosRecordData({
  String? tituloSeccion,
  String? subtituloSeccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
      'subtituloSeccion': subtituloSeccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class EscenariosRecordDocumentEquality implements Equality<EscenariosRecord> {
  const EscenariosRecordDocumentEquality();

  @override
  bool equals(EscenariosRecord? e1, EscenariosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        e1?.subtituloSeccion == e2?.subtituloSeccion &&
        listEquality.equals(e1?.escenarios, e2?.escenarios);
  }

  @override
  int hash(EscenariosRecord? e) => const ListEquality()
      .hash([e?.tituloSeccion, e?.subtituloSeccion, e?.escenarios]);

  @override
  bool isValidKey(Object? o) => o is EscenariosRecord;
}
