import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:learning_dart/features/top_courses/data/data_sources/local/app_database.dart';
import 'package:learning_dart/features/top_courses/data/repository/article_repository_impl.dart';
import 'package:learning_dart/features/top_courses/domain/usecases/get_article.dart';
import 'package:learning_dart/features/top_courses/domain/usecases/get_saved_article.dart';
import 'package:learning_dart/features/top_courses/domain/usecases/remove_article.dart';
import 'package:learning_dart/features/top_courses/domain/usecases/save_article.dart';
import 'package:learning_dart/features/top_courses/presentation/bloc/local/local_article_bloc.dart';
import 'package:learning_dart/features/top_courses/presentation/bloc/remote/remote_article_bloc.dart';
import 'features/top_courses/data/data_sources/remote/news_api_service.dart';
import 'features/top_courses/domain/repository/article_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
