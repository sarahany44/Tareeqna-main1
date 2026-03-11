 import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioService {
  late final Dio dio;
  final Logger _logger = Logger();

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://on-road-backend.vercel.app/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // Add interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.i('🚀 REQUEST: ${options.method} ${options.uri}');
          _logger.i('📤 HEADERS: ${options.headers}');
          _logger.i('📤 DATA: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d('✅ RESPONSE: ${response.statusCode}');
          _logger.d('📥 DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          _logger.e('❌ ERROR TYPE: ${error.type}');
          _logger.e('❌ ERROR MESSAGE: ${error.message}');
          _logger.e('📛 RESPONSE DATA: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }
}