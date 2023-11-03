import 'dart:io';

import 'package:learning_dart/core/resources/data_state.dart';
import 'package:learning_dart/features/quran/data/data_sources/local/app_database.dart';
import 'package:learning_dart/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/quran/domain/entities/chapter_entity.dart';
import 'package:learning_dart/features/quran/domain/repository/quran_repository.dart';
import 'package:dio/dio.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranApiService _apiService;
  final AppDatabase _appDatabase;
  QuranRepositoryImpl(this._apiService, this._appDatabase);

  @override
  Future<DataState<ChapterListModel>> getChapters() async {
    try {
      final httpResponse = await _apiService.getChapters();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("remote > success > getChapters() > ${httpResponse.data}");
        return DataSuccess(httpResponse.data);
      } else {
        print("remote > exception > getChapters() > ${httpResponse.response.statusMessage}");
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      print("remote > error > getChapters() > ${e.response}");
      return DataFailed(e);
    }
  }
/*

  @override
  Future<ChapterListModel?> getLocalChapters() async{
      return _appDatabase.chapterDAO.getChapters();
  }
*/

  @override
  Future<void> saveChapters(ChapterEntity chapter) {
   return _appDatabase.chapterDAO.insertChapter(ChapterModel.fromEntity(chapter));
  }
}










