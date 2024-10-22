import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatelessWidget {
  Location({super.key});

  double latitude = 0;
  double longitude = 0;

  getLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
      ;
      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
