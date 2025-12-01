import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TendenciasRecord extends FirestoreRecord {
  TendenciasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "frase" field.
  String? _frase;
  String get frase => _frase ?? '';
  bool hasFrase() => _frase != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "senales" field.
  List<SenalesStruct>? _senales;
  List<SenalesStruct> get senales => _senales ?? const [];
  bool hasSenales() => _senales != null;

  // "probabilidaad" field.
  String? _probabilidaad;
  String get probabilidaad => _probabilidaad ?? '';
  bool hasProbabilidaad() => _probabilidaad != null;

  // "impactos" field.
  List<String>? _impactos;
  List<String> get impactos => _impactos ?? const [];
  bool hasImpactos() => _impactos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _frase = snapshotData['frase'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _senales = getStructList(
      snapshotData['senales'],
      SenalesStruct.fromMap,
    );
    _probabilidaad = snapshotData['probabilidaad'] as String?;
    _impactos = getDataList(snapshotData['impactos']);
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
  String? titulo,
  String? frase,
  String? descripcion,
  String? probabilidaad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'frase': frase,
      'descripcion': descripcion,
      'probabilidaad': probabilidaad,
    }.withoutNulls,
  );

  return firestoreData;
}

class TendenciasRecordDocumentEquality implements Equality<TendenciasRecord> {
  const TendenciasRecordDocumentEquality();

  @override
  bool equals(TendenciasRecord? e1, TendenciasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titulo == e2?.titulo &&
        e1?.frase == e2?.frase &&
        e1?.descripcion == e2?.descripcion &&
        listEquality.equals(e1?.senales, e2?.senales) &&
        e1?.probabilidaad == e2?.probabilidaad &&
        listEquality.equals(e1?.impactos, e2?.impactos);
  }

  @override
  int hash(TendenciasRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.frase,
        e?.descripcion,
        e?.senales,
        e?.probabilidaad,
        e?.impactos
      ]);

  @override
  bool isValidKey(Object? o) => o is TendenciasRecord;
}
