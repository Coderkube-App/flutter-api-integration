import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A custom interceptor for logging API requests, responses, and errors.
/// 
/// Logging is only performed in [kDebugMode] to prevent leaking sensitive information in production.
class ApiLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      // TODO: Use a more structured logging library instead of print.
      print('--- API Request ---');
      print('URL: ${options.uri}');
      print('Method: ${options.method}');
      print('Headers: ${options.headers}');
      print('Body: ${options.data}');
      print('-------------------');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('--- API Response ---');
      print('Status Code: ${response.statusCode}');
      print('Data: ${response.data}');
      print('--------------------');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('--- API Error ---');
      print('URL: ${err.requestOptions.uri}');
      print('Error: ${err.message}');
      print('Type: ${err.type}');
      print('Response: ${err.response?.data}');
      print('-----------------');
    }
    return super.onError(err, handler);
  }
}
