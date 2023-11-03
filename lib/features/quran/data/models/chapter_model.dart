import 'dart:convert';

import 'package:floor/floor.dart';
import '../../domain/entities/chapter_entity.dart';

class ChapterListModel {
  List<ChapterModel> chapters;

  ChapterListModel({required this.chapters});

  factory ChapterListModel.fromJson(Map<String, dynamic> json) {
    final List<ChapterModel> chapterModels = (json['chapters'] as List)
        .map((chapterJson) => ChapterModel.fromJson(chapterJson))
        .toList();
    return ChapterListModel(chapters: chapterModels);
  }
}

@Entity(tableName: 'chapter', primaryKeys: ['id'])
class ChapterModel extends ChapterEntity {
  @TypeConverters([IntListConverter, TranslatedNameEntityConverter])
  const ChapterModel({
    int? id,
    String? revelationPlace,
    int? revelationOrder,
    bool? bismillahPre,
    String? nameComplex,
    String? nameArabic,
    int? versesCount,
    // @TypeConverters([IntListConverter]) List<int>? pages,
    @TypeConverters([TranslatedNameEntityConverter])
    TranslatedNameEntity? translatedName,
  }) : super(
          id: id,
          revelationPlace: revelationPlace,
          revelationOrder: revelationOrder,
          bismillahPre: bismillahPre,
          nameComplex: nameComplex,
          nameArabic: nameArabic,
          versesCount: versesCount,
          // pages: pages,
          translatedName: translatedName,
        );

// ... rest of the class ...

// Rest of the class remains the same

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      revelationPlace: json['revelation_place'],
      revelationOrder: json['revelation_order'],
      bismillahPre: json['bismillah_pre'],
      nameComplex: json['name_complex'],
      nameArabic: json['name_arabic'],
      versesCount: json['verses_count'],
      //  pages: json['pages'] != null ? List<int>.from(json['pages']) : null,
      translatedName: TranslatedNameEntity.fromJson(json['translated_name']),
    );
  }

  factory ChapterModel.fromEntity(ChapterEntity entity) {
    return ChapterModel(
      id: entity.id,
      revelationPlace: entity.revelationPlace,
      revelationOrder: entity.revelationOrder,
      bismillahPre: entity.bismillahPre,
      nameComplex: entity.nameComplex,
      nameArabic: entity.nameArabic,
      versesCount: entity.versesCount,
      // pages: pages,
      translatedName: entity.translatedName,
    );
  }
}

class IntListConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    if (databaseValue.isEmpty) {
      return [];
    }
    return databaseValue.split(',').map((str) => int.parse(str)).toList();
  }

  @override
  String encode(List<int> value) {
    return value.join(',');
  }
}

class TranslatedNameEntityConverter
    extends TypeConverter<TranslatedNameEntity?, String> {
  @override
  TranslatedNameEntity? decode(String databaseValue) {
    if (databaseValue != null) {
      final Map<String, dynamic> map = json.decode(databaseValue);
      return TranslatedNameEntity.fromJson(map);
    }
    return null;
  }

  @override
  String encode(TranslatedNameEntity? value) {
    if (value != null) {
      final Map<String, dynamic> map = value.toJson();
      return json.encode(map);
    }
    return "";
  }
}
