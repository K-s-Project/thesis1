// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_check_cubit.dart';

abstract class UserCheckState extends Equatable {
  const UserCheckState();

  @override
  List<Object> get props => [];
}

class Initial extends UserCheckState {}

class Authenticated extends UserCheckState {
  final User? user;
  const Authenticated({
    this.user,
  });
}

class UnAuthenticated extends UserCheckState {}

class Loading extends UserCheckState {}
