// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LessonEntity {
  final String id;
  final String name;
  final String? createdAt;
  final Activity1Entity activity1;
  final Activity2Entity activity2;
  final Activity3Entity activity3;
  final String learningActPdf;
  final List? reflection;
  final List? students;
  LessonEntity({
    required this.id,
    required this.name,
    this.createdAt,
    required this.activity1,
    required this.activity2,
    required this.activity3,
    required this.learningActPdf,
    this.reflection,
    this.students,
  });
}

class Activity1Entity extends Equatable {
  final List<FITBEntity> fitbs;
  final String pdf;
  final String directions;
  const Activity1Entity({
    required this.fitbs,
    required this.pdf,
    required this.directions,
  });
  @override
  List<Object?> get props => [fitbs];
}

class FITBEntity {
  final String jumbledWord;
  final String pronounciation;
  final String definition;
  final String answer;
  final String sentence;
  FITBEntity({
    required this.jumbledWord,
    required this.pronounciation,
    required this.definition,
    required this.answer,
    required this.sentence,
  });
}

class Activity2Entity extends Equatable {
  final String pdf;
  final String? videoLink;
  final List<String> questions;
  final String directions;

  const Activity2Entity({
    required this.pdf,
    this.videoLink,
    required this.questions,
    required this.directions,
  });

  @override
  List<Object?> get props => [questions];
}

class Activity3Entity extends Equatable {
  final String pdf;
  final String? videoLink;
  final String directions;

  final List<MultipleChoiceEntity> multipleChoices;
  const Activity3Entity({
    required this.pdf,
    this.videoLink,
    required this.directions,
    required this.multipleChoices,
  });
  @override
  List<Object?> get props => [multipleChoices];
}

class MultipleChoiceEntity {
  final String answer;
  final String question;
  final List<String> choices;
  MultipleChoiceEntity({
    required this.answer,
    required this.question,
    required this.choices,
  });
}
