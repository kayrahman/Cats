import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../data/models/chapter_model.dart';


class ChapterEntity extends Equatable {
  final int? id;
  final String? revelationPlace;
  final int? revelationOrder;
  final bool? bismillahPre;
  final String? nameComplex;
  final String? nameArabic;
  final int? versesCount;
 // @TypeConverters([IntListConverter]) final List<int>? pages;
  @TypeConverters([TranslatedNameEntityConverter]) final TranslatedNameEntity? translatedName;

  const ChapterEntity({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
   // this.pages,
    this.translatedName,
  });

  @override
  List<Object?> get props {
    return [
      id,
      revelationPlace,
      revelationOrder,
      bismillahPre,
      nameComplex,
      nameArabic,
      versesCount,
     // pages,
      translatedName,
    ];
  }
}

class TranslatedNameEntity extends Equatable {
  final String? languageName;
  final String? name;

  const TranslatedNameEntity({
    this.languageName,
    this.name,
  });

  factory TranslatedNameEntity.fromJson(Map<String, dynamic> json) {
    return TranslatedNameEntity(
      languageName: json['language_name'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_name'] = languageName;
    data['name'] = name;
    return data;
  }


  @override
  List<Object?> get props {
    return [languageName, name];
  }
}
