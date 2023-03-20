import 'package:flutter_bloc/flutter_bloc.dart';

class GeneqCubit extends Cubit<bool> {
  GeneqCubit() : super(false);

  void canUpdate({
    required bool image,
    required bool firstName,
    required bool grade,
    required bool section,
    required bool lrn,
    required bool lastName,
  }) =>
      emit(image || firstName || grade || section || lrn || lastName);

  void dispose() => emit(false);
}
