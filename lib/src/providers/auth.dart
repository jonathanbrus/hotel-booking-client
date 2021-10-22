import 'package:flutter/material.dart';

enum AuthStatus { aunthenticated, unAunthenticated }

class AuthProvider with ChangeNotifier {
  final AuthStatus _status = AuthStatus.unAunthenticated;
  final String _token = "";

  AuthStatus get status => _status;

  String get token => _token;

  Future<void> sendOtp({required String phone}) async {}

  Future<void> verify({required String otp}) async {}

  Future<void> createUser({
    required String name,
    required String email,
    String? state,
    String? city,
  }) async {}

  Future<void> logOut() async {}
}
