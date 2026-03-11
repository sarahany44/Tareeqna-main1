import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tareeqna/Features/Authentication/data/repositories/auth_repository_impl.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/resend_verify_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/verify_email_usecase.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification_cubit/cubit/verification_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification_screen/erificationScreenBody.dart';
import 'package:tareeqna/core/network/dio_service.dart';


class VerificationScreen extends StatelessWidget {
  final String email;

  const VerificationScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    // Create repository
    final repository = AuthRepositoryImpl(
      AuthRemoteDataSourceImpl(
        DioService().dio,
      ),
    );

    return BlocProvider(
      create: (_) => VerificationCubit(
        VerifyEmailUseCase(repository),
        ResendVerifyEmailUseCase(repository),
      ),
      child: Scaffold(
        body: VerificationScreenBody(email: email),
      ),
    );
  }
}