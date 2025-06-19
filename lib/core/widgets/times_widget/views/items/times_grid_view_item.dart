import 'package:clinic_management_system/app/book%20appointment/models/time_model.dart';
import 'package:clinic_management_system/core/errors/constants/app_dimensions.dart';
import 'package:clinic_management_system/core/extentions/percent_sized_extention.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/items/drop_down_button_item.dart';
import 'package:clinic_management_system/core/widgets/times_widget/views/items/time_item.dart';
import 'package:flutter/material.dart';

class TimesGridViewItem extends StatelessWidget {
  const TimesGridViewItem({
    super.key,
    required this.times,
    required this.previousTimeId,
    required this.currentTimeId,
    required this.previousDay,
    required this.currentDay,
    required this.dropDownButtonTitle,
    required this.itemCount,
    required this.shift,
  });

  final List<TimeModel> times;
  final int previousTimeId;
  final int currentTimeId;
  final String previousDay;
  final String currentDay;
  final String dropDownButtonTitle;
  final int itemCount;
  final String shift;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 6.0.hp,
      ),
      itemBuilder: (context, index) {
        switch (index == itemCount) {
          case true:
            return DropDownButtonItem(title: dropDownButtonTitle, shift: shift);
          case false:
            return TimeItem(
              time: times[index],
              previousTimeId: previousTimeId,
              currentTimeId: currentTimeId,
              previousDay: previousDay,
              currentDay: currentDay,
            );
        }
      },
      itemCount: itemCount + 1,
    );
  }
}
