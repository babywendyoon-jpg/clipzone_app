import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.favorite, color: Colors.white),
            ),
            title: Text(
              'Someone liked your video',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '2 minutes ago',
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
