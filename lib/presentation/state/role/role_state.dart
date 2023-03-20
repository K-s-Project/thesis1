part of 'role_cubit.dart';

abstract class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object> get props => [];
}

class RoleInitial extends RoleState {}

class Admin extends RoleState {}

class Student extends RoleState {}
