import 'package:flutter/material.dart';

import '../services/http_client.dart';
import './utils/halls_iterator.dart';

import '../models/hall.dart';
import '../models/coords.dart';

class HallsProvider with ChangeNotifier {
  late Coords _coords;

  List<Hall> _nearby = [];
  List<Hall> _searched = [];

  final Map<String, dynamic> filters = {
    "city": "",
    "type": "",
    "rating": "",
    "facilites": "",
  };

  void setCoords(lat, long) {
    _coords = Coords(lat: lat, long: long);
    notifyListeners();
  }

  List<Hall> get nearbyHalls => [..._nearby];

  List<Hall> get searchedHalls => [..._searched];

  Future<void> fetchHalls(String city, bool nearby) async {
    print("$city ${_coords.lat} ${_coords.long}");

    try {
      final data = await getHttp(
        path: "/halls",
        params: {
          "lat": _coords.lat,
          "long": _coords.long,
        },
      );
      if (nearby) {
        _nearby = iterateHalls(data);
      } else {
        _searched = iterateHalls(data);
      }
    } catch (e) {
      print("from catch $e");
    }
  }
}
