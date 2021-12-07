import 'package:flutter/material.dart';

import '../components/hall.dart';

class SimilarVenues extends StatefulWidget {
  const SimilarVenues({Key? key}) : super(key: key);

  @override
  _SimilarVenuesState createState() => _SimilarVenuesState();
}

class _SimilarVenuesState extends State<SimilarVenues> {
  List halls = [1, 2, 3, 4, 5, 6, 7, 8];

  bool lastElement(e) => halls.indexOf(e) == (halls.length - 1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
