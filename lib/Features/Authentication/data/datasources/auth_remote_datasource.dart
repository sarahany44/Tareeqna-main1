import 'package:dio/dio.dart';
import '../../../../Core/constants/api_urls.dart';
import '../models/register_request_model.dart';
import '../models/set_password_request_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(RegisterRequestModel model);
  Future<void> verifyEmail({required String email, required String otp});
  Future<void> resendVerifyEmail(String email);
  Future<void> setPassword({required String password});
  Future<void> resetPassword({required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> register(RegisterRequestModel model) async {
    try {
      final response = await dio.post(
        ApiUrls.register,
        data: model.toJson(),
      );

      print('📧 REGISTER RESPONSE STATUS: ${response.statusCode}');
      print('📧 REGISTER RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

                // Check if backend sends a message about OTP
        if (data['message'] != null) {
          print('📨 Backend Message: ${data['message']}');
        }

        // Handle different response structures
        if (data['user'] != null) {
          return UserModel.fromJson(data['user']);
        } else if (data['data'] != null) {
          return UserModel.fromJson(data['data']);
        } else {
          return UserModel.fromJson(data);
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Registration failed',
        );
      }
    } on DioException catch (e) {
      print('❌ REGISTER ERROR: ${e.message}');
      print('❌ ERROR RESPONSE: ${e.response?.data}');

      if (e.type == DioExceptionType.connectionError) {
        throw DioException(
          requestOptions: e.requestOptions,
          message: 'No internet connection',
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      print('🔐 VERIFYING EMAIL: $email with OTP: $otp');

      final response = await dio.post(
        ApiUrls.verifyEmail,
        data: {'email': email, 'otp': otp},
      );

      print('✅ VERIFY RESPONSE STATUS: ${response.statusCode}');
      print('✅ VERIFY RESPONSE DATA: ${response.data}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Verification failed',
        );
      }
    } on DioException catch (e) {
      print('❌ VERIFY ERROR: ${e.message}');
      print('❌ ERROR RESPONSE: ${e.response?.data}');
      rethrow;
    }
  }

  @override
  Future<void> resendVerifyEmail(String email) async {
    try {
      print('📤 RESENDING OTP to: $email');

      final response = await dio.post(
        ApiUrls.resendVerifyEmail,
        data: {'email': email},
      );

      print('✅ RESEND RESPONSE STATUS: ${response.statusCode}');
      print('✅ RESEND RESPONSE DATA: ${response.data}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Resend failed',
        );
      }
    } on DioException catch (e) {
      print('❌ RESEND ERROR: ${e.message}');
      print('❌ ERROR RESPONSE: ${e.response?.data}');
      rethrow;
    }
  }

  @override
  Future<void> setPassword({required String password}) async {
    try {
      print('🔑 SETTING PASSWORD');

      final response = await dio.post(
        ApiUrls.setPassword,
        data: SetPasswordRequestModel(password: password).toJson(),
      );

      print('✅ SET PASSWORD RESPONSE STATUS: ${response.statusCode}');
      print('✅ SET PASSWORD RESPONSE DATA: ${response.data}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Set password failed',
        );
      }
    } on DioException catch (e) {
      print('❌ SET PASSWORD ERROR: ${e.message}');
      print('❌ ERROR RESPONSE: ${e.response?.data}');
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({required String password}) async {
    try {
      print('🔑 RESETTING PASSWORD');

      final response = await dio.post(
        ApiUrls.resetPassword,
        data: SetPasswordRequestModel(password: password).toJson(),
      );

      print('✅ RESET PASSWORD RESPONSE STATUS: ${response.statusCode}');
      print('✅ RESET PASSWORD RESPONSE DATA: ${response.data}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Reset password failed',
        );
      }
    } on DioException catch (e) {
      print('❌ RESET PASSWORD ERROR: ${e.message}');
      print('❌ ERROR RESPONSE: ${e.response?.data}');
      rethrow;
    }
  }
}