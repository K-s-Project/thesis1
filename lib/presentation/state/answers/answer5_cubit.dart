import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer5_state.dart';

class Answer5Cubit extends Cubit<Answer5State> {
  Answer5Cubit()
      : super(
          const Answer5State(
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
