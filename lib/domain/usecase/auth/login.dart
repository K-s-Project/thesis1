// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:thesis1/core/error/failure.dart';
import 'package:thesis1/domain/repository/repository.dart';

class Login {
  final Repository repo;
  Login({
    required this.repo,
  });

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
  }) async {
    return await repo.login(email: email, password: password);
  }
}
