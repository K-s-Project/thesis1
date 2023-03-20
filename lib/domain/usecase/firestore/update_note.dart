// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

import '../../entity/note_entity.dart';

class UpdateNote {
  final Repository repo;
  UpdateNote({
    required this.repo,
  });
  Future<void> call({required String userId, required NoteEntity note}) async {
    await repo.updateNote(userId: userId, note: note);
  }
}
