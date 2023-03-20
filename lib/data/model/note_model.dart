import 'package:thesis1/domain/entity/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    required super.title,
    required super.body,
    required super.createdAt,
    required super.id,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      body: json['body'],
      createdAt: json['createdAt'],
      id: json['id'],
    );
  }
  factory NoteModel.fromE(NoteEntity note) {
    return NoteModel(
      title: note.title,
      body: note.body,
      createdAt: note.createdAt,
      id: note.id,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'createdAt': createdAt,
      'id': id,
    };
  }
}
