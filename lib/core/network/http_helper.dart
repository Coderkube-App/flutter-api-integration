import 'package:dio/dio.dart';
import 'dio_client.dart';

/// A helper class that provides a wrapper around the [Dio] client for common HTTP methods.
class HttpHelper {
  final Dio _dio = DioClient().dio;

  /// Performs a GET request to the specified [url].
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a POST request to the specified [url] with optional [data].
  Future<Response> post(String url, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.post(url, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a PUT request to the specified [url] with optional [data].
  Future<Response> put(String url, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.put(url, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a DELETE request to the specified [url] with optional [data].
  Future<Response> delete(String url, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.delete(url, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Processes [DioException] to provide a descriptive error message.
  String _handleDioError(DioException error) {
    String message = "Unknown error occurred";
    print("error:::---${error.type}");
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        message = "Bad response ($statusCode): ${data ?? error.message}";
        break;
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection or server unreachable. Details: ${error.error}";
        break;
      case DioExceptionType.unknown:
        message = "Unexpected error: ${error.message}";
        break;
      default:
        message = "Something went wrong";
        break;
    }
    
    // Log the error for better identification during development
    print(" [HttpHelper Error] Type: ${error.type}, Message: $message");
    if (error.response != null) {
      print(" [HttpHelper Error] Response Data: ${error.response?.data}");
    }
    
    return message;
  }
}
