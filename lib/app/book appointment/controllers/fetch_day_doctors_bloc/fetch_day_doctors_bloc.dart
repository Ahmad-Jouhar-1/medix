import 'dart:developer';

import 'package:clinic_management_system/app/book%20appointment/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/models/day_doctors_model.dart';

part 'fetch_day_doctors_event.dart';
part 'fetch_day_doctors_state.dart';

class FetchDayDoctorsBloc
    extends Bloc<FetchDayDoctorsEvent, FetchDayDoctorsState> {
  FetchDayDoctorsBloc() : super(FetchDayDoctorsLoading()) {
    on<FetchDayDoctors>((event, emit) async {
      emit(FetchDayDoctorsLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        DayDoctorsModel dayDoctors = DayDoctorsModel.fromJson(
          myDoctors[event.day] as Map<String, dynamic>,
        );
        log(dayDoctors.morningDoctorId.toString());
        log(dayDoctors.afternoonDoctorId.toString());
        emit(FetchDayDoctorsLoaded(dayDoctors: dayDoctors));
      } catch (e) {
        emit(
          FetchDayDoctorsFailed(
            errorMessage:
                "Something Went Wrong When Trying To Fetch Day Doctors",
          ),
        );
      }
    });
  }
}
