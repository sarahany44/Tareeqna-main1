import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/resend_verify_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/verify_email_usecase.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResendVerifyEmailUseCase resendUseCase;

  VerificationCubit(
    this.verifyEmailUseCase,
    this.resendUseCase,
  ) : super(VerificationInitial());

  Future<void> verify({
    required String email,
    required String otp,
  }) async {
    emit(VerificationLoading());

    final result = await verifyEmailUseCase(
      email: email,
      otp: otp,
    );

    result.fold(
      (failure) => emit(VerificationFailure(failure.message)),
      (_) => emit(VerificationSuccess()),
    );
  }

  Future<void> resend(String email) async {
    emit(ResendLoading());

    final result = await resendUseCase(email);

    result.fold(
      (failure) => emit(ResendFailure(failure.message)),
      (_) => emit(ResendSuccess()),
    );
  }

  void reset() {
    emit(VerificationInitial());
  }
}