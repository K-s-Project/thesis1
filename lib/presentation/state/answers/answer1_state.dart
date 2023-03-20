// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'answer1_cubit.dart';

class Answer1State extends Equatable {
  final String myAnswer;
  final String rightAnswer;
  final String question;
  const Answer1State({
    required this.myAnswer,
    required this.rightAnswer,
    required this.question,
  });

  @override
  List<Object?> get props => [
        myAnswer,
        rightAnswer,
        question,
      ];

  Answer1State copyWith({
    String? myAnswer,
    String? rightAnswer,
    String? question,
  }) {
    return Answer1State(
      myAnswer: myAnswer ?? this.myAnswer,
      rightAnswer: rightAnswer ?? this.rightAnswer,
      question: question ?? this.question,
    );
  }
}
