import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/screen/results_for_short_question/results_screen.dart';

part 'short_question_event.dart';

part 'short_question_state.dart';

class ShortQuestionBloc extends Bloc<ShortQuestionEvent, ShortQuestionState> {
  int _questionIndex = 1;
  final AppRepository repository;

  ShortQuestionBloc({required this.repository}) : super(const ShortQuestionState()) {
    on<ShortQuestionEvent>((event, emit) async {

      switch (event) {
        case Load():
          repository.correctAnswerCount = 0;
          break;
        case ClickYesBtn():
          await onClickYesBtn(event, emit);
          break;
        case ClickNoBtn():
          await onClickNoBtn(event, emit);
          break;
      }
    });
  }

  Future<void> onClickYesBtn(ClickYesBtn event, Emitter<ShortQuestionState> emit) async {
    if(_questionIndex == 6 || _questionIndex == 7|| _questionIndex == 13) {
      repository.correctAnswerCount += 2;
    }else{
      repository.correctAnswerCount ++;
    }
    if (_questionIndex < 19) {
      emit(state.copyWith(question: ++_questionIndex));
    } else {
      Navigator.pushReplacement(
          event.context,
          CupertinoPageRoute(
            builder: (context) =>  ResultsScreen(maxResult: 22, currentResult: repository.correctAnswerCount,),
          ));
    }
  }

  Future<void> onClickNoBtn(
      ClickNoBtn event, Emitter<ShortQuestionState> emit) async {
    if(_questionIndex > 1) {
      repository.wrongAnswerCount ++;
    }
    if (_questionIndex < 19) {
      emit(state.copyWith(question: ++_questionIndex));
    } else {
      Navigator.pushReplacement(
          event.context,
          CupertinoPageRoute(
            builder: (context) =>  ResultsScreen(maxResult: 22, currentResult: repository.correctAnswerCount,),
          ));
    }
  }
}
