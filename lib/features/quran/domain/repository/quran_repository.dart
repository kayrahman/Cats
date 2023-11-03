
import 'package:learning_dart/core/resources/data_state.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/quran/domain/entities/chapter_entity.dart';

abstract class QuranRepository{
  Future<DataState<ChapterListModel>> getChapters();
  // local db
  //Future<ChapterListModel?> getLocalChapters();
  Future<void> saveChapters(ChapterEntity chapter);

}