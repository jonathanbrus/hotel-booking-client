import 'package:flutter/material.dart';

import '../components/hall_variant.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  List halls = [1, 2, 3, 4, 5, 6, 7, 8];

  final images = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/62/e5/48/wooden-walkway.jpg?w=900&h=-1&s=1",
    "https://specials-images.forbesimg.com/imageserve/5d54dc7368cb0a0009171dc2/Baglioni-Resort-Maldives--Maldives/960x0.jpg?fit=scale",
    "https://trekbaron.com/wp-content/uploads/2020/07/types-of-resorts-July282020-1-min.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text("Saved"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...halls.map(
                  (e) => HallVariant(
                    name: "SKV Mahal",
                    addressDescription:
                        "Near Kanyakumari Arch, Vivekanandapuram, Kanyakumari",
                    imageUrls: images,
                    rating: 4.2,
                    saved: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
