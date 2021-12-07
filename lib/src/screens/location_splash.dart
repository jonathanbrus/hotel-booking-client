import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationSplash extends StatelessWidget {
  final bool initialized;
  final bool enabled;

  const LocationSplash({
    required this.initialized,
    required this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              "assets/lottie/location_loading.json",
              height: 160,
              width: 160,
            ),
            if (initialized && !enabled)
              Text(
                "Please Enable Location",
                style: TextStyle(
                  fontSize: width * 0.04,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
