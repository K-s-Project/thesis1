import 'package:hive/hive.dart';

import '../../domain/entity/record_entity.dart';

@HiveType(typeId: 0)
class RecordModel extends RecordEntity {
  const RecordModel({
    required super.id,
    required super.name,
    required super.createdAt,
    super.activity1,
    super.activity2,
    super.activity3,
    required super.reflections,
    required super.feedback,
  });
  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      activity1: List<ActivityModel>.from(
          json["activity1"].map((x) => ActivityModel.fromJson(x))),
      activity2: List<ActivityModel>.from(
          json["activity2"].map((x) => ActivityModel.fromJson(x))),
      activity3: List<ActivityModel>.from(
          json["activity3"].map((x) => ActivityModel.fromJson(x))),
      reflections: json['reflections'],
      feedback: json['feedback'],
    );
  }
  factory RecordModel.fromE(RecordEntity entity) {
    return RecordModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      activity1: entity.activity1,
      activity2: entity.activity2,
      activity3: entity.activity3,
      reflections: entity.reflections,
      feedback: entity.feedback,
    );
  }
  factory RecordModel.empty() {
    return const RecordModel(
      id: '',
      name: '',
      createdAt: '',
      activity1: [],
      activity2: [],
      activity3: [],
      reflections: [],
      feedback: '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'activity1':
          activity1?.map((e) => ActivityModel.fromE(e).toJson()).toList(),
      'activity2':
          activity2?.map((e) => ActivityModel.fromE(e).toJson()).toList(),
      'activity3':
          activity3?.map((e) => ActivityModel.fromE(e).toJson()).toList(),
      'reflections': reflections,
      'feedback': feedback,
    };
  }
}

@HiveType(typeId: 1)
class ActivityModel extends ActivityEntity {
  ActivityModel({
    required super.answer,
    required super.correct,
    required super.question,
  });
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      answer: json['answer'],
      correct: json['correct'],
      question: json['question'],
    );
  }
  factory ActivityModel.fromE(ActivityEntity entity) {
    return ActivityModel(
      answer: entity.answer,
      correct: entity.correct,
      question: entity.question,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'question': question,
    };
  }
}
