import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tareeqna/Features/Authentication/data/repositories/auth_repository_impl.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/register_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/set_password_usecase.dart';
import 'package:tareeqna/Features/Authentication/domain/usecases/reset_password_usecase.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/set_Password_base.dart';
import 'package:tareeqna/core/network/dio_service.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        registerUseCase: RegisterUseCase(
          AuthRepositoryImpl(AuthRemoteDataSourceImpl(DioService().dio)),
        ),
        setPasswordUseCase: SetPasswordUseCase(
          AuthRepositoryImpl(AuthRemoteDataSourceImpl(DioService().dio)),
        ),
        resetPasswordUseCase: ResetPasswordUseCase(
          AuthRepositoryImpl(AuthRemoteDataSourceImpl(DioService().dio)),
        ),
      ),
      child: const SetPasswordBaseScreen(
        title: "Set Password",
        subtitle: "Set your account password",
        buttonText: "Register",
        isReset: false,
        phoneNumber: '+201272429256',
      ),
    );
  }
}