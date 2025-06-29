import 'dart:math';

import 'package:clinic_management_system/app/book_appointment/models/time_model.dart';
import 'package:clinic_management_system/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/items/times_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimesWidget extends StatelessWidget {
  const TimesWidget({
    super.key,
    required this.times,
    required this.currentDoctorId,
    required this.shift,
  });

  final List<TimeModel> times;
  final int currentDoctorId;
  final String shift;

  @override
  Widget build(BuildContext context) {
    int specifyItemCount() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown =
            context.read<TimesBloc>().state.areMorningTimesDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      } else {
        isDroppedDown =
            context.read<TimesBloc>().state.areAfternoonTimesDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      }
    }

    String specifyDropDownButtonTitle() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown =
            context.read<TimesBloc>().state.areMorningTimesDroppedDown;
        return isDroppedDown ? "Less" : "More";
      } else {
        isDroppedDown =
            context.read<TimesBloc>().state.areAfternoonTimesDroppedDown;
        return isDroppedDown ? "Less" : "More";
      }
    }

    return BlocBuilder<TimesBloc, TimesState>(
      builder: (context, state) {
        return TimesGridViewItem(
          times: times,
          currentDoctorId: currentDoctorId,
          currentTimeId: state.currentTimeId,
          previousTimeId: state.previousTimeId,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          itemCount: specifyItemCount(),
          dropDownButtonTitle: specifyDropDownButtonTitle(),
          shift: shift,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        );
      },
    );
  }
}
