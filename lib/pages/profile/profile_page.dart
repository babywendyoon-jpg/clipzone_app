import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(title: const Text('Profile'), backgroundColor: Colors.red),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),

            const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),

            const SizedBox(height: 15),

            const Text(
              '@creator_clipzone',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Content Creator',
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 180,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(
                  children: [
                    Text(
                      '12',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Videos', style: TextStyle(color: Colors.white70)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '1.2K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Followers', style: TextStyle(color: Colors.white70)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '530',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Following', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Videos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(
                9,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.play_circle_fill,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
