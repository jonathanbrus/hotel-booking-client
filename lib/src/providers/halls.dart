import 'package:flutter/material.dart';
import '../models/hall.dart';

class HallsProvider with ChangeNotifier {
  final List<Hall> _nearby = [];
}
