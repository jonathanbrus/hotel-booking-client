import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [],
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
      title: const Text("Offers"),
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
