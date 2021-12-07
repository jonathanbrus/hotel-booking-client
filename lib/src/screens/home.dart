import 'package:flutter/material.dart';

import './search.dart';
import './notifications.dart';

import '../widgets/cities.dart';
import '../widgets/popular_halls.dart';
import '../widgets/gathering_halls.dart';

import '../components/credit_point_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Cities(),
              const PopularHalls(),
              const GatheringHalls(),
              const PopularHalls(),
              const CreditPointCard(points: 1000)
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
      title: const Text("AT Mahal"),
      pinned: true,
      actions: [
        IconButton(
          splashRadius: 26,
          onPressed: () => Navigator.pushNamed(context, Search.routeName),
          icon: const Icon(
            Icons.search_rounded,
            size: 26,
          ),
        ),
        IconButton(
          splashRadius: 26,
          onPressed: () => Navigator.pushNamed(
            context,
            Notifications.routeName,
          ),
          icon: const Icon(Icons.notifications_rounded),
        ),
      ],
    );
  }
}
