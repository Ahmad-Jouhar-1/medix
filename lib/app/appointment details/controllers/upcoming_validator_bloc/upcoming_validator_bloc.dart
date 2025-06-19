import 'package:clinic_management_system/app/appointment%20details/models/upcoming_appointment_models/cancelability_model.dart';
import 'package:clinic_management_system/app/appointment%20details/models/upcoming_appointment_models/json_model.dart';
import 'package:clinic_management_system/app/book%20appointment/models/reservation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_validator_event.dart';
part 'upcoming_validator_state.dart';

class UpcomingValidatorBloc
    extends Bloc<UpcomingValidatorEvent, UpcomingValidatorState> {
  UpcomingValidatorBloc() : super(UpcomingValidatorInitial()) {
    late bool hasCancelabilityFetched = false;
    late CancelabilityModel cancelability;
    late ReservationModel currentReservation;
    late ReservationModel previousReservation;
    on<SwitchValidator>((event, emit) {
      if (state.validatorName == "Cancel") {
        emit(UpcomingValidatorUpdate(validatorName: "Edit", isValid: false));
      } else {
        emit(UpcomingValidatorUpdate(validatorName: "Cancel", isValid: false));
      }
    });

    on<CheckCancelAbility>((event, emit) async {
      if (hasCancelabilityFetched) {
        emit(
          UpcomingValidatorUpdate(
            validatorName: state.validatorName,
            isValid: cancelability.isCancelable,
          ),
        );
        return;
      }
      try {
        await Future.delayed(Duration(seconds: 2));
        cancelability = CancelabilityModel.fromJson(
          upcomingAppointmentsCancelablility[event.appointmentId]
              as Map<String, dynamic>,
        );
        emit(
          UpcomingValidatorUpdate(
            validatorName: state.validatorName,
            isValid: cancelability.isCancelable,
          ),
        );
        hasCancelabilityFetched = true;
      } catch (e) {
        emit(
          UpcomingValidatorUpdate(
            validatorName: state.validatorName,
            isValid: false,
          ),
        );
      }
    });

    on<ReservationsAreSet>((event, emit) {
      previousReservation = event.reservation;
      currentReservation = event.reservation;
    });

    on<CheckEditAbility>((event, emit) {
      try {
        currentReservation = currentReservation.copyWith(
          departmentId: event.departmentId,
          doctorId: event.doctorId,
          requestTypeId: event.requestTypeId,
          day: event.day,
          timeId: event.timeId,
          withMedicalReport: event.withMedicalReport,
        );
        late bool isValid;
        if (currentReservation == previousReservation || event.timeId == -1) {
          isValid = false;
        } else {
          isValid = true;
        }
        emit(
          UpcomingValidatorUpdate(
            validatorName: state.validatorName,
            isValid: isValid,
          ),
        );
      } catch (e) {
        return;
      }
    });
  }
}
