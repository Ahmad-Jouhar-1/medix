import 'dart:math';

import 'package:clinic_management_system/app/book%20appointment/models/time_model.dart';
import 'package:clinic_management_system/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/items/times_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimesWidget extends StatelessWidget {
  const TimesWidget({super.key, required this.times, required this.shift});

  final List<TimeModel> times;
  final String shift;

  @override
  Widget build(BuildContext context) {
    int specifyItemCount() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown = context.read<TimesBloc>().state.isMorningDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      } else {
        isDroppedDown = context.read<TimesBloc>().state.isAfternoonDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      }
    }

    String specifyDropDownButtonTitle() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown = context.read<TimesBloc>().state.isMorningDroppedDown;
        return isDroppedDown ? "Less" : "More";
      } else {
        isDroppedDown = context.read<TimesBloc>().state.isAfternoonDroppedDown;
        return isDroppedDown ? "Less" : "More";
      }
    }

    return BlocBuilder<TimesBloc, TimesState>(
      builder: (context, state) {
        return TimesGridViewItem(
          times: times,
          previousTimeId: state.previousTimeId,
          currentTimeId: state.currentTimeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          itemCount: specifyItemCount(),
          dropDownButtonTitle: specifyDropDownButtonTitle(),
          shift: shift,
        );
      },
    );
  }
}
