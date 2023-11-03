import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'DAO/chapter_dao.dart';
part 'app_database.g.dart';


//@TypeConverters([IntListConverter])
@Database(version: 1, entities: [ChapterModel])
abstract class AppDatabase extends FloorDatabase{
    ChapterDao get chapterDAO;
}