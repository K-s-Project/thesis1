// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/domain/usecase/firestore/add_lesson.dart';
import 'package:thesis1/domain/usecase/firestore/delete_lesson.dart';
import 'package:thesis1/domain/usecase/firestore/stream_lessons.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit(
    this.addLesson,
    this.streamLessons,
    this.deleteLesson,
  ) : super(LessonInitial());
  final AddLesson addLesson;
  final StreamLessons streamLessons;
  final DeleteLesson deleteLesson;

  Future<void> onAddLesson({required LessonEntity lesson}) async {
    emit(LessonLoading());
    await addLesson(lesson: lesson);
  }

  Future<void> onDeleteLesson({required String id}) async {
    await deleteLesson(id: id);
  }

  void onStreamLessons() {
    print('calling');
    final lessons = streamLessons();
    lessons.listen((lessonsData) {
      print('calling $lessonsData');
      if (lessonsData.isEmpty) {
        emit(LessonEmpty());
      } else {
        emit(LessonLoaded(lessons: lessonsData));
      }
    });
  }
}
