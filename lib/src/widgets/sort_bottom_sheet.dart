import 'package:flutter/material.dart';

showSortBottomSheet(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              "SORT BY",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: size.width * 0.04,
              ),
            ),
          ),
          const Tile(
            selected: true,
            icon: Icons.fireplace_rounded,
            title: "Popularity",
          ),
          const Tile(
            selected: false,
            icon: Icons.star_outline_rounded,
            title: "Guest Rating",
          ),
          const Tile(
            selected: false,
            icon: Icons.arrow_downward_rounded,
            title: "Low to High Prices",
          ),
          const Tile(
            selected: false,
            icon: Icons.arrow_upward_rounded,
            title: "Hight to Low Prices",
          ),
          const Tile(
            selected: false,
            icon: Icons.location_on_outlined,
            title: "Distance",
          ),
        ],
      ),
    ),
  );
}

class Tile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;

  const Tile({
    required this.selected,
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () => Navigator.pop(context),
      selected: selected,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
