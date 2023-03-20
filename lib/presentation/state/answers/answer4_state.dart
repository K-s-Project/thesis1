// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'answer4_cubit.dart';

class Answer4State extends Equatable {
  final String myAnswer;
  final String rightAnswer;
  final String question;
  const Answer4State({
    required this.myAnswer,
    required this.rightAnswer,
    required this.question,
  });
  Answer4State copyWith({
    String? myAnswer,
    String? rightAnswer,
    String? question,
  }) {
    return Answer4State(
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
