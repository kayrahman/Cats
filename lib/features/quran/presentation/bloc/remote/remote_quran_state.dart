
import 'package:equatable/equatable.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/quran/domain/entities/chapter_entity.dart';
import 'package:dio/dio.dart';

abstract class RemoteQuranState extends Equatable {
  //final List<ChapterEntity> ? chapters;
  final ChapterListModel ? chapters;
  final DioError ? error;

  const RemoteQuranState({this.chapters,this.error});

  @override
  List<Object> get props => [chapters!, error!];
}

class RemoteQuranChapterListLoading extends RemoteQuranState {
  const RemoteQuranChapterListLoading();
}

class RemoteQuranChapterListDone extends RemoteQuranState {
  const RemoteQuranChapterListDone(ChapterListModel chapters) : super(chapters: chapters);
}

class RemoteQuranChapterListError extends RemoteQuranState {
  const RemoteQuranChapterListError(DioError error) : super(error: error);
}