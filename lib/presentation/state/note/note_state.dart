// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'note_cubit.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteDone extends NoteState {}

class NoteUploading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<NoteEntity> notes;
  const NoteLoaded({
    required this.notes,
  });
}

class NoteEmpty extends NoteState {}
