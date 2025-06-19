import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_times_bloc/fetch_afternoon_times_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_times_bloc/fetch_morning_times_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/controllers/book_appointment_validator_bloc/book_appointment_validator_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/controllers/fetch_day_doctors_bloc/fetch_day_doctors_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/controllers/fetch_departments_bloc/departments_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_management_system/app/book%20appointment/views/widgets/departments_widget/views/widgets/departments_widget.dart';
import 'package:clinic_management_system/app/book%20appointment/views/widgets/departments_widget/views/widgets/shimmer_departments_widget.dart';
import 'package:clinic_management_system/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_management_system/core/errors/constants/app_colors.dart';
import 'package:clinic_management_system/core/errors/constants/app_dimensions.dart';
import 'package:clinic_management_system/core/widgets/button_widget.dart';
import 'package:clinic_management_system/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_management_system/core/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_management_system/core/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_management_system/core/widgets/request%20types%20widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_management_system/core/widgets/request%20types%20widget/views/widgets/request_types_widget.dart';
import 'package:clinic_management_system/core/widgets/subtitle_widget.dart';
import 'package:clinic_management_system/core/widgets/subtitle_with_text_button_widget.dart';
import 'package:clinic_management_system/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/widgets/shimmer_times_widget.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/widgets/times_widget.dart';
import 'package:clinic_management_system/core/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_management_system/core/widgets/titled_checkbox_widget/views/widgets/titled_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color specifyConfirmButtonBackgroundColor(bool isValid) {
      return isValid ? AppColors.primaryColor : AppColors.hintTextColor;
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          "Book Appointment",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => FetchDepartmentsBloc()..add(FetchDepartments()),
          ),
          BlocProvider(
            create: (context) => FetchDaysBloc()..add(FetchDefaultDays()),
          ),
          BlocProvider(create: (context) => FetchDayDoctorsBloc()),
          BlocProvider(
            create:
                (context) =>
                    FetchMorningTimesBloc()
                      ..add(FetchDefaultTimes(shift: "Morning")),
          ),
          BlocProvider(
            create:
                (context) =>
                    FetchAfternoonTimesBloc()
                      ..add(FetchDefaultTimes(shift: "Afternoon")),
          ),
          BlocProvider(create: (context) => DepartmentsBloc()),
          BlocProvider(
            create:
                (context) =>
                    RequestTypesBloc()..add(RequestTypesAreActivated()),
          ),
          BlocProvider(create: (context) => DaysBloc()),
          BlocProvider(create: (context) => TimesBloc()),
          BlocProvider(
            create:
                (context) =>
                    TitledCheckboxBloc()..add(TitledCheckboxIsActivated()),
          ),
          BlocProvider(create: (context) => BookAppointmentValidatorBloc()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<DepartmentsBloc, DepartmentsState>(
              listener: (context, state) {
                context.read<DaysBloc>().add(DaysReset());
                context.read<FetchDaysBloc>().add(
                  FetchDays(departmentId: state.currentDepartmentId),
                );
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    departmentId: state.currentDepartmentId,
                    day: "",
                    doctorId: -1,
                    timeId: -1,
                  ),
                );
              },
            ),
            BlocListener<RequestTypesBloc, RequestTypesState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    requestTypeId: state.currentRequestTypeId,
                  ),
                );
              },
            ),
            BlocListener<DaysBloc, DaysState>(
              listener: (context, state) {
                context.read<TimesBloc>().add(TimesReset());
                context.read<FetchDayDoctorsBloc>().add(
                  FetchDayDoctors(day: state.currentDay),
                );
                if (state.currentDay == "") {
                  context.read<FetchMorningTimesBloc>().add(
                    FetchDefaultTimes(shift: "Morning"),
                  );
                  context.read<FetchAfternoonTimesBloc>().add(
                    FetchDefaultTimes(shift: "Afternoon"),
                  );
                  return;
                }
                int departmentId =
                    context.read<DepartmentsBloc>().state.currentDepartmentId;
                context.read<FetchMorningTimesBloc>().add(
                  FetchTimes(
                    departmentId: departmentId,
                    day: state.currentDay,
                    shift: "morning",
                  ),
                );
                context.read<FetchAfternoonTimesBloc>().add(
                  FetchTimes(
                    departmentId: departmentId,
                    day: state.currentDay,
                    shift: "afternoon",
                  ),
                );
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    day: state.currentDay,
                    doctorId: -1,
                    timeId: -1,
                  ),
                );
              },
            ),
            BlocListener<TimesBloc, TimesState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(doctorId: 1, timeId: state.currentTimeId),
                );
              },
            ),
            BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    withMedicalReport: state.isCurrentChecked,
                  ),
                );
              },
            ),
          ],
          child: ListView(
            children: [
              BlocBuilder<FetchDepartmentsBloc, FetchDepartmentsState>(
                builder: (context, state) {
                  switch (state) {
                    case FetchDepartmentsLoading():
                      return ShimmerDepartmentsWidget();
                    case FetchDepartmentsLoaded():
                      return DepartmentsWidget(departments: state.departments);
                    case FetchDepartmentsFailed():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
              RequestTypesWidget(),
              SubtitleWithTextButtonWidget(
                subtitle: "Dates And Times",
                buttonTitle: "Open Calendar",
                onPressed: () {},
              ),
              BlocBuilder<FetchDaysBloc, FetchDaysState>(
                builder: (context, state) {
                  switch (state) {
                    case FetchDaysLoading():
                      return ShimmerDaysWidget();
                    case FetchDaysLoaded():
                      return DaysWidget(days: state.days);
                    case FetchDaysFailed():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
              BlocBuilder<FetchDayDoctorsBloc, FetchDayDoctorsState>(
                builder: (context, state) {
                  if (state is FetchDayDoctorsLoaded) {
                    return SubtitleWithTextButtonWidget(
                      subtitle: "Morning Times",
                      buttonTitle: "Doctor Profile",
                      onPressed: () {
                        Get.to(
                          DoctorProfileScreen(
                            id: state.dayDoctors.morningDoctorId,
                          ),
                        );
                      },
                    );
                  } else {
                    return SubtitleWidget(subtitle: "Morning Times");
                  }
                },
              ),
              BlocBuilder<FetchMorningTimesBloc, FetchTimesState>(
                builder: (context, state) {
                  switch (state) {
                    case FetchTimesLoading():
                      return ShimmerTimesWidget();
                    case FetchTimesLoaded():
                      return TimesWidget(
                        times: state.dayTimes,
                        shift: "Morning",
                      );
                    case FetchTimesFailed():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
              BlocBuilder<FetchDayDoctorsBloc, FetchDayDoctorsState>(
                builder: (context, state) {
                  if (state is FetchDayDoctorsLoaded) {
                    return SubtitleWithTextButtonWidget(
                      subtitle: "Afternoon Times",
                      buttonTitle: "Doctor Profile",
                      onPressed: () {
                        Get.to(
                          DoctorProfileScreen(
                            id: state.dayDoctors.afternoonDoctorId,
                          ),
                        );
                      },
                    );
                  } else {
                    return SubtitleWidget(subtitle: "Afternoon Times");
                  }
                },
              ),
              BlocBuilder<FetchAfternoonTimesBloc, FetchTimesState>(
                builder: (context, state) {
                  switch (state) {
                    case FetchTimesLoading():
                      return ShimmerTimesWidget();
                    case FetchTimesLoaded():
                      return TimesWidget(
                        times: state.dayTimes,
                        shift: "Afternoon",
                      );
                    case FetchTimesFailed():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
              TitledCheckboxWidget(title: "Do you need a medical Report?"),
              BlocBuilder<
                BookAppointmentValidatorBloc,
                BookAppointmentValidatorState
              >(
                builder: (context, state) {
                  return ButtonWidget(
                    title: "Confirm",
                    backgroundColor: specifyConfirmButtonBackgroundColor(
                      state.isValid,
                    ),
                    titleColor: AppColors.widgetBackgroundColor,
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
