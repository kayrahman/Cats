import 'package:json_annotation/json_annotation.dart';
part 'chapter_model.g.dart';

@JsonSerializable()
class RootChapterModel {
  List<ChapterModel> chapters;

  RootChapterModel({required this.chapters});

  factory RootChapterModel.fromJson(Map<String, dynamic> json) =>
      _$RootChapterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RootChapterModelToJson(this);
}

@JsonSerializable()
class ChapterModel {
  int id;
  String revelation_place;
  int revelation_order;
  bool bismillah_pre;
  String name_complex;
  String name_arabic;
  int verses_count;
  List<int> pages;
  TranslatedName translated_name;

  ChapterModel({
    required this.id,
    required this.revelation_place,
    required this.revelation_order,
    required this.bismillah_pre,
    required this.name_complex,
    required this.name_arabic,
    required this.verses_count,
    required this.pages,
    required this.translated_name
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => _$ChapterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);

}

@JsonSerializable()
class TranslatedName {
  String language_name;
  String name;

  TranslatedName({required this.language_name, required this.name});

  factory TranslatedName.fromJson(Map<String, dynamic> json) =>
      _$TranslatedNameFromJson(json);
  Map<String, dynamic> toJson() => _$TranslatedNameToJson(this);
}
