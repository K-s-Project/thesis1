import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer3_state.dart';

class Answer3Cubit extends Cubit<Answer3State> {
  Answer3Cubit()
      : super(
          const Answer3State(
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
