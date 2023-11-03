import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_dart/features/quran/domain/usecases/save_chapters.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/lcoal_chapter_state.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/local_chapter_event.dart';


class LocalChapterBloc extends Bloc<LocalChaptersEvent,LocalChapterState> {
 // final GetSavedChaptersUseCase _getSavedChaptersUseCase;
  final SaveChaptersUseCase _saveChaptersUseCase;


  LocalChapterBloc(
    //  this._getSavedChaptersUseCase,
      this._saveChaptersUseCase,
      ) : super(const LocalChaptersLoading()){
    on <GetSavedChapters> (onGetSavedChapters);
    on <SaveChapter> (onSaveChapters);
  }


  void onGetSavedChapters(GetSavedChapters event,Emitter<LocalChapterState> emit) async {
 //   final chapters = await _getSavedChaptersUseCase();
    //emit(LocalChaptersDone(chapters));
  }

  void onSaveChapters(SaveChapter saveChapter,Emitter<LocalChapterState> emit) async {
    await _saveChaptersUseCase(params: saveChapter.chapter); // passing event -> saving data
    //final chapters = await _getSavedChaptersUseCase();
    emit(LocalChaptersSavedDone());
  }
}
