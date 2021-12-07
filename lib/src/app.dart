import "package:flutter/material.dart";
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:provider/provider.dart';

import './services/location.dart';

import './providers/halls.dart';

import './screens/location_splash.dart';
import './screens/home.dart';
import './screens/bookings.dart';
import './screens/offers.dart';
import './screens/saved.dart';
import './screens/profile.dart';

import './widgets/bottom_navigation.dart';
import './widgets/logout_modal.dart';
import './widgets/exit_snackbar.dart';

class App extends StatefulWidget {
  static const routeName = "/app";

  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _enableLocation = false;
  bool _initialized = false;

  Future init() async {
    final hallsProvider = Provider.of<HallsProvider>(context, listen: false);
    try {
      final data = await getLocation();

      if (data["hasPermission"]) {
        hallsProvider.setCoords(data["lat"], data["long"]);
        try {
          await hallsProvider.fetchHalls(data["city"], true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$e"),
            ),
          );
        }
      }
      setState(() {
        _enableLocation = data["hasPermission"];
        _initialized = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  //bottom navigation
  final PageController _pageController = PageController(initialPage: 0);
  int _index = 0;

  void onPageChanged(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!_initialized || !_enableLocation)
        ? LocationSplash(
            initialized: _initialized,
            enabled: _enableLocation,
          )
        : Scaffold(
            body: DoubleBackToCloseApp(
              snackBar: snackBar,
              child: SafeArea(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Home(),
                    Bookings(),
                    Offers(),
                    Saved(),
                    Profile(),
                  ],
                ),
              ),
            ),
            floatingActionButton: _index == 4
                ? FloatingActionButton.extended(
                    onPressed: () => showLogoutModal(context),
                    label: const Text("Logout"),
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 26,
                    ),
                    elevation: 2,
                  )
                : null,
            bottomNavigationBar: BottomNavigation(
              index: _index,
              pageController: _pageController,
            ),
          );
  }
}
