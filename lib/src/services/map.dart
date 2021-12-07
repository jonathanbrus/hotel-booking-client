import 'dart:io';

import 'package:map_launcher/map_launcher.dart';

void showPlace({required Coords coords, required String title}) async {
  final MapType mapType = Platform.isAndroid ? MapType.google : MapType.apple;
  final available = await MapLauncher.isMapAvailable(mapType);

  if (available == null || available == false) {
    return;
  }

  await MapLauncher.showMarker(
    mapType: mapType,
    coords: coords,
    title: title,
  );
}

void showDirections() async {}
