import 'package:flutter_bloc/flutter_bloc.dart';

class LrnCubit extends Cubit<bool> {
  LrnCubit() : super(false);
  void checkLrn({required String orig, required String neu}) =>
      emit(orig != neu);
  void dispose() => emit(false);
}
