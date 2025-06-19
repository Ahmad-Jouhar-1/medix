part of 'upcoming_validator_bloc.dart';

sealed class UpcomingValidatorEvent {}

class SwitchValidator extends UpcomingValidatorEvent {}

class CheckCancelAbility extends UpcomingValidatorEvent {
  final int appointmentId;

  CheckCancelAbility({required this.appointmentId});
}

class CheckEditAbility extends UpcomingValidatorEvent {
  final int? departmentId;
  final int? doctorId;
  final int? requestTypeId;
  final String? day;
  final int? timeId;
  final bool? withMedicalReport;

  CheckEditAbility({
    this.departmentId,
    this.doctorId,
    this.requestTypeId,
    this.day,
    this.timeId,
    this.withMedicalReport,
  });
}

class ReservationsAreSet extends UpcomingValidatorEvent {
  final ReservationModel reservation;

  ReservationsAreSet({required this.reservation});
}
