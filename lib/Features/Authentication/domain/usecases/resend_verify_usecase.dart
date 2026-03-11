import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../repositories/auth_repository.dart';


class ResendVerifyEmailUseCase {
  final AuthRepository repository;

  ResendVerifyEmailUseCase(this.repository);

  Future<Either<Failure, void>> call(String email) {
    return repository.resendVerifyEmail(email);
  }
  
}