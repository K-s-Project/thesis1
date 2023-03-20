// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class GetRecordLoc {
  final Repository repo;
  GetRecordLoc({
    required this.repo,
  });

  Future<RecordEntity> call({
    required String userId,
    required String id,
  }) async {
    return await repo.fetchRecordLoc(userId: userId, id: id);
  }
}
