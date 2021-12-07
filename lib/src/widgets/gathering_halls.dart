import 'package:flutter/material.dart';

import '../components/hall.dart';

class GatheringHalls extends StatefulWidget {
  const GatheringHalls({Key? key}) : super(key: key);

  @override
  _GatheringHallsState createState() => _GatheringHallsState();
}

class _GatheringHallsState extends State<GatheringHalls> {
  List halls = [1, 2, 3, 4, 5, 6, 7, 8];

  bool lastElement(e) => halls.indexOf(e) == (halls.length - 1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          child: Text(
            "Venues for gathering",
            style: TextStyle(
              height: 1.6,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...halls.map(
                (e) => Hall(
                  lastElement: lastElement(e),
                  name: "SKV Mahal",
                  addressDescription:
                      "Near Kanyakumari Arch, Vivekanandapuram, Kanyakumari",
                  rating: 4.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
