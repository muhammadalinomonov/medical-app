part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class SelectVariant extends QuestionEvent {
  final int selectedColor;
  final BuildContext context;

  SelectVariant({required this.selectedColor, required this.context});
}

class Load extends QuestionEvent{}

class OpenGalleryScreen extends QuestionEvent {
  final BuildContext context;

  OpenGalleryScreen({required this.context});
}
