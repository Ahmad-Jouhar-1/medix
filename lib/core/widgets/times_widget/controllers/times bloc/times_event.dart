part of 'times_bloc.dart';

sealed class TimesEvent {}

class CurrentTimeIdChanged extends TimesEvent {
  final int currentTimeId;

  CurrentTimeIdChanged({required this.currentTimeId});
}

class TimesBlocDayIdsChanged extends TimesEvent {
  final String previousDay;
  final String currentDay;

  TimesBlocDayIdsChanged({required this.previousDay, required this.currentDay});
}

class TimesIdsAreSet extends TimesEvent {
  final int timeId;

  TimesIdsAreSet({required this.timeId});
}

class TimesReset extends TimesEvent {}

class IsMorningDroppedDownToggled extends TimesEvent {}

class IsAfternoonDroppedDownToggled extends TimesEvent {}
