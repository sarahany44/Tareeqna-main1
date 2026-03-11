import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../repositories/auth_repository.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_state.dart';

class SetPasswordUseCase {
  final AuthRepository repository;

  SetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> call({required String password}) {
    return repository.setPassword(password: password);
  }
}