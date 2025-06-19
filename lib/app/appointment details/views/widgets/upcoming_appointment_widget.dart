import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_reservation_bloc/fetch_reservation_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/controllers/upcoming_validator_bloc/upcoming_validator_bloc.dart';
import 'package:clinic_management_system/app/appointment%20details/models/upcoming_appointment_models/validator_names.dart';
import 'package:clinic_management_system/app/appointment%20details/views/widgets/summary_widgets/summary_widget.dart';
import 'package:clinic_management_system/app/appointments/models/appointment_model.dart';
import 'package:clinic_management_system/app/book%20appointment/models/reservation_model.dart';
import 'package:clinic_management_system/core/errors/constants/app_colors.dart';
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
import 'package:clinic_management_system/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingAppointmentWidget extends StatelessWidget {
  const UpcomingAppointmentWidget({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    Color specifyBackgroundColor(bool isValid) {
      return isValid ? AppColors.primaryColor : AppColors.hintTextColor;
    }

    String specifyEditButtonTitle(String validatorName) {
      return validatorName == ValidatorNames.cancel ? "Edit" : "Editing";
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<UpcomingValidatorBloc>()
                    ..add(CheckCancelAbility(appointmentId: appointment.id)),
        ),
        BlocProvider(
          create: (context) => getIt<FetchDaysBloc>()..add(FetchDefaultDays()),
        ),
        BlocProvider(
          create:
              (context) =>
                  getIt<FetchTimesBloc>()
                    ..add(FetchDefaultTimes(shift: appointment.shift)),
        ),
        BlocProvider(create: (context) => getIt<FetchReservationBloc>()),
        BlocProvider(create: (context) => getIt<RequestTypesBloc>()),
        BlocProvider(create: (context) => getIt<DaysBloc>()),
        BlocProvider(create: (context) => getIt<TimesBloc>()),
        BlocProvider(create: (context) => getIt<TitledCheckboxBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchReservationBloc, FetchReservationState>(
            listener: (context, state) {
              switch (state) {
                case FetchReservationLoading():
                  context.read<FetchDaysBloc>().add(ShowDaysLoading());
                  context.read<FetchTimesBloc>().add(ShowTimesLoading());
                case FetchReservationLoaded():
                  ReservationModel reservation = state.reservation;
                  context.read<UpcomingValidatorBloc>().add(
                    ReservationsAreSet(reservation: reservation),
                  );
                  context.read<DaysBloc>().add(
                    DaysBlocDaysIdsAreSet(day: reservation.day),
                  );
                  context.read<FetchDaysBloc>().add(
                    FetchDays(departmentId: reservation.departmentId),
                  );
                  context.read<TimesBloc>().add(
                    TimesIdsAreSet(timeId: reservation.timeId),
                  );
                  context.read<TitledCheckboxBloc>().add(
                    ActivatedAndChecksAreSet(
                      isChecked: reservation.withMedicalReport,
                    ),
                  );
                  context.read<RequestTypesBloc>().add(
                    ActivatedAndRequestTypeIdsAreSet(
                      requestTypeId: reservation.requestTypeId,
                    ),
                  );
                case FetchReservationFailed():
                  context.read<FetchDaysBloc>().add(ShowDaysError());
                  context.read<FetchTimesBloc>().add(ShowTimesError());
              }
            },
          ),
          BlocListener<RequestTypesBloc, RequestTypesState>(
            listener: (context, state) {
              context.read<UpcomingValidatorBloc>().add(
                CheckEditAbility(requestTypeId: state.currentRequestTypeId),
              );
            },
          ),
          BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
            listener: (context, state) {
              context.read<UpcomingValidatorBloc>().add(
                CheckEditAbility(withMedicalReport: state.isCurrentChecked),
              );
            },
          ),
          BlocListener<DaysBloc, DaysState>(
            listener: (context, state) {
              String validatorName =
                  context.read<UpcomingValidatorBloc>().state.validatorName;
              if (validatorName == ValidatorNames.edit) {
                // context.read<FetchTimesBloc>().add(
                //   FetchTimes(day: state.currentDay, shift: appointment.shift),
                // );
                context.read<TimesBloc>().add(
                  TimesBlocDayIdsChanged(
                    previousDay: state.previousDay,
                    currentDay: state.currentDay,
                  ),
                );
              }
            },
          ),
          BlocListener<TimesBloc, TimesState>(
            listener: (context, state) {
              context.read<UpcomingValidatorBloc>().add(
                CheckEditAbility(
                  day: state.currentDay,
                  timeId: state.currentTimeId,
                ),
              );
            },
          ),
        ],
        child: ListView(
          children: [
            SummaryWidget(appointment: appointment),
            BlocBuilder<UpcomingValidatorBloc, UpcomingValidatorState>(
              builder: (context, state) {
                return SubtitleWithTextButtonWidget(
                  subtitle: "Reservation Info",
                  buttonTitle: specifyEditButtonTitle(state.validatorName),
                  onPressed: () {
                    if (state.validatorName == ValidatorNames.cancel) {
                      context.read<FetchReservationBloc>().add(
                        FetchReservation(appointmentId: appointment.id),
                      );
                    } else {
                      context.read<TimesBloc>().add(TimesReset());
                      context.read<DaysBloc>().add(DaysReset());
                      context.read<TitledCheckboxBloc>().add(
                        TitledCheckboxReset(),
                      );
                      context.read<RequestTypesBloc>().add(RequestTypesReset());
                      context.read<FetchDaysBloc>().add(FetchDefaultDays());
                      context.read<FetchTimesBloc>().add(
                        FetchDefaultTimes(shift: appointment.shift),
                      );
                    }
                    context.read<UpcomingValidatorBloc>().add(
                      SwitchValidator(),
                    );
                  },
                );
              },
            ),
            RequestTypesWidget(),
            SubtitleWidget(subtitle: "Date"),
            BlocBuilder<FetchDaysBloc, FetchDaysState>(
              builder: (context, state) {
                switch (state) {
                  case FetchDaysLoading():
                    return ShimmerDaysWidget();
                  case FetchDaysLoaded():
                    return DaysWidget(days: state.days);
                  case FetchDaysFailed():
                    return Text(state.errorMessage);
                }
              },
            ),
            SubtitleWidget(subtitle: "Time"),
            BlocBuilder<FetchTimesBloc, FetchTimesState>(
              builder: (context, state) {
                switch (state) {
                  case FetchTimesLoading():
                    return ShimmerTimesWidget();
                  case FetchTimesLoaded():
                    return TimesWidget(
                      times: state.dayTimes,
                      shift: appointment.shift,
                    );
                  case FetchTimesFailed():
                    return Text(state.errorMessage);
                }
              },
            ),
            TitledCheckboxWidget(title: "Do you need a medical report?"),
            BlocBuilder<UpcomingValidatorBloc, UpcomingValidatorState>(
              builder: (context, state) {
                switch (state.validatorName) {
                  case ValidatorNames.edit:
                    return ButtonWidget(
                      title: ValidatorNames.edit,
                      backgroundColor: specifyBackgroundColor(state.isValid),
                      titleColor: AppColors.widgetBackgroundColor,
                      onTap: () {},
                    );
                  default:
                    return ButtonWidget(
                      title: ValidatorNames.cancel,
                      backgroundColor: specifyBackgroundColor(state.isValid),
                      titleColor: AppColors.widgetBackgroundColor,
                      onTap: () {},
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
