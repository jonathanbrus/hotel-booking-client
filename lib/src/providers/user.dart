import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final String _name = "";
  final String _phone = "";
  final String _email = "";
  final String _state = "";
  final String _city = "";
  final int _creditPoints = 0;

  String get name => _name;

  String get phone => _phone;

  String get email => _email;

  String get state => _state;

  String get city => _city;

  int get creditPoints => _creditPoints;
}
