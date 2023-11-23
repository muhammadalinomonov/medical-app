import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/screen/multi_variant/multi_variant_page.dart';

part 'question_event.dart';

part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  int _questionIndex = 0;
  int score = 0;
  final AppRepository repository = AppRepository.getInstance();

  final List<List<String>> _variantsList = [
    [
      'assets/temp/img.png',
      'assets/temp/img_1.png',
      'assets/temp/img_2.png',
      'assets/temp/img_3.png',
      'assets/temp/img_4.png',
      'assets/temp/img_5.png',
      'assets/temp/img_6.png',
      'assets/temp/img_7.png',
      'assets/temp/img_8.png',
      'assets/temp/img_9.png',
    ],
    [
      'assets/temp/img_10.png',
      'assets/temp/img_11.png',
      'assets/temp/img_12.png',
      'assets/temp/img_13.png',
      'assets/temp/img_14.png',
      'assets/temp/img_15.png',
    ],
    [
      'assets/temp/img_16.png',
      'assets/temp/img_17.png',
      'assets/temp/img_18.png',
      'assets/temp/img_19.png',
      'assets/temp/img_20.png',
      'assets/temp/img_21.png',
      'assets/temp/img_22.png',
    ],


  ];


  QuestionBloc() : super(const QuestionState()) {
    on<QuestionEvent>((event, emit) async {
      switch (event) {
        case SelectVariant():
          await onSelectVariant(event, emit);
          break;
        case OpenGalleryScreen():
          break;
        case Load():
          emit(state.copyState(
              _variantsList[_questionIndex++], "$_questionIndex"));
      }
    });
  }

  Future<void> onSelectVariant(
      SelectVariant event, Emitter<QuestionState> emit) async {
    debugPrint("@@@@@ $score");
    await Future.delayed(Duration(milliseconds: 500));
    if (_questionIndex < 3) {
      if(_questionIndex == 1){
        score += (event.selectedColor < 3)?0:(event.selectedColor<6)?1:(event.selectedColor<8)?2:(event.selectedColor == 8)?3:5;
      }else if(_questionIndex == 2){
        score += (event.selectedColor < 1)?0:(event.selectedColor<2)?1:(event.selectedColor<3)?2:(event.selectedColor == 3)?3:5;
      }else{
        score += (event.selectedColor < 2)?0:(event.selectedColor<3)?1:(event.selectedColor<5)?2:(event.selectedColor == 5)?3:5;
      }
      emit(state.copyState(_variantsList[_questionIndex++], "$_questionIndex"));
    } else {
      score += (event.selectedColor < 2)?0:(event.selectedColor<3)?1:(event.selectedColor<5)?2:(event.selectedColor == 5)?3:5;
      debugPrint("@@@${score}");
      Navigator.pushReplacement(event.context,
          MaterialPageRoute(builder: (context) {
        return  MultiVariantPage(score: score);
      }));
    }
  }
}
