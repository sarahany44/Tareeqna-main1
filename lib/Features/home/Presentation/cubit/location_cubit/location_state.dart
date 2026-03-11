// lib/Features/Home/presentation/cubit/location_cubit/location_state.dart

import 'package:tareeqna/Features/Home/domain/entities/user_location.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {

  final UserLocation location;

  LocationLoaded(this.location);

}

class LocationError extends LocationState {

  final String message;

  LocationError(this.message);
  
}
