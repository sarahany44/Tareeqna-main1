import 'register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/register_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/set_password_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/reset_password_usecase.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;
  final SetPasswordUseCase setPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit({
    required this.registerUseCase,
    required this.setPasswordUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await registerUseCase(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    result.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> setPassword({required String password}) async {
    emit(AuthLoading());
    final result = await setPasswordUseCase(password: password);
    result.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (_) => emit(AuthPasswordSet()),
    );
  }

  Future<void> resetPassword({required String password}) async {
    emit(AuthLoading());
    final result = await resetPasswordUseCase(password: password);
    result.fold(
          (failure) => emit(AuthFailure(failure.message)),
           (_) => emit(AuthPasswordReset()),
    );
  }

  void reset() {
    emit(AuthInitial());
  }
}