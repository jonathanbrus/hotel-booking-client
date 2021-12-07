import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  static const routeName = "/payments";

  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Payments"),
          )
        ],
      ),
    );
  }
}
