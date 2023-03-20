// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class CreateNote {
  final Repository repo;
  CreateNote({
    required this.repo,
  });

  Future<void> call({required String userId, required NoteEntity note}) async {
    await repo.createNote(userId: userId, note: note);
  }
}
