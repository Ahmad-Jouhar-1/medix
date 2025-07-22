import 'package:clinic_management_system/app/bottom_navigation_bar/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => BottomNavigationBarBloc());
}
