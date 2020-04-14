import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  void getCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print("lat is: ${position.latitude}");
    print(position.longitude);
  }

}