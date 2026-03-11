import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../repositories/auth_repository.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_cubit.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> call({required String password}) {
    return repository.resetPassword(password: password);
  }
}