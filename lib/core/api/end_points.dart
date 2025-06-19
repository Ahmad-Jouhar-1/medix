class EndPoints {
  static String baseUrl = "http://192.168.1.2:8000";
  static String getDefaultDays(int startId, int endId) {
    return "/api/default_times?start_id=$startId&end_id=$endId";
  }

  static String getDepartmentDays(int departmentId) {
    return "/api/department/$departmentId";
  }

  static String departments = "/api/departments";
  static String defaultDays = "/api/default_days";
  static String availableSlotsByShift = "/api/availableSlotsByShift";
}

class ApiKey {
  static String accept = "Accept";
  static String errorMessage = "message";
  static String startId = "start_id";
  static String endId = "end_id";
}
