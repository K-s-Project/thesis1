// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_cubit.dart';

abstract class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object> get props => [];
}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  final List<LessonEntity> lessons;
  const LessonLoaded({
    required this.lessons,
  });
}

class LessonEmpty extends LessonState {}

class Done extends LessonState {}
