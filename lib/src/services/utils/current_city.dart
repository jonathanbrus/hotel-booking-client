import 'package:geocoding/geocoding.dart';

Future<String?> getCity(double? lat, double? long) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      double.parse("$lat"),
      double.parse("$long"),
    );
    return placemarks[0].locality;
  } catch (e) {
    throw e;
  }
}
