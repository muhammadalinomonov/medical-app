import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_repository.dart';
import '../results_for_top_screen/results_screen.dart';

part 'multi_variant_event.dart';
part 'multi_variant_state.dart';


class MultiVariantBloc extends Bloc<MultiVariantEvent, MultiVariantState> {
  final AppRepository repository;
  int index = 4;
  int score = 0;
  MultiVariantBloc({required this.repository}) : super(const MultiVariantState()) {
    on<MultiVariantEvent>((event, emit) {
      switch(event){
        case SelectVariant():
          if(index < 5) {
            //todo
            repository.fototipScore += event.selectedColor;
            score += event.selectedColor;
            emit(state.copyState(question: "${++index}"));
          } else{
            score += event.selectedColor;
            Navigator.pushReplacement(event.context, CupertinoPageRoute(builder: (context) =>  ColorsResultsScreen(fototipScore:score)));
          }
          break;
        case Load():
          score += event.score;
          emit(state.copyState(question: '$index'));
          break;
      }
    });
  }
}
