import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    return repository.register(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}