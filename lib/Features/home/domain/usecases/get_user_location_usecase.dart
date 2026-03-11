
import 'package:tareeqna/Features/Home/Data/repositories/location_repository.dart';
import 'package:tareeqna/Features/Home/domain/entities/user_location.dart';

class GetUserLocationUseCase {
  final LocationRepository repository;

  GetUserLocationUseCase(this.repository);

  Future<UserLocation> call() async {
    return repository.getUserLocation();
  }
}
