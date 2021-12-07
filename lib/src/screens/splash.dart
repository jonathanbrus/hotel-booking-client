import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplash extends StatefulWidget {
  final VoidCallback callback;
  const CustomSplash({required this.callback, Key? key}) : super(key: key);

  @override
  _CustomSplashState createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    super.initState();
  }

  Future controlSplash() async {
    await _controller.forward();

    if (_controller.isCompleted) {
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    controlSplash();

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/lottie/splashy.json",
          controller: _controller,
          height: 280,
          width: 280,
          repeat: false,
        ),
      ),
    );
  }
}
