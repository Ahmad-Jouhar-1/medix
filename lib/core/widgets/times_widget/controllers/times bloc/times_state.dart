part of 'times_bloc.dart';

sealed class TimesState extends Equatable {
  const TimesState({
    required this.previousTimeId,
    required this.currentTimeId,
    required this.previousDay,
    required this.currentDay,
    required this.isMorningDroppedDown,
    required this.isAfternoonDroppedDown,
  });

  final int previousTimeId;
  final int currentTimeId;
  final String previousDay;
  final String currentDay;
  final bool isMorningDroppedDown;
  final bool isAfternoonDroppedDown;

  @override
  List<Object> get props => [
    currentTimeId,
    previousTimeId,
    previousDay,
    currentDay,
    isMorningDroppedDown,
    isAfternoonDroppedDown,
  ];
}

final class TimesInitial extends TimesState {
  const TimesInitial()
    : super(
        previousTimeId: -1,
        currentTimeId: -1,
        previousDay: "",
        currentDay: "",
        isMorningDroppedDown: false,
        isAfternoonDroppedDown: false,
      );
}

final class TimesUpdated extends TimesState {
  const TimesUpdated({
    required super.previousTimeId,
    required super.currentTimeId,
    required super.previousDay,
    required super.currentDay,
    required super.isMorningDroppedDown,
    required super.isAfternoonDroppedDown,
  });
}
