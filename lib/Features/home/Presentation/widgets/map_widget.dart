import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final LatLng initialLocation;
  final void Function(LatLng)? onMapTap;
  final MapController controller;

  const MapWidget({
    super.key,
    required this.initialLocation,
    required this.controller,
    this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: initialLocation,
        initialZoom: 14,
        onTap: (tapPosition, point) => onMapTap?.call(point),
      ),
      children: [
        TileLayer(
          urlTemplate:
            "https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}.png?key=YOUR_KEY",
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: initialLocation,
              width: 50,
              height: 50,
              child: const Icon(
                Icons.location_pin,
                size: 40,
                color: Colors.red,
              ),
            )
          ],
        ),
      ],
    );
  }
}
