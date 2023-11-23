part of 'photo_question_bloc.dart';

@immutable
abstract class PhotoQuestionEvent {}

class Load extends PhotoQuestionEvent {}

class SelectPhoto extends PhotoQuestionEvent {
  final PhotoData photo;

  SelectPhoto({required this.photo});
}

class SelectAnswer extends PhotoQuestionEvent {
  final int answer;
  final BuildContext context;

  SelectAnswer({required this.answer, required this.context});
}
