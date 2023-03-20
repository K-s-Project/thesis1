import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis1/core/error/failure.dart';
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/entity/student_entity.dart';

import '../../core/dto/update_profile_dto.dart';

abstract class Repository {
  Stream<User?> checkUser();
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, String?>> register({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> createUser(StudentEntity student);
  Future<Either<Failure, StudentEntity>> fetchStudentById({required String id});
  Future<void> updateProfile({required UpdateProfileDto updateProfileDto});
  Future<void> uploadToStorage({
    File? file,
    required String path,
  });
  Future<String> getDlUrl({required String path});
  Future<void> logout();
  Future<bool> isAdmin({required String uid});
  Future<void> addLesson({required LessonEntity lesson});
  Stream<List<LessonEntity>> streamLessons();
  Future<void> addStudentRecord({
    required String userId,
    required String lessonId,
    required RecordEntity record,
  });
  Future<void> addInitialRecord({
    required String userId,
    required String id,
    required RecordEntity record,
  });
  Future<RecordEntity> fetchRecordLoc({
    required String userId,
    required String id,
  });
  Future<void> updateActs({
    required String userId,
    required String id,
    required List<ActivityEntity> act,
    required String key,
  });
  Future<void> createNote({required String userId, required NoteEntity note});
  Future<List<NoteEntity>> fetchNotes({required String userId});
  Future<void> updateNote({required String userId, required NoteEntity note});
  Future<void> deleteLesson({required String id});
}
