part of 'titled_checkbox_bloc.dart';

sealed class TitledCheckboxState {
  const TitledCheckboxState({
    required this.isPreviousChecked,
    required this.isCurrentChecked,
    required this.isActive,
  });

  final bool isPreviousChecked;
  final bool isCurrentChecked;
  final bool isActive;
}

final class TitledCheckboxInitial extends TitledCheckboxState {
  const TitledCheckboxInitial()
    : super(isPreviousChecked: false, isCurrentChecked: false, isActive: false);
}

final class TitledCheckboxUpdated extends TitledCheckboxState {
  const TitledCheckboxUpdated({
    required super.isPreviousChecked,
    required super.isCurrentChecked,
    required super.isActive,
  });
}
