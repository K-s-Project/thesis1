// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:thesis1/domain/repository/repository.dart';

import '../../../core/error/failure.dart';
import '../../entity/student_entity.dart';

class FetchUserById {
  final Repository repo;
  FetchUserById({
    required this.repo,
  });

  Future<Either<Failure, StudentEntity>> call({required String id}) async {
    return await repo.fetchStudentById(id: id);
  }
}
