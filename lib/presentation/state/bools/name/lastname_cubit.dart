import 'package:flutter_bloc/flutter_bloc.dart';

class LastNameCubit extends Cubit<bool> {
  LastNameCubit() : super(false);
  void checkLastName({required String orig, required String neu}) =>
      emit(orig != neu);
  void dispose() => emit(false);
}
