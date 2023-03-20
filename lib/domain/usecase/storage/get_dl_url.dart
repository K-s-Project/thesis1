// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/domain/repository/repository.dart';

class GetDlUrl {
  final Repository repo;
  GetDlUrl({
    required this.repo,
  });

  Future<String> call({required String path}) async {
    return await repo.getDlUrl(path: path);
  }
}
