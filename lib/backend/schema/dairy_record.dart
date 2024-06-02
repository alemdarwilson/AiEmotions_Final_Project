import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DairyRecord extends FirestoreRecord {
  DairyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "entryDate" field.
  DateTime? _entryDate;
  DateTime? get entryDate => _entryDate;
  bool hasEntryDate() => _entryDate != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "emotion" field.
  String? _emotion;
  String get emotion => _emotion ?? '';
  bool hasEmotion() => _emotion != null;

  void _initializeFields() {
    _entryDate = snapshotData['entryDate'] as DateTime?;
    _photoUrl = snapshotData['photoUrl'] as String?;
    _userId = snapshotData['userId'] as String?;
    _emotion = snapshotData['emotion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dairy');

  static Stream<DairyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DairyRecord.fromSnapshot(s));

  static Future<DairyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DairyRecord.fromSnapshot(s));

  static DairyRecord fromSnapshot(DocumentSnapshot snapshot) => DairyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DairyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DairyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DairyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DairyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDairyRecordData({
  DateTime? entryDate,
  String? photoUrl,
  String? userId,
  String? emotion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'entryDate': entryDate,
      'photoUrl': photoUrl,
      'userId': userId,
      'emotion': emotion,
    }.withoutNulls,
  );

  return firestoreData;
}

class DairyRecordDocumentEquality implements Equality<DairyRecord> {
  const DairyRecordDocumentEquality();

  @override
  bool equals(DairyRecord? e1, DairyRecord? e2) {
    return e1?.entryDate == e2?.entryDate &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.userId == e2?.userId &&
        e1?.emotion == e2?.emotion;
  }

  @override
  int hash(DairyRecord? e) => const ListEquality()
      .hash([e?.entryDate, e?.photoUrl, e?.userId, e?.emotion]);

  @override
  bool isValidKey(Object? o) => o is DairyRecord;
}
