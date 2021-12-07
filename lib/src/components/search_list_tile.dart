import 'package:flutter/material.dart';

import '../screens/search_result.dart';

class SearchListTile extends StatelessWidget {
  final String name;
  final String query;

  const SearchListTile({
    required this.name,
    required this.query,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon = name == "Search Nearby"
        ? Icons.location_searching_rounded
        : Icons.arrow_forward_ios;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          ),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.pushReplacementNamed(
          context,
          SearchResults.routeName,
          arguments: [query],
        ),
        title: Text(name),
        trailing: Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
