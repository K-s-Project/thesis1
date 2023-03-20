import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer1_state.dart';

class Answer1Cubit extends Cubit<Answer1State> {
  Answer1Cubit()
      : super(
          const Answer1State(
            myAnswer: '',
            rightAnswer: '',
            question: '',
          ),
        );
  void chooseAnswer({
    required String myAnswer,
    required String rightAnswer,
    required String question,
  }) {
    emit(
      state.copyWith(
        myAnswer: myAnswer,
        rightAnswer: rightAnswer,
        question: question,
      ),
    );
  }
}
