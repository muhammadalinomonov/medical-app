part of 'short_question_bloc.dart';

@immutable
abstract class ShortQuestionEvent {}

class Load extends ShortQuestionEvent{}

class ClickYesBtn extends ShortQuestionEvent {
  final BuildContext context;

  ClickYesBtn({required this.context});
}

class ClickNoBtn extends ShortQuestionEvent {
  final BuildContext context;

  ClickNoBtn({required this.context});
}
