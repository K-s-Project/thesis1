// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class AddLesson {
  final Repository repo;
  AddLesson({
    required this.repo,
  });

  Future<void> call({required LessonEntity lesson}) async {
    await repo.addLesson(lesson: lesson);
  }
}
