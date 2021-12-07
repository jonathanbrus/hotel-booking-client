import 'package:flutter/material.dart';

import './search.dart';

import '../widgets/sort_bottom_sheet.dart';

import '../components/hall_variant.dart';

class SearchResults extends StatefulWidget {
  static const routeName = "/search-results";
  const SearchResults({Key? key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List halls = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

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
          const AppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: const Text(
                    "13 Mandapams found in Nagercoil",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ...halls.map(
                  (e) => HallVariant(
                    name: "SKV Mahal",
                    addressDescription:
                        "Near Kanyakumari Arch, Vivekanandapuram, Kanyakumari",
                    imageUrls: images,
                    rating: 4.2,
                    saved: false,
                  ),
                ),
                const SizedBox(height: 56),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSortBottomSheet(context),
        icon: const Icon(Icons.sort_rounded),
        label: const Text("Sort"),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      floating: true,
      title: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, Search.routeName),
        borderRadius: BorderRadius.circular(26),
        child: Container(
          height: 42,
          width: width,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Colors.white.withOpacity(0.8),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            "Search",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              fontWeight: FontWeight.normal,
              fontSize: width * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
