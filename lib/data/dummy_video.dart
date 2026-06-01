class VideoModel {
  String title;
  String thumbnail;
  int views;
  int likes;
  int comments;

  VideoModel({
    required this.title,
    required this.thumbnail,
    required this.views,
    required this.likes,
    required this.comments,
  });
}

List<VideoModel> videos = [
  VideoModel(
    title: "Flutter UI Tutorial",
    thumbnail: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3",
    views: 1200,
    likes: 250,
    comments: 30,
  ),

  VideoModel(
    title: "Mobile App Design",
    thumbnail: "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
    views: 3000,
    likes: 560,
    comments: 70,
  ),

  VideoModel(
    title: "Laravel API Tutorial",
    thumbnail: "https://images.unsplash.com/photo-1555066931-4365d14bab8c",
    views: 5000,
    likes: 920,
    comments: 120,
  ),
];
