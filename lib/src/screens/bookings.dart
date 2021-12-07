import 'package:flutter/material.dart';

import '../components/booking.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 12),
              const Booking(),
              const Booking(),
              const Booking(),
              const Booking(),
              const Booking(),
              const Booking(),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: const Text("Bookings"),
      actions: [
        IconButton(
          splashRadius: 26,
          onPressed: () {},
          icon: const Icon(Icons.info_outline_rounded),
        ),
      ],
    );
  }
}
