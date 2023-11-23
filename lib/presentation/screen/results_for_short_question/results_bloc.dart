import 'package:bloc/bloc.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:meta/meta.dart';

part 'results_event.dart';

part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final repository = AppRepository.getInstance();

  ResultsBloc() : super(const ResultsState()) {
    on<ResultsEvent>((event, emit) {
      switch (event) {
        case Load():
          emit(
              state.copyWith(result: repository.correctAnswerCount.toString()));
          break;
      }
    });
  }
}
