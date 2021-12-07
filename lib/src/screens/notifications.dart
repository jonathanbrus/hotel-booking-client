import 'package:flutter/material.dart';

import '../components/notification.dart';

class Notifications extends StatefulWidget {
  static const routeName = "/notifications";

  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List _notifications = [1, 2, 3];

  void clearNotifications() {
    setState(() {
      _notifications = [];
    });
  }

  void dismissed(index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${_notifications.length} New Notification(s)"),
                        TextButton(
                          onPressed: clearNotifications,
                          child: const Text("clear"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: query.size.height - (query.size.height * 0.18),
                    child: ListView(
                      children: _notifications
                          .map(
                            (e) => AppNotifiation(
                              timeStamp: DateTime.now(),
                              title: "Notify my user",
                              message:
                                  "Hi jonathan brus, looking to book wedding mandapams? use your ATMahal credits to get discount on you first booking!",
                              read: e == 2,
                              dismissed: () => dismissed(
                                _notifications.indexOf(e),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Notifications"),
    );
  }
}
