import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final Size size;

  const Rating({
    required this.rating,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.green,
      ),
      child: Row(
        children: [
          Text(
            "$rating",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.032,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
