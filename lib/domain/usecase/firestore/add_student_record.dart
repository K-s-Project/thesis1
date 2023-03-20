// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

import '../../entity/record_entity.dart';

class AddStudentRecord {
  final Repository repo;
  AddStudentRecord({
    required this.repo,
  });
  Future<void> call({
    required String userId,
    required String lessonId,
    required RecordEntity record,
  }) async {
    await repo.addStudentRecord(
      userId: userId,
      lessonId: lessonId,
      record: record,
    );
  }
}
