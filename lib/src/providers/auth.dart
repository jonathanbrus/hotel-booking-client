import 'package:flutter/material.dart';

import '../services/http_client.dart';

enum AuthStatus { aunthenticated, unAunthenticated }

class AuthProvider with ChangeNotifier {
  AuthStatus _status = AuthStatus.unAunthenticated;
  String _token = "";

  AuthStatus get status => _status;

  String get token => _token;

  void setStatus(AuthStatus status) {
    _status = status;

    notifyListeners();
  }

  Future<void> sendOtp({required String phone}) async {
    try {
      final data = await postHttp(path: "/otp");

      print(data);
    } catch (e) {
      print("from otp catch $e");
    }
  }

  Future<void> verify({required String otp, Function? setUser}) async {
    try {
      final data = await getHttp(path: "/otp");

      print(data);

      _token = data["token"];
      setUser!(data["user"]);
    } catch (e) {
      print("from otp catch $e");
    }
  }

  Future<void> logOut() async {}
}
