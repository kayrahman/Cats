
import 'package:learning_dart/core/usecases/usecase.dart';
import 'package:learning_dart/features/top_courses/domain/entities/article.dart';
import 'package:learning_dart/features/top_courses/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void>{
  
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);
  
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
  
}