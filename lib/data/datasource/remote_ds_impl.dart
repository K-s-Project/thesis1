import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:thesis1/core/dto/update_profile_dto.dart';
import 'package:thesis1/data/datasource/remote_ds.dart';
import 'package:thesis1/data/model/lesson_model.dart';
import 'package:thesis1/data/model/note_model.dart';
import 'package:thesis1/data/model/student_model.dart';

import '../model/record_model.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  Stream<User?> checkUser() => auth.userChanges();

  @override
  Future<void> createUser(StudentModel student) async {
    await db.collection('student').doc(student.uid).set(student.toJson());
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<String?> register({
    required String email,
    required String password,
  }) async {
    final userCreds = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCreds.user?.uid;
  }

  @override
  Future<StudentModel> fetchStudentById({required String id}) async {
    final snapshot = await db.collection('student').doc(id).get();
    return StudentModel.fromJson(snapshot.data()!);
  }

  @override
  Future<void> updateProfile({
    required UpdateProfileDto updateProfileDto,
  }) async {
    await db.collection('student').doc(updateProfileDto.uid).update({
      'firstName': updateProfileDto.firstName,
      'lastName': updateProfileDto.lastName,
      'grade': updateProfileDto.grade,
      'section': updateProfileDto.section,
      'lrn': updateProfileDto.lrn,
      'imageUrl': updateProfileDto.image,
    });
  }

  @override
  Future<String> getDlUrl({required String path}) async {
    final url = await storage.ref(path).getDownloadURL();
    return url;
  }

  @override
  Future<void> uploadToStorage({File? file, required String path}) async {
    await storage.ref(path).putFile(file ?? File(path));
  }

  @override
  Future<void> logout() async => await auth.signOut();

  @override
  Future<bool> isAdmin({required String uid}) async {
    final user = await db.collection('admin').doc(uid).get();
    if (user.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> addLesson({required LessonModel lesson}) async {
    await db.collection('lessons').doc(lesson.id).set(lesson.tojson());
  }

  @override
  Future<void> uploadPdfToStorage({
    required File file,
    required String path,
  }) async {
    await storage.ref(path).putFile(file);
  }

  @override
  Stream<List<LessonModel>> streamLessons() {
    final lessons = db
        .collection('lessons')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => LessonModel.fromJson(e.data())).toList());
    return lessons;
  }

  @override
  Future<void> addStudentRecord({
    required String userId,
    required String lessonId,
    required RecordModel record,
  }) async {
    await db
        .collection('student')
        .doc(userId)
        .collection('lessons')
        .doc(lessonId)
        .set(record.toJson())
        .then(
      (value) async {
        await db.collection('lessons').doc(lessonId).update({
          'students': FieldValue.arrayUnion(
            [userId],
          ),
        });
      },
    );
  }

  @override
  Future<void> addInitialRecord({
    required String userId,
    required String id,
    required RecordModel record,
  }) async {
    final ref = await db
        .collection('student')
        .doc(userId)
        .collection('records')
        .doc(id)
        .get();
    if (ref.data() != null) {
      await db
          .collection('student')
          .doc(userId)
          .collection('records')
          .doc(id)
          .update(record.toJson());
    } else {
      await db
          .collection('student')
          .doc(userId)
          .collection('records')
          .doc(id)
          .set(record.toJson());
    }
  }

  @override
  Future<RecordModel> fetchRecordLoc({
    required String userId,
    required String id,
  }) async {
    final ref = await db
        .collection('student')
        .doc(userId)
        .collection('records')
        .doc(id)
        .get();
    if (ref.data() != null) {
      return RecordModel.fromJson(ref.data()!);
    } else {
      return RecordModel.empty();
    }
  }

  @override
  Future<void> updateActs({
    required String userId,
    required String id,
    required List<ActivityModel> act,
    required String key,
  }) async {
    await db
        .collection('student')
        .doc(userId)
        .collection('records')
        .doc(id)
        .update({
      key: act.map((e) => ActivityModel.fromE(e).toJson()).toList(),
    });
  }

  @override
  Future<void> createNote({
    required String userId,
    required NoteModel note,
  }) async {
    await db
        .collection('student')
        .doc(userId)
        .collection('notes')
        .doc(note.id)
        .set(note.toJson());
  }

  @override
  Future<List<NoteModel>> fetchNotes({required String userId}) async {
    final ref = db.collection('student').doc(userId).collection('notes');
    final snapshot = await ref.orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((e) => NoteModel.fromJson(e.data())).toList();
  }

  @override
  Future<void> updateNote(
      {required String userId, required NoteModel note}) async {
    await db
        .collection('student')
        .doc(userId)
        .collection('notes')
        .doc(note.id)
        .update({
      'title': note.title,
      'body': note.body,
      'createdAt': note.createdAt,
    });
  }

  @override
  Future<void> deleteLesson({required String id}) async {
    await db.collection('lessons').doc(id).delete();
  }
}
