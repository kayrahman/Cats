import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:learning_dart/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:learning_dart/features/quran/data/repository/quran_repository_impl.dart';
import 'package:learning_dart/features/quran/domain/repository/quran_repository.dart';
import 'package:learning_dart/features/quran/domain/usecases/get_chapters.dart';
import 'package:learning_dart/features/quran/domain/usecases/save_chapters.dart';
import 'package:learning_dart/features/quran/presentation/bloc/local/local_chapter_bloc.dart';
import 'package:learning_dart/features/quran/presentation/bloc/remote/remote_quran_bloc.dart';
import 'features/quran/data/data_sources/local/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  print("injection_container > initializeDependency");
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies - Quran
  sl.registerSingleton<QuranApiService>(QuranApiService(sl()));
  sl.registerSingleton<QuranRepository>(QuranRepositoryImpl(sl(),sl()));

  //usecases
   sl.registerSingleton<GetChaptersUseCase>(GetChaptersUseCase(sl()));
  // sl.registerSingleton<GetSavedChaptersUseCase>(GetSavedChaptersUseCase(sl()));
   sl.registerSingleton<SaveChaptersUseCase>(SaveChaptersUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteQuranBloc>(() => RemoteQuranBloc(sl()));
  sl.registerFactory<LocalChapterBloc>(() => LocalChapterBloc(sl()));
}