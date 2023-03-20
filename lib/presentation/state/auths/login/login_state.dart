// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoggingIn extends LoginState {}

class LoggedIn extends LoginState {}

class Done extends LoginState {}

class Error extends LoginState {
  final String message;
  const Error({
    required this.message,
  });
}
