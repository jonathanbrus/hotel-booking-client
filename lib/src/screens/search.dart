import 'package:flutter/material.dart';

import '../components/search_list_tile.dart';

class Search extends StatefulWidget {
  static const routeName = "/search";

  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SearchListTile(
                    name: "Search Nearby",
                    query: "",
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: const Text("All Cities"),
                  ),
                  ...map.map(
                    (e) => const SearchListTile(
                      name: "Nagercoil",
                      query: "Nagercoil",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List map = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      title: Container(
        height: 42,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              splashRadius: 24,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: width * 0.04,
                ),
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: width * 0.04,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
