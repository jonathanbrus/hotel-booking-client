import "package:flutter/material.dart";
import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import "./src/index.dart";

import './src/constants/theme.dart';

// Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: colorScheme.primary),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // await Firebase.initializeApp();
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // _firebaseMessaging.getToken().then((value) => print(value));

  // FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

  runApp(const MyApp());
}
