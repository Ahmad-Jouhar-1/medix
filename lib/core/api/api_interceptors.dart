import 'package:clinic_management_system/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer 2|J7PjqvzmyVskKFhS9RbhY15hYNP4FDJIiVYxhB43a720068f";
    super.onRequest(options, handler);
  }
}
