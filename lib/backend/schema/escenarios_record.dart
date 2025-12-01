import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EscenariosRecord extends FirestoreRecord {
  EscenariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "subtitulo" field.
  String? _subtitulo;
  String get subtitulo => _subtitulo ?? '';
  bool hasSubtitulo() => _subtitulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagenPrincipal" field.
  String? _imagenPrincipal;
  String get imagenPrincipal => _imagenPrincipal ?? '';
  bool hasImagenPrincipal() => _imagenPrincipal != null;

  // "imagenHabitantes" field.
  List<String>? _imagenHabitantes;
  List<String> get imagenHabitantes => _imagenHabitantes ?? const [];
  bool hasImagenHabitantes() => _imagenHabitantes != null;

  // "cardsData" field.
  List<EscenarioCardDataStruct>? _cardsData;
  List<EscenarioCardDataStruct> get cardsData => _cardsData ?? const [];
  bool hasCardsData() => _cardsData != null;

  // "audioHabitantes" field.
  List<String>? _audioHabitantes;
  List<String> get audioHabitantes => _audioHabitantes ?? const [];
  bool hasAudioHabitantes() => _audioHabitantes != null;

  // "manifestaciones" field.
  List<EscenarioCardManifestacionStruct>? _manifestaciones;
  List<EscenarioCardManifestacionStruct> get manifestaciones =>
      _manifestaciones ?? const [];
  bool hasManifestaciones() => _manifestaciones != null;

  // "numeroEscenario" field.
  int? _numeroEscenario;
  int get numeroEscenario => _numeroEscenario ?? 0;
  bool hasNumeroEscenario() => _numeroEscenario != null;

  // "colorEscenario" field.
  Color? _colorEscenario;
  Color? get colorEscenario => _colorEscenario;
  bool hasColorEscenario() => _colorEscenario != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _subtitulo = snapshotData['subtitulo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagenPrincipal = snapshotData['imagenPrincipal'] as String?;
    _imagenHabitantes = getDataList(snapshotData['imagenHabitantes']);
    _cardsData = getStructList(
      snapshotData['cardsData'],
      EscenarioCardDataStruct.fromMap,
    );
    _audioHabitantes = getDataList(snapshotData['audioHabitantes']);
    _manifestaciones = getStructList(
      snapshotData['manifestaciones'],
      EscenarioCardManifestacionStruct.fromMap,
    );
    _numeroEscenario = castToType<int>(snapshotData['numeroEscenario']);
    _colorEscenario = getSchemaColor(snapshotData['colorEscenario']);
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
  String? titulo,
  String? subtitulo,
  String? descripcion,
  String? imagenPrincipal,
  int? numeroEscenario,
  Color? colorEscenario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'subtitulo': subtitulo,
      'descripcion': descripcion,
      'imagenPrincipal': imagenPrincipal,
      'numeroEscenario': numeroEscenario,
      'colorEscenario': colorEscenario,
    }.withoutNulls,
  );

  return firestoreData;
}

class EscenariosRecordDocumentEquality implements Equality<EscenariosRecord> {
  const EscenariosRecordDocumentEquality();

  @override
  bool equals(EscenariosRecord? e1, EscenariosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titulo == e2?.titulo &&
        e1?.subtitulo == e2?.subtitulo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagenPrincipal == e2?.imagenPrincipal &&
        listEquality.equals(e1?.imagenHabitantes, e2?.imagenHabitantes) &&
        listEquality.equals(e1?.cardsData, e2?.cardsData) &&
        listEquality.equals(e1?.audioHabitantes, e2?.audioHabitantes) &&
        listEquality.equals(e1?.manifestaciones, e2?.manifestaciones) &&
        e1?.numeroEscenario == e2?.numeroEscenario &&
        e1?.colorEscenario == e2?.colorEscenario;
  }

  @override
  int hash(EscenariosRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.subtitulo,
        e?.descripcion,
        e?.imagenPrincipal,
        e?.imagenHabitantes,
        e?.cardsData,
        e?.audioHabitantes,
        e?.manifestaciones,
        e?.numeroEscenario,
        e?.colorEscenario
      ]);

  @override
  bool isValidKey(Object? o) => o is EscenariosRecord;
}
