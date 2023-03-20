import 'package:flutter_bloc/flutter_bloc.dart';

class Act2boolCubit extends Cubit<bool> {
  Act2boolCubit() : super(false);

  void set(bool isCorrect) => emit(isCorrect);
}
