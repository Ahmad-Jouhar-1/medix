import 'package:clinic_management_system/app/appointment%20details/models/upcoming_appointment_models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/models/reservation_model.dart';

part 'fetch_reservation_event.dart';
part 'fetch_reservation_state.dart';

class FetchReservationBloc
    extends Bloc<FetchReservationEvent, FetchReservationState> {
  FetchReservationBloc() : super(FetchReservationLoading()) {
    late bool hasFetched = false;
    late ReservationModel reservation;

    on<FetchReservation>((event, emit) async {
      if (hasFetched) {
        emit(FetchReservationLoaded(reservation: reservation));
        return;
      }
      emit(FetchReservationLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        reservation = ReservationModel.fromJson(
          upcomingReservations[event.appointmentId] as Map<String, dynamic>,
        );
        hasFetched = true;
        emit(FetchReservationLoaded(reservation: reservation));
      } catch (e) {
        emit(
          FetchReservationFailed(
            errorMessage:
                "Something Went Wrong When Trying To Fetch Reservation",
          ),
        );
      }
    });
  }
}
