// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../repository/repository.dart';

class IsAdmin {
  final Repository repo;
  IsAdmin({
    required this.repo,
  });

  Future<bool> call({required String uid}) async {
    return await repo.isAdmin(uid: uid);
  }
}
