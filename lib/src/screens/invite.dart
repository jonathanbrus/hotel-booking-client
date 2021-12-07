import 'package:flutter/material.dart';

class InviteRefer extends StatefulWidget {
  static const routeName = "/invite-refer";

  const InviteRefer({Key? key}) : super(key: key);

  @override
  InviteReferState createState() => InviteReferState();
}

class InviteReferState extends State<InviteRefer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Invite"),
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
