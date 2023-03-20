// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class AddInitialRecord {
  final Repository repo;
  AddInitialRecord({
    required this.repo,
  });

  Future<void> call({
    required String userId,
    required String id,
    required RecordEntity record,
  }) async {
    await repo.addInitialRecord(
      userId: userId,
      id: id,
      record: record,
    );
  }
}
