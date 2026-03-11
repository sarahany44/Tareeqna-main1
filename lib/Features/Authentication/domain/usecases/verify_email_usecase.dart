  import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../repositories/auth_repository.dart';

class VerifyEmailUseCase {
  final AuthRepository repository;

  VerifyEmailUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String otp,
  }) {
    return repository.verifyEmail(email: email, otp: otp);
  }
}