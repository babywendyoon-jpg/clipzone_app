import 'package:flutter/material.dart';
import '../../data/dummy_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<int> likedVideos = {};
  final Set<int> followedCreators = {};

  final TextEditingController searchController = TextEditingController();

  String searchText = '';

  void showComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Comments",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              const ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("user123"),
                subtitle: Text("Amazing video 🔥"),
              ),

              const ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("creator_fan"),
                subtitle: Text("Love this content ❤️"),
              ),

              const Spacer(),

              TextField(
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredVideos = videos.where((video) {
      return video.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("ClipZone"),
        centerTitle: true,
        backgroundColor: Colors.red,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search videos...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Icon(Icons.trending_up, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Trending Today: Flutter UI Tutorial",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: filteredVideos.isEmpty
                ? const Center(
                    child: Text(
                      "No videos found",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredVideos.length,
                    itemBuilder: (context, index) {
                      final video = filteredVideos[index];

                      final isLiked = likedVideos.contains(index);
                      final isFollowed = followedCreators.contains(index);

                      return Container(
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    video.thumbnail,
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 18,
                                            child: Icon(Icons.person),
                                          ),

                                          const SizedBox(width: 10),

                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              "@creator_clipzone",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isFollowed) {
                                              followedCreators.remove(index);
                                            } else {
                                              followedCreators.add(index);
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isFollowed
                                              ? Colors.grey
                                              : Colors.red,
                                        ),
                                        child: Text(
                                          isFollowed ? "Following" : "Follow",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  const Text(
                                    "Enjoy this amazing short video content created for ClipZone users.",
                                    style: TextStyle(color: Colors.white70),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    "${video.views} views",
                                    style: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),

                                  const Divider(
                                    color: Colors.white24,
                                    height: 25,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (isLiked) {
                                                  likedVideos.remove(index);
                                                } else {
                                                  likedVideos.add(index);
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              isLiked
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Text(
                                            isLiked ? "1.3K" : "1.2K",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showComments(context);
                                            },
                                            icon: const Icon(
                                              Icons.comment_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            "320",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    "Video shared successfully",
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.share,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Text(
                                            "Share",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
