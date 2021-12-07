import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/booking_detail.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 12, bottom: 8, right: 12),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, BookingDetail.routeName),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  "https://trekbaron.com/wp-content/uploads/2020/07/types-of-resorts-July282020-1-min.jpg",
                  height: 110,
                  width: 110,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Booked on ${DateFormat.yMMMMd().format(DateTime.now())}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14.8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "SKV Mahal",
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Chennai",
                      style: TextStyle(
                        height: 1.28,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Event on ${DateFormat.yMMMMd().format(DateTime.now())}",
                      style: const TextStyle(
                        height: 1.28,
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.398,
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 31,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_rounded,
                            size: 16,
                          ),
                          label: const Text("Need Help ?"),
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
