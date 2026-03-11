// lib/Features/Home/data/repositories/location_repository.dart

import 'package:tareeqna/Features/Home/Data/datasources/location_service.dart';
import 'package:tareeqna/Features/Home/domain/entities/user_location.dart';

class LocationRepository {
  final LocationService service;

  LocationRepository(this.service);

  Future<UserLocation> getUserLocation() async {
    return service.getCurrentLocation();
  }
}
