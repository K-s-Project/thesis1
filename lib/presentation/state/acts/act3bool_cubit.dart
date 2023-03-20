import 'package:flutter_bloc/flutter_bloc.dart';

class Act3boolCubit extends Cubit<bool> {
  Act3boolCubit() : super(false);

  void set(bool isCorrect) => emit(isCorrect);
}
