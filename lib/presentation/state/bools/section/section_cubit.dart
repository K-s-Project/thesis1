import 'package:flutter_bloc/flutter_bloc.dart';

class SectionCubit extends Cubit<bool> {
  SectionCubit() : super(false);
  void checkSection({required String orig, required String neu}) =>
      emit(orig != neu);
  void dispose() => emit(false);
}
