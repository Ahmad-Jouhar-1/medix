part of 'days_bloc.dart';

sealed class DaysState extends Equatable {
  const DaysState({required this.currentDay, required this.previousDay});

  final String currentDay;
  final String previousDay;

  @override
  List<Object> get props => [currentDay, previousDay];
}

final class DaysInitial extends DaysState {
  const DaysInitial() : super(currentDay: "", previousDay: "");
}

final class DaysUpdated extends DaysState {
  const DaysUpdated({required super.currentDay, required super.previousDay});
}
