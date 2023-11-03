import 'package:floor/floor.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';

@dao
abstract class ChapterDao {
  @Insert()
  Future<void> insertChapter(ChapterModel chapter);

  /*
  @Query('SELECT * FROM chapter')
  Future<ChapterListModel?> getChapters();
*/

}
