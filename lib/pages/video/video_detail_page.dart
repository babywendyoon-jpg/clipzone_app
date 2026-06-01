import 'package:flutter/material.dart';
import '../../data/dummy_video.dart';

class VideoDetailPage extends StatefulWidget {
  final VideoModel video;

  const VideoDetailPage({super.key, required this.video});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.video.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.video.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[900],

              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${widget.video.views} views",
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (isLiked) {
                              likes--;
                              isLiked = false;
                            } else {
                              likes++;
                              isLiked = true;
                            }
                          });
                        },
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),

                      Text(
                        "$likes",
                        style: const TextStyle(color: Colors.white),
                      ),

                      const SizedBox(width: 20),

                      const Icon(Icons.comment, color: Colors.white),

                      const SizedBox(width: 5),

                      Text(
                        "${widget.video.comments}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Comments",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text(
                      "User123",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "Great video!",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text(
                      "FlutterDev",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "Very helpful tutorial",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
