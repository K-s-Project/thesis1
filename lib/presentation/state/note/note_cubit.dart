import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/domain/usecase/firestore/update_note.dart';

import '../../../domain/usecase/firestore/fetch_notes.dart';
import '../../../domain/usecase/firestore/create_note.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.fetchNotes, this.createNote, this.updateNote)
      : super(NoteInitial());

  final FetchNotes fetchNotes;
  final CreateNote createNote;
  final UpdateNote updateNote;

  void onCreateNote({required String userId, required NoteEntity note}) async {
    emit(NoteUploading());

    await createNote(userId: userId, note: note)
        .then((value) => emit(NoteDone()));
  }

  void onUpdateNote({required String userId, required NoteEntity note}) async {
    emit(NoteUploading());

    await updateNote(userId: userId, note: note)
        .then((value) => emit(NoteDone()));
  }

  void onFetchNotes({required String userId}) async {
    emit(NoteLoading());
    final notes = await fetchNotes(userId: userId);
    if (notes.isEmpty) {
      emit(NoteEmpty());
    } else {
      emit(NoteLoaded(notes: notes));
    }
  }
}
