import 'package:flutter/material.dart';

import '../app.dart';

import '../screens/search.dart';
import '../screens/search_result.dart';
import '../screens/notifications.dart';
import '../screens/profile_edit.dart';
import '../screens/hall_detail.dart';
import '../screens/application.dart';
import '../screens/booking_detail.dart';
import '../screens/faqs.dart';
import '../screens/invite.dart';
import '../screens/otp.dart';
import '../screens/privacy.dart';
import '../screens/terms.dart';
import '../screens/payments.dart';
import '../screens/booking.dart';
import '../screens/create_account.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args =  settings.arguments;

    switch (settings.name) {
      case App.routeName:
        return MaterialPageRoute(builder: (BuildContext ctx) => const App());

      case Search.routeName:
        return MaterialPageRoute(builder: (BuildContext ctx) => const Search());

      case SearchResults.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const SearchResults(),
        );

      case Notifications.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const Notifications(),
        );

      case ProfileEdit.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const ProfileEdit(),
        );

      case HallDetail.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const HallDetail(),
        );

      case ApplicationForm.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const ApplicationForm(),
        );

      case BookingDetail.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const BookingDetail(),
        );

      case FAQs.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const FAQs(),
        );

      case InviteRefer.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const InviteRefer(),
        );

      case VerifyOtp.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const VerifyOtp(),
        );

      case Privacy.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const Privacy(),
        );

      case Terms.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const Terms(),
        );

      case Payments.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const Payments(),
        );

      case Booking.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const Booking(),
        );

      case CreateAccount.routeName:
        return MaterialPageRoute(
          builder: (BuildContext ctx) => const CreateAccount(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Something went wrong"),
        ),
      );
    });
  }
}
