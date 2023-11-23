// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/screen/photo_question/photo_data.dart';
import 'package:medical_app/presentation/screen/photo_question/results_for_photo_screen.dart';
import 'package:medical_app/presentation/screen/results_for_short_question/results_screen.dart';

part 'photo_question_event.dart';

part 'photo_question_state.dart';

class PhotoQuestionBloc extends Bloc<PhotoQuestionEvent, PhotoQuestionState> {
  int _questionIndex = -1;
  final AppRepository repository;

  PhotoQuestionBloc({required this.repository})
      : super(const PhotoQuestionState()) {
    on<PhotoQuestionEvent>((event, emit) {
      switch (event) {
        case Load():
          loadData(event, emit);
          break;
        case SelectPhoto():
          onEventPhotoSelect(event, emit);
          break;
        case SelectAnswer():
          onEventSelectAnswer(event, emit);
          break;
      }
    });
  }

  void loadData(Load event, Emitter<PhotoQuestionState> emit) {
    repository.photoQuestionResult = 0;
    final list = <PhotoData>[];
    final outerList = repository.photos[++_questionIndex];
    for (int i = 0; i < outerList.length; i++) {
      list.add(FromAsset(url: outerList[i]));
    }
    // final photoList = repository.photos[++_questionIndex].map((e) => FromAsset(url: e)) as List<FromAsset>;
    emit(state.copyWith(photoList: list, index: _questionIndex + 1));
  }

  void onEventPhotoSelect(SelectPhoto event, Emitter<PhotoQuestionState> emit) {
    emit(state.copyWith(userPhoto: event.photo));
  }

  void onEventSelectAnswer(
      SelectAnswer event, Emitter<PhotoQuestionState> emit) {
    if (event.answer == 1) {
      if (_questionIndex < 3) {
        debugPrint("3 ballik");
        repository.photoQuestionResult += 3;
      } else if (_questionIndex == 8 ||
          _questionIndex == 9 ||
          _questionIndex == 5 ||
          _questionIndex == 6) {
        repository.photoQuestionResult += 2;
        debugPrint("2 ballik");
      } else {
        debugPrint("1 ballik");
        repository.photoQuestionResult++;
      }
    }

    // repository.photoQuestionResult += event.answer;
    if (_questionIndex < 14) {
      final list = <PhotoData>[];
      final outerList = repository.photos[++_questionIndex];
      for (int i = 0; i < outerList.length; i++) {
        list.add(FromAsset(url: outerList[i]));
      }
      emit(state.copyWith(photoList: list, index: _questionIndex + 1));
    } else {

      Navigator.pushReplacement(
          event.context,
          CupertinoPageRoute(
              builder: (context) => ResultsForPhotoScreen(
                    maxResult: 25,
                    currentResult: repository.photoQuestionResult,
                  )));
    }
  }
}
