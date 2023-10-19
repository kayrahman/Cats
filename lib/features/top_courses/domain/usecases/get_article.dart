import 'package:learning_dart/core/resources/data_state.dart';
import 'package:learning_dart/core/usecases/usecase.dart';
import 'package:learning_dart/features/top_courses/domain/entities/article.dart';
import 'package:learning_dart/features/top_courses/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
  
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
  
}