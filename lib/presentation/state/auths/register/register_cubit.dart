// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/usecase/auth/register.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.register,
  ) : super(RegisterInitial());

  final Register register;

  void onRegister({required String email, required password}) async {
    emit(Loading());
    final either = await register(email: email, password: password);
    either.fold((l) => emit(Error(message: l.message)),
        (r) => emit(Done(uid: r ?? '')));
  }
}
