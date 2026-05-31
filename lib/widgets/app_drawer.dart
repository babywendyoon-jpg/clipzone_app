import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red),

            accountName: Text('Creator ClipZone'),
            accountEmail: Text('creator@clipzone.com'),

            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),

            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Upload Video'),

            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),

            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),

            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
