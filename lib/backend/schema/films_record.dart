import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilmsRecord extends FirestoreRecord {
  FilmsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "Premiere" field.
  String? _premiere;
  String get premiere => _premiere ?? '';
  bool hasPremiere() => _premiere != null;

  // "Runtime" field.
  int? _runtime;
  int get runtime => _runtime ?? 0;
  bool hasRuntime() => _runtime != null;

  // "Language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "filmId" field.
  int? _filmId;
  int get filmId => _filmId ?? 0;
  bool hasFilmId() => _filmId != null;

  // "IMDBScore" field.
  String? _iMDBScore;
  String get iMDBScore => _iMDBScore ?? '';
  bool hasIMDBScore() => _iMDBScore != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _genre = snapshotData['Genre'] as String?;
    _premiere = snapshotData['Premiere'] as String?;
    _runtime = castToType<int>(snapshotData['Runtime']);
    _language = snapshotData['Language'] as String?;
    _filmId = castToType<int>(snapshotData['filmId']);
    _iMDBScore = snapshotData['IMDBScore'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('films');

  static Stream<FilmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilmsRecord.fromSnapshot(s));

  static Future<FilmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilmsRecord.fromSnapshot(s));

  static FilmsRecord fromSnapshot(DocumentSnapshot snapshot) => FilmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilmsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilmsRecordData({
  String? title,
  String? genre,
  String? premiere,
  int? runtime,
  String? language,
  int? filmId,
  String? iMDBScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Genre': genre,
      'Premiere': premiere,
      'Runtime': runtime,
      'Language': language,
      'filmId': filmId,
      'IMDBScore': iMDBScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilmsRecordDocumentEquality implements Equality<FilmsRecord> {
  const FilmsRecordDocumentEquality();

  @override
  bool equals(FilmsRecord? e1, FilmsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.genre == e2?.genre &&
        e1?.premiere == e2?.premiere &&
        e1?.runtime == e2?.runtime &&
        e1?.language == e2?.language &&
        e1?.filmId == e2?.filmId &&
        e1?.iMDBScore == e2?.iMDBScore;
  }

  @override
  int hash(FilmsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.genre,
        e?.premiere,
        e?.runtime,
        e?.language,
        e?.filmId,
        e?.iMDBScore
      ]);

  @override
  bool isValidKey(Object? o) => o is FilmsRecord;
}
