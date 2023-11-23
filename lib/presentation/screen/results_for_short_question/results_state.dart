part of 'results_bloc.dart';

@immutable
class ResultsState {
  final String result;

  const ResultsState({this.result = ""});

  ResultsState copyWith({String? result}) {
    return ResultsState(result: result ?? this.result);
  }
}
