import 'package:flutter/material.dart';

final snackBar = SnackBar(
  content: const Text(
    "Press again to exit",
    textAlign: TextAlign.center,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  behavior: SnackBarBehavior.floating,
  duration: const Duration(seconds: 1),
  elevation: 2,
  width: 160,
);
