import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app.dart';
import './screens/otp.dart';

import './providers/auth.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final AuthStatus authenticated = Provider.of<AuthProvider>(context).status;

    if (authenticated == AuthStatus.unAunthenticated) {
      return const VerifyOtp();
    } else {
      return const App();
    }
  }
}
