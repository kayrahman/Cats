
import 'package:equatable/equatable.dart';
import 'package:learning_dart/features/quran/domain/entities/chapter_entity.dart';

abstract class LocalChaptersEvent extends Equatable {
  final ChapterEntity ? chapter;

  const LocalChaptersEvent({this.chapter});

  @override
  List<Object> get props => [chapter!];
}

class GetSavedChapters extends LocalChaptersEvent {
  const GetSavedChapters();
}

class SaveChapter extends LocalChaptersEvent {
  const SaveChapter(ChapterEntity chapter) : super(chapter: chapter);
}
