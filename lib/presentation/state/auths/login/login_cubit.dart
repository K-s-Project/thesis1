// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/usecase/auth/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.login,
  ) : super(LoginInitial());

  final Login login;

  void onLogin({required String email, required String password}) async {
    final either = await login(email: email, password: password);
    either.fold((l) => emit(Error(message: l.message)), (r) {
      emit(LoggingIn());
      emit(LoggedIn());
    });
  }
}
