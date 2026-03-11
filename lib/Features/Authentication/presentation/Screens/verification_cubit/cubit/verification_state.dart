import 'package:equatable/equatable.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object?> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationFailure extends VerificationState {
  final String message;

  const VerificationFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class ResendLoading extends VerificationState {}

class ResendSuccess extends VerificationState {}

class ResendFailure extends VerificationState {
  final String message;

  const ResendFailure(this.message);

  @override
  List<Object?> get props => [message];
}