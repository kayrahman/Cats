// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootChapterModel _$RootChapterModelFromJson(Map<String, dynamic> json) =>
    RootChapterModel(
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RootChapterModelToJson(RootChapterModel instance) =>
    <String, dynamic>{
      'chapters': instance.chapters,
    };

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) => ChapterModel(
      id: json['id'] as int,
      revelation_place: json['revelation_place'] as String,
      revelation_order: json['revelation_order'] as int,
      bismillah_pre: json['bismillah_pre'] as bool,
      name_complex: json['name_complex'] as String,
      name_arabic: json['name_arabic'] as String,
      verses_count: json['verses_count'] as int,
      pages: (json['pages'] as List<dynamic>).map((e) => e as int).toList(),
      translated_name: TranslatedName.fromJson(
          json['translated_name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'revelation_place': instance.revelation_place,
      'revelation_order': instance.revelation_order,
      'bismillah_pre': instance.bismillah_pre,
      'name_complex': instance.name_complex,
      'name_arabic': instance.name_arabic,
      'verses_count': instance.verses_count,
      'pages': instance.pages,
      'translated_name': instance.translated_name,
    };

TranslatedName _$TranslatedNameFromJson(Map<String, dynamic> json) =>
    TranslatedName(
      language_name: json['language_name'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TranslatedNameToJson(TranslatedName instance) =>
    <String, dynamic>{
      'language_name': instance.language_name,
      'name': instance.name,
    };
