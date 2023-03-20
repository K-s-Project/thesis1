import 'package:flutter_bloc/flutter_bloc.dart';

class Act1boolCubit extends Cubit<bool> {
  Act1boolCubit() : super(false);

  void set(bool isCorrect) => emit(isCorrect);
}
