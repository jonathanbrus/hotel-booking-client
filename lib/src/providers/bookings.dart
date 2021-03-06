import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingsProvider with ChangeNotifier {
  final List<Booking> _myBookings = [];

  List<Booking> get bookings => [..._myBookings];
}
