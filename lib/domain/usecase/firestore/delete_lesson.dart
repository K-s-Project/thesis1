// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

class DeleteLesson {
  final Repository repo;
  DeleteLesson({
    required this.repo,
  });

  Future<void> call({required String id}) async {
    await repo.deleteLesson(id: id);
  }
}
