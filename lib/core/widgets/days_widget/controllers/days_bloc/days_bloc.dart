import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'days_event.dart';
part 'days_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc() : super(DaysInitial()) {
    on<CurrentDayIdChanged>((event, emit) {
      emit(
        DaysUpdated(
          currentDay: event.currentDay,
          previousDay: state.previousDay,
        ),
      );
    });

    on<DaysBlocDaysIdsAreSet>((event, emit) {
      emit(DaysUpdated(currentDay: event.day, previousDay: event.day));
    });

    on<DaysReset>((event, emit) {
      emit(DaysUpdated(currentDay: "", previousDay: ""));
    });
  }
}
