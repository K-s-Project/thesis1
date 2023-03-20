import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis1/core/dto/update_profile_dto.dart';
import 'package:thesis1/data/model/lesson_model.dart';
import 'package:thesis1/data/model/note_model.dart';
import 'package:thesis1/data/model/record_model.dart';
import 'package:thesis1/data/model/student_model.dart';

abstract class RemoteDatasource {
  Stream<User?> checkUser();
  Future<void> login({
    required String email,
    required String password,
  });
  Future<String?> register({
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<void> createUser(StudentModel student);
  Future<StudentModel> fetchStudentById({required String id});
  Future<void> updateProfile({required UpdateProfileDto updateProfileDto});
  Future<void> uploadToStorage({
    File? file,
    required String path,
  });
  Future<String> getDlUrl({required String path});
  Future<bool> isAdmin({required String uid});
  Future<void> addLesson({required LessonModel lesson});
  Future<void> uploadPdfToStorage({required File file, required String path});
  Stream<List<LessonModel>> streamLessons();
  Future<void> addStudentRecord({
    required String userId,
    required String lessonId,
    required RecordModel record,
  });
  Future<void> addInitialRecord({
    required String userId,
    required String id,
    required RecordModel record,
  });
  Future<RecordModel> fetchRecordLoc({
    required String userId,
    required String id,
  });
  Future<void> updateActs({
    required String userId,
    required String id,
    required List<ActivityModel> act,
    required String key,
  });

  Future<void> createNote({required String userId, required NoteModel note});
  Future<List<NoteModel>> fetchNotes({required String userId});
  Future<void> updateNote({required String userId, required NoteModel note});
  Future<void> deleteLesson({required String id});
}
