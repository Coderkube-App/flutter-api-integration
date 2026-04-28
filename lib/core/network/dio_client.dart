import 'package:dio/dio.dart';
import 'api_logger.dart';
import 'api_endpoints.dart';

/// A singleton client for making HTTP requests using the Dio package.
class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  /// Factory constructor to return the same [DioClient] instance.
  factory DioClient() {
    return _instance;
  }

  /// Internal constructor for initializing the Dio instance.
  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        // TODO: Move base URL to a configuration file or environment variable.
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'User-Agent':
          //     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        },
      ),
    );

    // Add Interceptors for logging and authentication
    dio.interceptors.add(ApiLogger());

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // TODO: Implement authentication token injection logic.
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // TODO: Implement global error handling (e.g., token expiration, connectivity issues).
          return handler.next(e);
        },
      ),
    );
  }
}
