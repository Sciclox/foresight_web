import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TendenciasRecord extends FirestoreRecord {
  TendenciasRecord._(
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

  // "tendencias" field.
  TendenciasListStruct? _tendencias;
  TendenciasListStruct get tendencias => _tendencias ?? TendenciasListStruct();
  bool hasTendencias() => _tendencias != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tituloSeccion = snapshotData['tituloSeccion'] as String?;
    _subtituloSeccion = snapshotData['subtituloSeccion'] as String?;
    
    // Manejar el caso donde tendencias puede ser:
    // 1. Una lista (cuando se guarda con getTendenciasListListFirestoreData) - formato antiguo
    // 2. Un mapa anidado (cuando se guarda con addTendenciasListStructData) - formato nuevo
    // 3. Un TendenciasListStruct directo (caso raro)
    final tendenciasData = snapshotData['tendencias'];
    if (tendenciasData is TendenciasListStruct) {
      _tendencias = tendenciasData;
    } else if (tendenciasData is List && tendenciasData.isNotEmpty) {
      // Si es una lista, tomar el primer elemento y parsearlo
      final firstItem = tendenciasData[0];
      if (firstItem is Map<String, dynamic>) {
        _tendencias = TendenciasListStruct.maybeFromMap(firstItem);
      } else {
        _tendencias = null;
      }
    } else if (tendenciasData is Map<String, dynamic>) {
      // Si es un Map (formato nuevo con addTendenciasListStructData),
      // parsearlo directamente como TendenciasListStruct
      _tendencias = TendenciasListStruct.maybeFromMap(tendenciasData);
    } else {
      _tendencias = null;
    }
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tendencias')
          : FirebaseFirestore.instance.collectionGroup('tendencias');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tendencias').doc(id);

  static Stream<TendenciasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TendenciasRecord.fromSnapshot(s));

  static Future<TendenciasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TendenciasRecord.fromSnapshot(s));

  static TendenciasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TendenciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TendenciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TendenciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TendenciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TendenciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTendenciasRecordData({
  String? tituloSeccion,
  String? subtituloSeccion,
  TendenciasListStruct? tendencias,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloSeccion': tituloSeccion,
      'subtituloSeccion': subtituloSeccion,
      'tendencias': TendenciasListStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "tendencias" field.
  addTendenciasListStructData(firestoreData, tendencias, 'tendencias');

  return firestoreData;
}

class TendenciasRecordDocumentEquality implements Equality<TendenciasRecord> {
  const TendenciasRecordDocumentEquality();

  @override
  bool equals(TendenciasRecord? e1, TendenciasRecord? e2) {
    return e1?.tituloSeccion == e2?.tituloSeccion &&
        e1?.subtituloSeccion == e2?.subtituloSeccion &&
        e1?.tendencias == e2?.tendencias;
  }

  @override
  int hash(TendenciasRecord? e) => const ListEquality()
      .hash([e?.tituloSeccion, e?.subtituloSeccion, e?.tendencias]);

  @override
  bool isValidKey(Object? o) => o is TendenciasRecord;
}
