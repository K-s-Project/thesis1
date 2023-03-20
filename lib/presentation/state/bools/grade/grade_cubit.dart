import 'package:flutter_bloc/flutter_bloc.dart';

class GradeCubit extends Cubit<bool> {
  GradeCubit() : super(false);

  void checkGrade({required String orig, required String neu}) =>
      emit(orig != neu);
  void dispose() => emit(false);
}
