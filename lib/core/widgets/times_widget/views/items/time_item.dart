import 'dart:developer';

import 'package:clinic_management_system/app/book%20appointment/models/time_model.dart';
import 'package:clinic_management_system/core/errors/constants/app_colors.dart';
import 'package:clinic_management_system/core/errors/constants/app_dimensions.dart';
import 'package:clinic_management_system/core/errors/constants/app_shadow.dart';
import 'package:clinic_management_system/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.time,
    required this.currentTimeId,
    required this.previousTimeId,
    required this.currentDay,
    required this.previousDay,
  });

  final TimeModel time;
  final int currentTimeId;
  final int previousTimeId;
  final String currentDay;
  final String previousDay;

  @override
  Widget build(BuildContext context) {
    Color specifyBackgroundColor() {
      if (time.id == previousTimeId && currentDay == previousDay) {
        log(
          "Times Previous Slot: 1-CurrentTimeId: $currentTimeId 2-PreviousTimeId $previousTimeId",
        );
        return AppColors.transparentYellow;
      } else if (time.id == currentTimeId) {
        return AppColors.primaryColor;
      } else {
        return AppColors.widgetBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (time.id == previousTimeId && currentDay == previousDay ||
          time.id == currentTimeId) {
        return AppColors.widgetBackgroundColor;
      } else if (time.isAvailable) {
        return AppColors.mainTextColor;
      } else {
        return AppColors.hintTextColor;
      }
    }

    String formatDateToTime(String time) {
      return DateFormat("h:mma").format(DateFormat("HH:mm:ss").parse(time));
    }

    return InkWell(
      onTap: () {
        if (time.id == previousTimeId && currentDay == previousDay ||
            time.isAvailable) {
          context.read<TimesBloc>().add(
            CurrentTimeIdChanged(currentTimeId: time.id),
          );
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: specifyBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          formatDateToTime(time.time),
          style: TextStyle(
            color: specifyTitleColor(),
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
