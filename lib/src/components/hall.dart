import 'package:flutter/material.dart';

import '../screens/hall_detail.dart';
import './rating.dart';

class Hall extends StatefulWidget {
  final bool lastElement;
  final String name;
  final String addressDescription;
  final double rating;

  const Hall({
    required this.lastElement,
    required this.name,
    required this.addressDescription,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  _HallState createState() => _HallState();
}

class _HallState extends State<Hall> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, HallDetail.routeName),
      child: Container(
        margin: EdgeInsets.only(
          left: 12,
          top: 12,
          right: widget.lastElement ? 12 : 0,
          bottom: 12,
        ),
        width: 180,
        height: 188,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      "https://trekbaron.com/wp-content/uploads/2020/07/types-of-resorts-July282020-1-min.jpg",
                      width: 180,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                    splashRadius: 24,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 8,
                  child: Rating(rating: 4.2, size: size),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 4,
                right: 8,
                bottom: 2,
              ),
              child: Text(
                widget.name.length >= 19
                    ? widget.name.substring(0, 19)
                    : widget.name,
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Text(
                widget.addressDescription.substring(0, 19) + "...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.036,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
