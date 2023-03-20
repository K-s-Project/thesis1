// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:thesis1/core/constants/errorcode.dart';
import 'package:thesis1/core/dto/update_profile_dto.dart';
import 'package:thesis1/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:thesis1/data/datasource/remote_ds.dart';
import 'package:thesis1/data/model/lesson_model.dart';
import 'package:thesis1/data/model/record_model.dart';
import 'package:thesis1/data/model/student_model.dart';
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/entity/student_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

import '../model/note_model.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  RepositoryImpl({
    required this.remote,
  });

  @override
  Stream<User?> checkUser() => remote.checkUser();

  @override
  Future<Either<Failure, void>> createUser(StudentEntity student) async {
    try {
      await remote.createUser(StudentModel.fromE(student));
      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await remote.login(email: email, password: password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(errorCode(e.code)));
    }
  }

  @override
  Future<Either<Failure, String?>> register({
    required String email,
    required String password,
  }) async {
    try {
      final uid = await remote.register(email: email, password: password);
      return Right(uid);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(errorCode(e.code)));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> fetchStudentById({
    required String id,
  }) async {
    try {
      final user = await remote.fetchStudentById(id: id);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(errorCode(e.code)));
    }
  }

  @override
  Future<String> getDlUrl({required String path}) async =>
      await remote.getDlUrl(path: path);

  @override
  Future<void> updateProfile(
      {required UpdateProfileDto updateProfileDto}) async {
    try {
      await remote.updateProfile(updateProfileDto: updateProfileDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadToStorage({File? file, required String path}) async {
    await remote.uploadToStorage(path: path, file: file);
  }

  @override
  Future<void> logout() async => await remote.logout();

  @override
  Future<bool> isAdmin({required String uid}) async {
    try {
      return await remote.isAdmin(uid: uid);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addLesson({required LessonEntity lesson}) async {
    try {
      await remote.addLesson(lesson: LessonModel.fromE(lesson));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<LessonEntity>> streamLessons() {
    try {
      return remote.streamLessons();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addStudentRecord({
    required String userId,
    required String lessonId,
    required RecordEntity record,
  }) async {
    try {
      await remote.addStudentRecord(
          userId: userId,
          lessonId: lessonId,
          record: RecordModel.fromE(record));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addInitialRecord({
    required String userId,
    required String id,
    required RecordEntity record,
  }) async {
    try {
      await remote.addInitialRecord(
        userId: userId,
        id: id,
        record: RecordModel.fromE(record),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RecordEntity> fetchRecordLoc({
    required String userId,
    required String id,
  }) async {
    try {
      return await remote.fetchRecordLoc(
        userId: userId,
        id: id,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateActs({
    required String userId,
    required String id,
    required List<ActivityEntity> act,
    required String key,
  }) async {
    try {
      await remote.updateActs(
        userId: userId,
        id: id,
        act: List<ActivityModel>.from(act.map((x) => ActivityModel.fromE(x))),
        key: key,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createNote(
      {required String userId, required NoteEntity note}) async {
    try {
      await remote.createNote(userId: userId, note: NoteModel.fromE(note));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NoteEntity>> fetchNotes({required String userId}) async {
    try {
      return await remote.fetchNotes(userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNote(
      {required String userId, required NoteEntity note}) async {
    try {
      await remote.updateNote(userId: userId, note: NoteModel.fromE(note));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteLesson({required String id}) async {
    try {
      await remote.deleteLesson(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
