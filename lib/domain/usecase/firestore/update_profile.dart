// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:thesis1/core/dto/update_profile_dto.dart';
import 'package:thesis1/domain/repository/repository.dart';

class UpdateProfile {
  final Repository repo;
  UpdateProfile({
    required this.repo,
  });
  Future<void> call({required UpdateProfileDto updateProfileDto}) async {
    await repo.updateProfile(updateProfileDto: updateProfileDto);
  }
}
