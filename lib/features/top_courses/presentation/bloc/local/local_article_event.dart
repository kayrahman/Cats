import 'package:equatable/equatable.dart';
import 'package:learning_dart/features/top_courses/domain/entities/article.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity ? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}
