import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer2_state.dart';

class Answer2Cubit extends Cubit<Answer2State> {
  Answer2Cubit()
      : super(
          const Answer2State(
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
