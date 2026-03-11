import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String otp,
  });

  Future<Either<Failure, void>> resendVerifyEmail(String email);

  Future<Either<Failure, void>> setPassword({
    required String password,
  });

  Future<Either<Failure, void>> resetPassword({
    required String password,
  });
}