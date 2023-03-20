// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class Loading extends RegisterState {}

class Done extends RegisterState {
  final String uid;
  const Done({
    required this.uid,
  });
}

class Error extends RegisterState {
  final String message;
  const Error({
    required this.message,
  });
}
