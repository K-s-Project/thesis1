// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/usecase/auth/usercheck.dart';

part 'user_check_state.dart';

class UserCheckCubit extends Cubit<UserCheckState> {
  UserCheckCubit(
    this.userCheck,
  ) : super(Initial());

  final UserCheck userCheck;

  void onUserCheck() {
    emit(Loading());
    final userStream = userCheck();
    userStream.listen((user) {
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(UnAuthenticated());
      }
    });
  }
}
