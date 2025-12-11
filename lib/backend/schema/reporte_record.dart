import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReporteRecord extends FirestoreRecord {
  ReporteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagenPortada" field.
  String? _imagenPortada;
  String get imagenPortada => _imagenPortada ?? '';
  bool hasImagenPortada() => _imagenPortada != null;

  // "categoriaReporte" field.
  String? _categoriaReporte;
  String get categoriaReporte => _categoriaReporte ?? '';
  bool hasCategoriaReporte() => _categoriaReporte != null;

  // "enlaceDropdown" field.
  String? _enlaceDropdown;
  String get enlaceDropdown => _enlaceDropdown ?? '';
  bool hasEnlaceDropdown() => _enlaceDropdown != null;

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  bool hasHabilitado() => _habilitado != null;

  // "urlDescargable" field.
  String? _urlDescargable;
  String get urlDescargable => _urlDescargable ?? '';
  bool hasUrlDescargable() => _urlDescargable != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagenPortada = snapshotData['imagenPortada'] as String?;
    _categoriaReporte = snapshotData['categoriaReporte'] as String?;
    _enlaceDropdown = snapshotData['enlaceDropdown'] as String?;
    _habilitado = snapshotData['habilitado'] as bool?;
    _urlDescargable = snapshotData['urlDescargable'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reporte');

  static Stream<ReporteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReporteRecord.fromSnapshot(s));

  static Future<ReporteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReporteRecord.fromSnapshot(s));

  static ReporteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReporteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReporteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReporteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReporteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReporteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReporteRecordData({
  String? titulo,
  String? descripcion,
  String? imagenPortada,
  String? categoriaReporte,
  String? enlaceDropdown,
  bool? habilitado,
  String? urlDescargable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descripcion': descripcion,
      'imagenPortada': imagenPortada,
      'categoriaReporte': categoriaReporte,
      'enlaceDropdown': enlaceDropdown,
      'habilitado': habilitado,
      'urlDescargable': urlDescargable,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReporteRecordDocumentEquality implements Equality<ReporteRecord> {
  const ReporteRecordDocumentEquality();

  @override
  bool equals(ReporteRecord? e1, ReporteRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagenPortada == e2?.imagenPortada &&
        e1?.categoriaReporte == e2?.categoriaReporte &&
        e1?.enlaceDropdown == e2?.enlaceDropdown &&
        e1?.habilitado == e2?.habilitado &&
        e1?.urlDescargable == e2?.urlDescargable;
  }

  @override
  int hash(ReporteRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.descripcion,
        e?.imagenPortada,
        e?.categoriaReporte,
        e?.enlaceDropdown,
        e?.habilitado,
        e?.urlDescargable
      ]);

  @override
  bool isValidKey(Object? o) => o is ReporteRecord;
}
