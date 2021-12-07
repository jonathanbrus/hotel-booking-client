import 'package:flutter/material.dart';

import '../components/city_avatar.dart';

class Cities extends StatelessWidget {
  const Cities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                Theme.of(context).colorScheme.secondaryVariant.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
        scrollDirection: Axis.horizontal,
        children: [
          const City(
            name: "Nearby",
            query: "Nagercoild",
          ),
          ...map.map(
            (e) => const City(
                name: "Nagercoil",
                query: "Nagercoil",
                image:
                    "https://images.unsplash.com/photo-1514565131-fce0801e5785?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0eXNjYXBlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
          )
        ],
      ),
    );
  }
}

List map = [1, 2, 3, 4, 5, 6, 7, 8, 8];
