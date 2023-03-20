// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class StreamLessons {
  final Repository repo;
  StreamLessons({
    required this.repo,
  });

  Stream<List<LessonEntity>> call() {
    return repo.streamLessons();
  }
}
