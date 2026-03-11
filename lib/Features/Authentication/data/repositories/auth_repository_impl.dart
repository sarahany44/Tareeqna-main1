import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../Core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/register_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final model = RegisterRequestModel(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      final user = await remoteDataSource.register(model);
      return Right(user);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Registration failed';
      return Left(Failure(message));
    } catch (e) {
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifyEmail(email: email, otp: otp);
      return const Right(null);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Verification failed';
      return Left(Failure(message));
    } catch (e) {
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> resendVerifyEmail(String email) async {
    try {
      await remoteDataSource.resendVerifyEmail(email);
      return const Right(null);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Resend failed';
      return Left(Failure(message));
    } catch (e) {
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> setPassword({
    required String password,
  }) async {
    try {
      await remoteDataSource.setPassword(password: password);
      return const Right(null);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Set password failed';
      return Left(Failure(message));
    } catch (e) {
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String password,
  }) async {
    try {
      await remoteDataSource.resetPassword(password: password);
      return const Right(null);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Reset password failed';
      return Left(Failure(message));
    } catch (e) {
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }
}