import 'package:flutter_bloc/flutter_bloc.dart';

class Act5boolCubit extends Cubit<bool> {
  Act5boolCubit() : super(false);

  void set(bool isCorrect) => emit(isCorrect);
}
