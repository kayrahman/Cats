
import 'package:learning_dart/core/usecases/usecase.dart';
import 'package:learning_dart/features/top_courses/domain/entities/article.dart';
import 'package:learning_dart/features/top_courses/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void,ArticleEntity>{
  
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);
  
  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }
  
}