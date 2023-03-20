// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:thesis1/domain/repository/repository.dart';

class UploadToStorage {
  final Repository repo;
  UploadToStorage({
    required this.repo,
  });
  Future<void> call({required String path, File? file}) async {
    await repo.uploadToStorage(path: path, file: file);
  }
}
