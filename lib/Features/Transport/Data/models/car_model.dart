// models/car_model.dart
class CarModel {
  final String name;
  final String type; // Automatic / Manual
  final int seats;
  final String fuelType; // Octane / Electric ...
  final String distance; // "800m"
  final String time; // "5mins away"
  final String imagePath;

  CarModel({
    required this.name,
    required this.type,
    required this.seats,
    required this.fuelType,
    required this.distance,
    required this.time,
    required this.imagePath,
  });
}
