part of 'titled_checkbox_bloc.dart';

sealed class TitledCheckboxEvent {
  const TitledCheckboxEvent();
}

class IsCurrentCheckedToggled extends TitledCheckboxEvent {}

class TitledCheckboxIsActivated extends TitledCheckboxEvent {}

class ActivatedAndChecksAreSet extends TitledCheckboxEvent {
  final bool isChecked;

  ActivatedAndChecksAreSet({required this.isChecked});
}

class TitledCheckboxReset extends TitledCheckboxEvent {}
