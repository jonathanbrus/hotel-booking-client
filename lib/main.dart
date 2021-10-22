import "package:flutter/material.dart";

import "./src/app.dart";

import "./src/services/http_client.dart";

void main() {
  HttpClient().initialize();
  runApp(const MyApp());
}
