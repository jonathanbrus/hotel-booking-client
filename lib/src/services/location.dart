import 'package:location/location.dart';
import './utils/current_city.dart';

Future getLocation() async {
  Location location = new Location();

  LocationData _locationData;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();

  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();

  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return {"hasPermission": false};
    }
  }

  _locationData = await location.getLocation();

  String? city;

  try {
    city = await getCity(_locationData.latitude, _locationData.longitude);
  } catch (e) {
    print(e);
  }

  return {
    "lat": _locationData.latitude,
    "long": _locationData.longitude,
    "city": city,
    "hasPermission": _permissionGranted == PermissionStatus.granted
  };
}
