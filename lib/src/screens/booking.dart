import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  static const routeName = "/booking";

  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Booking"),
          )
        ],
      ),
    );
  }
}
