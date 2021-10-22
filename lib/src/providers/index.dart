import './auth.dart';
import './user.dart';
import './halls.dart';
import './bookings.dart';

class AppProviders {
  AuthProvider get auth => AuthProvider();
  UserProvider get user => UserProvider();
  HallsProvider get halls => HallsProvider();
  BookingsProvider get bookings => BookingsProvider();
}
