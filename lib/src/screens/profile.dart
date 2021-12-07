import 'package:flutter/material.dart';

import './profile_edit.dart';

import '../components/credit_point_card.dart';
import '../components/profile_list_tile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const CreditPointCard(
                points: 1000,
              ),
              const ProfileListTile(
                title: "Jonathan Brus",
                icon: Icons.male_rounded,
              ),
              const ProfileListTile(
                title: "+91 6583592198",
                icon: Icons.phone_rounded,
              ),
              const ProfileListTile(
                title: "joanthanbrus@gamil.com",
                icon: Icons.mail_rounded,
              ),
              const ProfileListTile(
                title: "City",
                icon: Icons.location_city_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: const Text("Profile"),
      actions: [
        IconButton(
          splashRadius: 22,
          onPressed: () => Navigator.pushNamed(context, ProfileEdit.routeName),
          icon: const Icon(Icons.edit_rounded),
        ),
      ],
    );
  }
}
