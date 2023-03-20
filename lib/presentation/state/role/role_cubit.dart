import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/auth/is_admin.dart';
part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit(this.isAdmin) : super(RoleInitial());

  final IsAdmin isAdmin;

  void checkRole({required String uid}) async {
    final isadmin = await isAdmin(uid: uid);
    if (isadmin) {
      emit(Admin());
    } else {
      emit(Student());
    }
  }
}
