part of 'question_bloc.dart';

@immutable
class QuestionState {
  final List<String> colorList;
  final String question;

  const QuestionState({this.colorList = const [], this.question = ""});

  QuestionState copyState(List<String>? colorList, String? question) {
    return QuestionState(
        colorList: colorList ?? this.colorList,
        question: question ?? this.question);
  }
}
