import 'package:flutter/material.dart';

import '../screens/hall_detail.dart';

import './rating.dart';

class HallVariant extends StatefulWidget {
  final String name;
  final String addressDescription;
  final List imageUrls;
  final double rating;
  final bool saved;

  const HallVariant({
    required this.name,
    required this.addressDescription,
    required this.imageUrls,
    required this.rating,
    required this.saved,
    Key? key,
  }) : super(key: key);

  @override
  _HallVariantState createState() => _HallVariantState();
}

class _HallVariantState extends State<HallVariant> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, HallDetail.routeName),
      child: Container(
        height: 220,
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PreviewImages(
              imageUrls: widget.imageUrls,
              rating: widget.rating,
              saved: widget.saved,
              size: size,
            ),
            Text(
              widget.name,
              style: TextStyle(
                height: 1.6,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.addressDescription,
              maxLines: 3,
              style: TextStyle(
                height: 1.4,
                color: Colors.grey,
                fontSize: size.width * 0.036,
              ),
            ),
            Text(
              "Price Negotiable",
              style: TextStyle(
                height: 1.6,
                fontSize: size.width * 0.036,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreviewImages extends StatelessWidget {
  final List imageUrls;
  final double rating;
  final bool saved;
  final Size size;

  const PreviewImages({
    required this.imageUrls,
    required this.rating,
    required this.saved,
    required this.size,
    Key? key,
  }) : super(key: key);

  double getPadding(e) =>
      imageUrls.indexOf(e) == (imageUrls.length - 1) ? 0 : 8;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 12),
            scrollDirection: Axis.horizontal,
            children: [
              ...imageUrls.map(
                (e) => Padding(
                  padding: EdgeInsets.only(right: getPadding(e)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      e,
                      width: 220,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                saved ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: Theme.of(context).colorScheme.primary,
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
    );
  }
}
