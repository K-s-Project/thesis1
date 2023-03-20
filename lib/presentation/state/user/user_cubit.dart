// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/core/dto/update_profile_dto.dart';

import 'package:thesis1/domain/entity/student_entity.dart';
import 'package:thesis1/domain/usecase/firestore/create_user.dart';
import 'package:thesis1/domain/usecase/firestore/fetch_user_by_id.dart';

import '../../../domain/usecase/firestore/update_profile.dart';
import '../../../domain/usecase/storage/get_dl_url.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this.createUser,
    this.fetchUserById,
    this.updateProfile,
    this.getDlUrl,
  ) : super(UserInitial());

  final CreateUser createUser;
  final FetchUserById fetchUserById;
  final UpdateProfile updateProfile;
  final GetDlUrl getDlUrl;
  Future<void> onUpdateProfile({
    required UpdateProfileDto updateProfileDto,
    String? path,
    String? existingUrl,
  }) async {
    emit(Updating());
    if (path != null) {
      updateProfileDto.image = await getDlUrl(path: path);
    } else if (existingUrl != null) {
      updateProfileDto.image = existingUrl;
    }
    await updateProfile(updateProfileDto: updateProfileDto)
        .then((value) => emit(Updated()));
  }

  Future<void> onCreateUser(StudentEntity student) async {
    await createUser(student);
  }

  void onFetchUserById({required String id}) async {
    emit(UserLoading());
    final either = await fetchUserById(id: id);
    either.fold((l) => emit(UserError(message: l.message)),
        (r) => emit(UserLoaded(student: r)));
  }
}
