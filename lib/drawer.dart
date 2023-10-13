

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(
        "localization.demoNavigationDrawerUserName",
      ),
      accountEmail: Text(
        "localization.demoNavigationDrawerUserEmail",
      ),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
    var drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            "Item 1",
          ),
          leading: const Icon(Icons.favorite),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            "Item 2",
          ),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    return Drawer(
       child: drawerItems,
    );
  }
}
