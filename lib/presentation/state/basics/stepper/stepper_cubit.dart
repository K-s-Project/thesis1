import 'package:flutter_bloc/flutter_bloc.dart';

class StepperCubit extends Cubit<int> {
  StepperCubit() : super(0);

  void proceed(int currentStep) {
    if (currentStep <= 2) {
      emit(currentStep + 1);
    }
  }

  void onTap(int step) => emit(step);

  void back(int currentStep) {
    if (currentStep > 0) {
      emit(currentStep - 1);
    }
  }
}
