import 'package:flutter/material.dart';

import '../screens/search_result.dart';

class City extends StatelessWidget {
  final String name;
  final String query;
  final String? image;
  const City({
    required this.name,
    required this.query,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          SearchResults.routeName,
          arguments: [query],
        ),
        child: Column(
          children: [
            image != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(image!),
                    radius: 26,
                  )
                : CircleAvatar(
                    child: Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 26,
                  ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontSize: width * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
