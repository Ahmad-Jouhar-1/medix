import 'package:clinic_management_system/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer 1|Rt8QD1TyRaZN8L5a5jQ9B7piMnfeALRma7FeWAmqb1ca0d56";
    options.connectTimeout = Duration(seconds: 2);
    super.onRequest(options, handler);
  }
}
