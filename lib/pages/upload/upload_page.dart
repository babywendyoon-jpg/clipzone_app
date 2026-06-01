import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String selectedCategory = "Entertainment";

  final List<String> categories = [
    "Entertainment",
    "Gaming",
    "Education",
    "Technology",
    "Music",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Upload Video"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create New Video",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Share your creativity with the ClipZone community.",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 25),

            // VIDEO PREVIEW
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white24),
              ),

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.video_collection,
                    size: 90,
                    color: Colors.grey.shade700,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "No Video Selected",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.folder_open),

                label: const Text("Choose Video"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                labelText: "Video Title",
                labelStyle: const TextStyle(color: Colors.white70),

                prefixIcon: const Icon(Icons.title, color: Colors.white70),

                filled: true,
                fillColor: Colors.grey.shade900,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              maxLines: 4,
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: const TextStyle(color: Colors.white70),

                filled: true,
                fillColor: Colors.grey.shade900,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Category",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey.shade900,
                  value: selectedCategory,
                  isExpanded: true,

                  style: const TextStyle(color: Colors.white),

                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upload Progress",
                    style: TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: Colors.grey,
                    color: Colors.red,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  const SizedBox(height: 8),

                  const Text("0%", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.cloud_upload),

                label: const Text(
                  "Publish Video",
                  style: TextStyle(fontSize: 17),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
