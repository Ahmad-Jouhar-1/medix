import 'package:clinic_management_system/core/api/end_points.dart';

class DepartmentModel {
  final int id;
  final String name;

  DepartmentModel({required this.id, required this.name});

  factory DepartmentModel.fromJson(Map<String, dynamic> jsonData) {
    return DepartmentModel(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
    );
  }
}
