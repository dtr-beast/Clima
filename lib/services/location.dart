import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;

  Future<void> getCurrentLocation() async {
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
