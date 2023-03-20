// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class FetchNotes {
  final Repository repo;
  FetchNotes({
    required this.repo,
  });

  Future<List<NoteEntity>> call({required String userId}) async {
    return await repo.fetchNotes(userId: userId);
  }
}
