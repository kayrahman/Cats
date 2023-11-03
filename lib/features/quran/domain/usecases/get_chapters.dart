import 'package:learning_dart/core/resources/data_state.dart';
import 'package:learning_dart/core/usecases/usecase.dart';
import 'package:learning_dart/features/quran/data/models/chapter_model.dart';
import 'package:learning_dart/features/quran/domain/repository/quran_repository.dart';

class GetChaptersUseCase implements UseCase<DataState<ChapterListModel>, void> {
  final QuranRepository _quranRepository;

  GetChaptersUseCase(this._quranRepository);

  @override
  Future<DataState<ChapterListModel>> call({void params}) {
    return _quranRepository.getChapters();
  }
}
