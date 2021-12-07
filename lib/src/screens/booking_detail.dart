import 'package:flutter/material.dart';

class BookingDetail extends StatefulWidget {
  static const routeName = "/booking-detail";

  const BookingDetail({Key? key}) : super(key: key);

  @override
  _BookingDetailState createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("SKV Mahal booking"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }
}
