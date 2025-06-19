part of 'days_bloc.dart';

sealed class DaysEvent {}

class CurrentDayIdChanged extends DaysEvent {
  final String currentDay;
  CurrentDayIdChanged({required this.currentDay});
}

class DaysBlocDaysIdsAreSet extends DaysEvent {
  final String day;

  DaysBlocDaysIdsAreSet({required this.day});
}

class DaysReset extends DaysEvent {}
