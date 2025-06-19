import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'times_event.dart';
part 'times_state.dart';

class TimesBloc extends Bloc<TimesEvent, TimesState> {
  TimesBloc() : super(TimesInitial()) {
    on<CurrentTimeIdChanged>((event, emit) {
      emit(
        TimesUpdated(
          previousTimeId: state.previousTimeId,
          currentTimeId: event.currentTimeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          isMorningDroppedDown: state.isMorningDroppedDown,
          isAfternoonDroppedDown: state.isAfternoonDroppedDown,
        ),
      );
    });

    on<TimesIdsAreSet>((event, emit) {
      emit(
        TimesUpdated(
          previousTimeId: event.timeId,
          currentTimeId: event.timeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          isMorningDroppedDown: state.isMorningDroppedDown,
          isAfternoonDroppedDown: state.isAfternoonDroppedDown,
        ),
      );
    });

    on<TimesBlocDayIdsChanged>((event, emit) {
      late int currentTimeId;
      if (event.currentDay == event.previousDay) {
        currentTimeId = state.previousTimeId;
      } else {
        currentTimeId = -1;
      }
      emit(
        TimesUpdated(
          previousTimeId: state.previousTimeId,
          currentTimeId: currentTimeId,
          previousDay: event.previousDay,
          currentDay: event.currentDay,
          isMorningDroppedDown: state.isMorningDroppedDown,
          isAfternoonDroppedDown: state.isAfternoonDroppedDown,
        ),
      );
    });

    on<IsMorningDroppedDownToggled>((event, emit) {
      emit(
        TimesUpdated(
          previousTimeId: state.previousTimeId,
          currentTimeId: state.currentTimeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          isMorningDroppedDown: !state.isMorningDroppedDown,
          isAfternoonDroppedDown: state.isAfternoonDroppedDown,
        ),
      );
    });

    on<IsAfternoonDroppedDownToggled>((event, emit) {
      emit(
        TimesUpdated(
          previousTimeId: state.previousTimeId,
          currentTimeId: state.currentTimeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          isMorningDroppedDown: state.isMorningDroppedDown,
          isAfternoonDroppedDown: !state.isAfternoonDroppedDown,
        ),
      );
    });

    on<TimesReset>((event, emit) {
      emit(
        TimesUpdated(
          previousTimeId: -1,
          currentTimeId: -1,
          previousDay: "",
          currentDay: "",
          isMorningDroppedDown: false,
          isAfternoonDroppedDown: false,
        ),
      );
    });
  }
}
