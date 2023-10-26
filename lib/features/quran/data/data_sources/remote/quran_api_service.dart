import 'package:dio/dio.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:retrofit/http.dart';
part 'quran_api_service.g.dart';

@RestApi(baseUrl: 'https://api.quran.com/api/v4/')
abstract class QuranApiService{
  factory QuranApiService(Dio dio) = _QuranApiService;

  @GET('chapters')
  Future<RootChapterModel> getChapters();
 }