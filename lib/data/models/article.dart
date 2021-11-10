class Article {
  String title = '';
  String author = '';
  String description = '';
  String urlToImage = '';
  DateTime publishedAt = DateTime(2021);
  String content = '';
  String articleUrl = '';

  Article(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publishedAt,
      required this.urlToImage,
      required this.articleUrl});

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        description = json['description'] ?? '',
        author = json['author'] ?? '',
        content = json["content"] ?? '',
        publishedAt = DateTime.parse(json['publishedAt']) ,
        urlToImage = json['urlToImage'] ?? '',
        articleUrl = json["url"] ?? '';
}
