import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileListTile({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      title: Text(title),
    );
  }
}
