import 'package:flutter/material.dart';

class ApplicationForm extends StatefulWidget {
  static const routeName = "/application";

  const ApplicationForm({Key? key}) : super(key: key);

  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Apply for listing your property"),
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
