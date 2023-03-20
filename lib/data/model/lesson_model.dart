// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/lesson_entity.dart';

class LessonModel extends LessonEntity {
  LessonModel({
    required super.id,
    required super.name,
    super.createdAt,
    required super.activity1,
    required super.activity2,
    required super.activity3,
    required super.learningActPdf,
    super.reflection,
    super.students,
  });
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      activity1: Activity1Model.fromJson(json['activity1']),
      activity2: Activity2Model.fromJson(json['activity2']),
      activity3: Activity3Model.fromJson(json['activity3']),
      learningActPdf: json['learningActPdf'],
      reflection: json['reflection'],
      students: json['students'],
    );
  }
  factory LessonModel.fromE(LessonEntity entity) {
    return LessonModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      activity1: Activity1Model.fromE(entity.activity1),
      activity2: Activity2Model.fromE(entity.activity2),
      activity3: Activity3Model.fromE(entity.activity3),
      learningActPdf: entity.learningActPdf,
      reflection: entity.reflection,
      students: entity.students,
    );
  }
  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'createdAt': createdAt,
        'activity1': Activity1Model.fromE(activity1).tojson(),
        'activity2': Activity2Model.fromE(activity2).tojson(),
        'activity3': Activity3Model.fromE(activity3).tojson(),
        'learningActPdf': learningActPdf,
        'reflection': reflection,
        'students': students,
      };
}

class Activity1Model extends Activity1Entity {
  const Activity1Model({
    required super.fitbs,
    required super.pdf,
    required super.directions,
  });
  factory Activity1Model.fromJson(Map<String, dynamic> json) {
    return Activity1Model(
        fitbs: List<FITBModel>.from(
            json["fitbs"].map((x) => FITBModel.fromJson(x))),
        pdf: json['pdf'],
        directions: json['directions']);
  }
  factory Activity1Model.fromE(Activity1Entity entity) {
    return Activity1Model(
      fitbs: entity.fitbs,
      pdf: entity.pdf,
      directions: entity.directions,
    );
  }
  Map<String, dynamic> tojson() => {
        'fitbs': fitbs.map((e) => FITBModel.fromE(e).tojson()).toList(),
        'pdf': pdf,
        'directions': directions,
      };
}

class FITBModel extends FITBEntity {
  FITBModel({
    required super.jumbledWord,
    required super.pronounciation,
    required super.definition,
    required super.answer,
    required super.sentence,
  });
  factory FITBModel.fromJson(Map<String, dynamic> json) {
    return FITBModel(
      answer: json['answer'],
      sentence: json['sentence'],
      jumbledWord: json['jumbledWord'],
      pronounciation: json['pronounciation'],
      definition: json['definition'],
    );
  }
  factory FITBModel.fromE(FITBEntity entity) {
    return FITBModel(
      answer: entity.answer,
      definition: entity.definition,
      jumbledWord: entity.jumbledWord,
      sentence: entity.sentence,
      pronounciation: entity.pronounciation,
    );
  }
  Map<String, dynamic> tojson() => {
        'answer': answer,
        'definition': definition,
        'jumbledWord': jumbledWord,
        'sentence': sentence,
        'pronounciation': pronounciation,
      };
}

class Activity2Model extends Activity2Entity {
  const Activity2Model({
    required super.pdf,
    required super.questions,
    super.videoLink,
    required super.directions,
  });
  factory Activity2Model.fromJson(Map<String, dynamic> json) {
    return Activity2Model(
      pdf: json['pdf'],
      questions: List<String>.from(json["questions"].map((x) => x)),
      videoLink: json['videoLink'],
      directions: json['directions'],
    );
  }
  factory Activity2Model.fromE(Activity2Entity entity) {
    return Activity2Model(
      pdf: entity.pdf,
      questions: entity.questions,
      videoLink: entity.videoLink,
      directions: entity.directions,
    );
  }
  Map<String, dynamic> tojson() => {
        'pdf': pdf,
        'questions': questions,
        'videoLink': videoLink,
        'directions': directions,
      };
}

class Activity3Model extends Activity3Entity {
  const Activity3Model({
    required super.pdf,
    required super.multipleChoices,
    super.videoLink,
    required super.directions,
  });
  factory Activity3Model.fromJson(Map<String, dynamic> json) {
    return Activity3Model(
      pdf: json['pdf'],
      multipleChoices: List<MultipleChoiceModel>.from(
          json["multipleChoices"].map((x) => MultipleChoiceModel.fromJson(x))),
      videoLink: json['videoLink'],
      directions: json['directions'],
    );
  }
  factory Activity3Model.fromE(Activity3Entity entity) {
    return Activity3Model(
      pdf: entity.pdf,
      multipleChoices: entity.multipleChoices,
      videoLink: entity.videoLink,
      directions: entity.directions,
    );
  }
  Map<String, dynamic> tojson() => {
        'pdf': pdf,
        'multipleChoices': multipleChoices
            .map((e) => MultipleChoiceModel.fromE(e).tojson())
            .toList(),
        'videoLink': videoLink,
        'directions': directions,
      };
}

class MultipleChoiceModel extends MultipleChoiceEntity {
  MultipleChoiceModel({
    required super.answer,
    required super.question,
    required super.choices,
  });
  factory MultipleChoiceModel.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceModel(
      answer: json['answer'],
      question: json['question'],
      choices: List<String>.from(json["choices"].map((x) => x)),
    );
  }
  factory MultipleChoiceModel.fromE(MultipleChoiceEntity entity) {
    return MultipleChoiceModel(
      answer: entity.answer,
      question: entity.question,
      choices: entity.choices,
    );
  }
  Map<String, dynamic> tojson() => {
        'answer': answer,
        'question': question,
        'choices': choices.map((e) => e).toList(),
      };
}
