part of 'departments_bloc.dart';

sealed class FetchDepartmentsEvent {
  const FetchDepartmentsEvent();
}

class FetchDepartments extends FetchDepartmentsEvent {
  FetchDepartments();
}
