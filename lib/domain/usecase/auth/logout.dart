// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

class Logout {
  final Repository repo;
  Logout({
    required this.repo,
  });

  Future<void> call() async => await repo.logout();
}
