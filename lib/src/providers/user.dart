import 'package:flutter/material.dart';

import '../services/http_client.dart';

import './utils/user.dart';

class UserProvider with ChangeNotifier {
  String _name = "";
  String _phone = "";
  String _email = "";
  String _state = "";
  String _city = "";
  int _creditPoints = 0;

  String get name => _name;

  String get phone => _phone;

  String get email => _email;

  String get state => _state;

  String get city => _city;

  int get creditPoints => _creditPoints;

  void setUser(data) async {
    try {
      _name = await setUserData("name", data["name"]);
      _phone = await setUserData("phone", data["phone"]);
      _email = await setUserData("email", data["email"]);
      _state = await setUserData("state", data["state"]);
      _city = await setUserData("city", data["city"]);
      _creditPoints = await setUserData("creditPoints", data["creditPoints"]);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future init() async {
    if (await userExist() == true) {
      _name = await getUserData("name");
      _phone = await getUserData("phone");
      _email = await getUserData("email");
      _state = await getUserData("state");
      _city = await getUserData("city");
      _creditPoints = int.parse(await getUserData("creditPoints"));
    }
    notifyListeners();
  }

  Future<void> createUser() async {
    try {
      final data = await postHttp(path: "/users/profile");

      _name = await setUserData("name", data["name"]);
      _phone = await setUserData("phone", data["phone"]);
      _email = await setUserData("email", data["email"]);
      _state = await setUserData("state", data["state"]);
      _city = await setUserData("city", data["city"]);
      _creditPoints = await setUserData("creditPoints", data["creditPoints"]);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> updateUser() async {
    try {
      final data = await patchHttp(path: "/users/profile");

      _name = await setUserData("name", data["name"]);
      _phone = await setUserData("phone", data["phone"]);
      _email = await setUserData("email", data["email"]);
      _state = await setUserData("state", data["state"]);
      _city = await setUserData("city", data["city"]);
      _creditPoints = await setUserData("creditPoints", data["creditPoints"]);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> deleteUser() async {}
}
