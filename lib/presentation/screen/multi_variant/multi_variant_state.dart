part of 'multi_variant_bloc.dart';

@immutable
class MultiVariantState {
  final List<String> colorList;
  final String question;

  const MultiVariantState({this.colorList = const [], this.question = ""});

  MultiVariantState copyState({List<String>? colorList, String? question}) {
    return MultiVariantState(
        colorList: colorList ?? this.colorList,
        question: question ?? this.question);
  }
}
