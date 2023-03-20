// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

import '../../entity/record_entity.dart';

class UpdateActs {
  final Repository repo;
  UpdateActs({
    required this.repo,
  });

  Future<void> call({
    required String userId,
    required String id,
    required List<ActivityEntity> act,
    required String key,
  }) async {
    await repo.updateActs(userId: userId, id: id, act: act, key: key);
  }
}
