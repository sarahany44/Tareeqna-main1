import 'package:geolocator/geolocator.dart';
import 'package:tareeqna/Features/Home/domain/entities/user_location.dart';

class LocationService {
  Future<UserLocation> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // check the service is down open the site settings

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      // check 2
      await Future.delayed(const Duration(seconds: 1));
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Location services are still disabled.');
      }
    }

    // checking access privileges

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, cannot request.',
      );
    }

    // take_location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return UserLocation(lat: position.latitude, lng: position.longitude);
  }
}
