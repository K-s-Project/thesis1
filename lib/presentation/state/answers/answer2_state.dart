// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'answer2_cubit.dart';

class Answer2State extends Equatable {
  final String myAnswer;
  final String rightAnswer;
  final String question;
  const Answer2State({
    required this.myAnswer,
    required this.rightAnswer,
    required this.question,
  });
  Answer2State copyWith({
    String? myAnswer,
    String? rightAnswer,
    String? question,
  }) {
    return Answer2State(
      myAnswer: myAnswer ?? this.myAnswer,
      rightAnswer: rightAnswer ?? this.rightAnswer,
      question: question ?? this.question,
    );
  }

  @override
  List<Object?> get props => [
        myAnswer,
        rightAnswer,
        question,
      ];
}
