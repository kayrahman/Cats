import 'package:flutter/material.dart';
import 'package:learning_dart/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/top_courses/presentation/widgets/AppLargeText.dart';
import 'package:learning_dart/features/top_courses/presentation/widgets/AppText.dart';
import 'package:dio/dio.dart';

class ChapterListPage extends StatelessWidget {
  const ChapterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran"),
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiService =
        QuranApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiService.getChapters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // The future is still in progress.
            return const Center(
              child: CircularProgressIndicator(), // Center the CircularProgressIndicator
            );// Or any other loading indicator.
          } else if (snapshot.hasError) {
            // An error occurred.
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data == null) {
            // The future completed, but the data is null.
            return Text('Data is null.');
          } else {
            // Data is available and not null.
            // You can access the data using snapshot.data.
            return _chapters(snapshot.data);
          }
        });
  }

  Widget _chapters(RootChapterModel chapters) {
    return ListView.builder(
      itemCount: chapters.chapters.length,
      itemBuilder: (_, index) {
        final chapter = chapters.chapters[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      //"Surah ${chapter.id}",
                      "${chapter.id}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 24),
                    Text(
                      //"Surah ${chapter.id}",
                      "${chapter.name_arabic}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "[${chapter.name_complex}]",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  "[${chapter.verses_count} verses]",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
