part of 'multi_variant_bloc.dart';

@immutable
abstract class MultiVariantEvent {}

class SelectVariant extends MultiVariantEvent {
  final int selectedColor;
  final BuildContext context;

  SelectVariant({required this.selectedColor, required this.context});
}

class Load extends MultiVariantEvent{
  final int score;

  Load({required this.score});
}