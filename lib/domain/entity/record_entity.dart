// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RecordEntity extends Equatable {
  final String id;
  final String name;
  final String? createdAt;
  final List<ActivityEntity>? activity1;
  final List<ActivityEntity>? activity2;
  final List<ActivityEntity>? activity3;
  final List reflections;
  final String feedback;
  const RecordEntity({
    required this.id,
    required this.name,
    this.createdAt,
    this.activity1,
    this.activity2,
    this.activity3,
    required this.reflections,
    required this.feedback,
  });

  @override
  List<Object?> get props => [
        activity1,
        activity2,
        activity3,
      ];
}

class ActivityEntity {
  String question;
  String answer;
  bool correct;
  ActivityEntity({
    required this.question,
    required this.answer,
    required this.correct,
  });
}
