import 'package:flutter_bloc/flutter_bloc.dart';

class FirstNameCubit extends Cubit<bool> {
  FirstNameCubit() : super(false);
  void checkFirstName({required String orig, required String neu}) =>
      emit(orig != neu);
  void dispose() => emit(false);
}
