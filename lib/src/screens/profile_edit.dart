import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  static const routeName = "/profile-edit";

  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();

  void _handleSave() async {}

  Future<bool> _handlePop() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handlePop,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("Edit Profile"),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: const [
                        Field(
                          icon: Icons.male_rounded,
                          value: "Jonathan Brus",
                          type: TextInputType.name,
                        ),
                        Field(
                          icon: Icons.phone_rounded,
                          value: "+91 8643823489",
                          type: TextInputType.phone,
                        ),
                        Field(
                          icon: Icons.mail_rounded,
                          value: "jonathanbrus@gmail.com",
                          type: TextInputType.emailAddress,
                        ),
                        Field(
                          icon: Icons.location_city_rounded,
                          value: "Kanyakumari",
                          type: TextInputType.streetAddress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _handleSave,
          icon: const Icon(Icons.check_circle_outline_rounded),
          label: const Text("Save"),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  final IconData icon;
  final String value;
  final TextInputType type;

  const Field({
    required this.icon,
    required this.value,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        title: TextFormField(
          keyboardType: type,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          ),
          initialValue: value,
        ),
      ),
    );
  }
}
