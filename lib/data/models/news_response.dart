import 'article.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse(this.status, this.totalResults, this.articles);

  NewsResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        totalResults = json['totalResults'],
        articles =
            (json['articles']).map<Article>((e) => Article.fromJson(e)).toList();
}
