import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';

import './booking.dart';

import '../services/map.dart';

import '../widgets/surrounding_similar_halls.dart';
import '../widgets/select_date.dart';
import '../widgets/availability_result_modal.dart';
import '../components/rating.dart';

class HallDetail extends StatefulWidget {
  static const routeName = "/hall-detail";

  const HallDetail({Key? key}) : super(key: key);

  @override
  _HallDetailState createState() => _HallDetailState();
}

class _HallDetailState extends State<HallDetail> {
  void checkAvailability() async {
    final date = await selectDate(context);

    if (date == null) {
      return;
    }

    showAvailabilityResult(
      context,
      DateFormat.yMMMMd().format(date),
      (date.month + date.day) != (DateTime.now().month + DateTime.now().day),
    );
  }

  void book() {
    Navigator.of(context).pushNamed(Booking.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text("SKV Mahal"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_rounded),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://trekbaron.com/wp-content/uploads/2020/07/types-of-resorts-July282020-1-min.jpg",
                      width: double.infinity,
                      height: size.height * 0.5,
                      fit: BoxFit.fill,
                    ),
                    Name(name: "SKV Mahal", size: size),
                    Address(
                      address:
                          "Near Kanyakumari Arch, Vivekanandapuram, Kanyakumari",
                      size: size,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Rating(rating: 4.2, size: size),
                          IconButton(
                            onPressed: () => showPlace(
                              coords: Coords(
                                8.078159026639478,
                                77.55556927503144,
                              ),
                              title: "Vivekananda Rock",
                            ),
                            icon: const Icon(Icons.map_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SectionTitle(title: "Description", size: size),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "The place is located near Leepuram Beach, Kanyakumari,Tamil Nadu,AmenitiesRoom Ventilation, Complimentary Breakfast, Security,Kitchen, 24/7 Checkin, Room Service, Free Wifi, HairDryer, Dining Area, Laundry service, Parking Facility,Garden/Backyard, Reception, Bath Tub, Card Payment,Fire-Extinguisher, Daily Housekeeping, Private Entrance,Attached Bathroom, First Aid, Power backup, Fan, Mirror,CCTV Cameras are some of the amenities available at thisproperty.",
                    style: TextStyle(
                      height: 1.4,
                      fontSize: size.width * 0.038,
                    ),
                  ),
                ),
                SectionTitle(title: "Details", size: size),
                const Details(),
                SectionTitle(
                  title: "Similar Halls In The Surrounding",
                  size: size,
                ),
                const SimilarVenues(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: checkAvailability,
              child: const Text("Check Availability"),
            ),
            ElevatedButton(
              onPressed: book,
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  final String name;
  final Size size;
  const Name({
    required this.name,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        top: 12,
        right: 12,
        bottom: 4,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: size.width * 0.044,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Address extends StatelessWidget {
  final String address;
  final Size size;
  const Address({
    required this.address,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        top: 0,
        right: 12,
        bottom: 0,
      ),
      child: Text(
        address,
        maxLines: 3,
        style: TextStyle(
          height: 1.4,
          color: Colors.black45,
          fontSize: size.width * 0.038,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    required this.title,
    required this.size,
    Key? key,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size.width * 0.042,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Table(
        border: TableBorder.all(
          color: Colors.grey.withOpacity(0.6),
          width: 1,
          borderRadius: BorderRadius.circular(6),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
        },
        children: [
          buildRow(context, "Hall AC Available", "Yes"),
          buildRow(context, "Hall Seating Capacity", 15000),
          buildRow(context, "Hall Floating Capacity", 2500),
          buildRow(context, "Dining AC Available", "Yes"),
          buildRow(context, "Dining Capacity", 1500),
          buildRow(context, "Food Service Available", "Yes"),
          buildRow(context, "Outside Food Vendor Allowed", "Yess"),
          buildRow(context, "Non-Veg Allowed", "Yes"),
          buildRow(context, "Buffet Crockery Avilable", "Yes"),
          buildRow(context, "Homam ALoowed", "Yes"),
          buildRow(context, "Outside Decoration Vendor Allowed", "Yes"),
          buildRow(context, "Parking Available", "Yes"),
          buildRow(context, "Car Parking Capacity", 200),
          buildRow(context, "Bike Parking Capacity", 500),
        ],
      ),
    );
  }
}

TableRow buildRow(BuildContext context, String title, dynamic value) {
  final width = MediaQuery.of(context).size.width;

  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: width * 0.038,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "$value",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
