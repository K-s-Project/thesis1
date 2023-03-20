// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:thesis1/core/error/failure.dart';
import 'package:thesis1/domain/entity/student_entity.dart';
import 'package:thesis1/domain/repository/repository.dart';

class CreateUser {
  final Repository repo;
  CreateUser({
    required this.repo,
  });

  Future<Either<Failure, void>> call(StudentEntity student) async {
    return await repo.createUser(student);
  }
}
