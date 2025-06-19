part of 'fetch_times_bloc.dart';

sealed class FetchTimesState {}

class FetchTimesLoading extends FetchTimesState {}

class FetchTimesLoaded extends FetchTimesState {
  final List<TimeModel> dayTimes;
  FetchTimesLoaded(this.dayTimes);
}

class FetchTimesFailed extends FetchTimesState {
  final String errorMessage;
  FetchTimesFailed(this.errorMessage);
}
