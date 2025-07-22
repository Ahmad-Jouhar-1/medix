import 'package:clinic_management_system/app/appointments/views/screens/appointments_screen.dart';
import 'package:clinic_management_system/app/bills/views/screens/bills_screen.dart';
import 'package:clinic_management_system/app/bottom_navigation_bar/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_management_system/app/bottom_navigation_bar/views/widgets/salomon_bottom_bar_widget.dart';
import 'package:clinic_management_system/app/departments/views/screens/departments_screen.dart';
import 'package:clinic_management_system/app/home/views/screens/home_screen.dart';
import 'package:clinic_management_system/core/constants/app_colors.dart';
import 'package:clinic_management_system/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<BottomNavigationBarBloc>()..add(CurrentIndexChanged(0)),
      child:
          BlocSelector<BottomNavigationBarBloc, BottomNavigationBarState, int>(
            selector: (state) {
              return state.currentIndex;
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: IndexedStack(
                  index: state,
                  children: [
                    const HomeScreen(),
                    const AppointmentsScreen(),
                    const DepartmentsScreen(),
                    const BillsScreen(),
                  ],
                ),
                bottomNavigationBar: SafeArea(child: SalomonBottomBarWidget()),
              );
            },
          ),
    );
  }
}
