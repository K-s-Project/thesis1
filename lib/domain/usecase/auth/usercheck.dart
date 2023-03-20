// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis1/domain/repository/repository.dart';

class UserCheck {
  final Repository repo;
  UserCheck({
    required this.repo,
  });

  Stream<User?> call() => repo.checkUser();
}
