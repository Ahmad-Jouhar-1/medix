import 'package:clinic_management_system/app/bottom%20navigation%20bar/views/screens/bottom_navigation_bar_screen.dart';
import 'package:clinic_management_system/app_bloc_observer.dart';
import 'package:clinic_management_system/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: BottomNavigationBarScreen());
  }
}
