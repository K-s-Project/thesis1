import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer4_state.dart';

class Answer4Cubit extends Cubit<Answer4State> {
  Answer4Cubit()
      : super(
          const Answer4State(
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
          myAnswer: myAnswer, rightAnswer: rightAnswer, question: question),
    );
  }
}
