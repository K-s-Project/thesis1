// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class Updating extends UserState {}

class Updated extends UserState {}

class UserLoaded extends UserState {
  final StudentEntity student;
  const UserLoaded({
    required this.student,
  });
}

class UserError extends UserState {
  final String message;
  const UserError({
    required this.message,
  });
}
