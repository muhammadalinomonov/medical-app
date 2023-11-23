part of 'short_question_bloc.dart';

@immutable
class ShortQuestionState {
  final int question;

  const ShortQuestionState({this.question = 1});

  ShortQuestionState copyWith({int? question}) {
    return ShortQuestionState(question: question ?? this.question);
  }
}
