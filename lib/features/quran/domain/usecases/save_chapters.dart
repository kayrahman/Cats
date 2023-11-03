import 'package:learning_dart/core/usecases/usecase.dart';
import 'package:learning_dart/features/quran/domain/entities/chapter_entity.dart';
import 'package:learning_dart/features/quran/domain/repository/quran_repository.dart';

class SaveChaptersUseCase implements UseCase<void, ChapterEntity> {
  final QuranRepository _quranRepository;

  SaveChaptersUseCase(this._quranRepository);

  @override
  Future<void> call({ChapterEntity ? params}) {
    return _quranRepository.saveChapters(params!);
  }
}
