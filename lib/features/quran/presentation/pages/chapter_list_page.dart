import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/lcoal_chapter_state.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/local_chapter_bloc.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/local_chapter_event.dart';
import 'package:learning_dart/features/quran/presentation/bloc/remote/remote_quran_bloc.dart';
import 'package:learning_dart/features/quran/presentation/bloc/remote/remote_quran_state.dart';
import 'package:learning_dart/injection_container.dart';

class ChapterListPage extends StatelessWidget {
  const ChapterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalChapterBloc>(
      // Wrap with BlocProvider
      create: (_) => sl<LocalChapterBloc>(),
      // Initialize your LocalChapterBloc here
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Al Quran"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    print("ChapterListPage > body");

    BlocListener<LocalChapterBloc, LocalChapterState>(
      listener: (context, state) {
        if (state is LocalChaptersSavedDone) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Data saved successfully!"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );

    return BlocBuilder<RemoteQuranBloc, RemoteQuranState>(
      builder: (_, state) {
        if (state is RemoteQuranChapterListLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteQuranChapterListError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteQuranChapterListDone) {
          print("ChapterListPage > state chapter list done");
          if (state.chapters!.chapters.isNotEmpty) {
            return _chapters(context, state.chapters!);
          } else {
            print("ChapterListPage > state chapter list empty");
          }
        }
        return const SizedBox();
      },
    );
  }

  Widget _chapters(BuildContext context, ChapterListModel chapters) {
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      //"Surah ${chapter.id}",
                      "${chapter.nameArabic}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "[${chapter.nameComplex}]",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  "[${chapter.versesCount} verses]",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //isBookmarked = !isBookmarked;
                    BlocProvider.of<LocalChapterBloc>(context)
                        .add(SaveChapter(chapter));
                  },
                  child: const Icon(
                      // isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      // color: isBookmarked ? Colors.red : Colors.grey,
                      Icons.bookmark,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
