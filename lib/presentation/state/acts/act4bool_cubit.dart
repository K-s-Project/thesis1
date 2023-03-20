import 'package:flutter_bloc/flutter_bloc.dart';

class Act4boolCubit extends Cubit<bool> {
  Act4boolCubit() : super(false);

  void set(bool isCorrect) => emit(isCorrect);
}
