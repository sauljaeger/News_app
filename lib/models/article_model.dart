import 'package:news_app/models/source_model.dart';

class Article {
  Source source;
  String? author; // Nullable
  String title;
  String? description; // Nullable
  String url;
  String? urlToImage; // Nullable
  String publishedAt;
  String? content; // Nullable

  // Constructor
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  // Factory function to map JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source'] ?? {}), // Fallback for null source
      author: json['author'] as String?,
      title: json['title'] as String? ?? 'No Title', // Fallback for null
      description: json['description'] as String?,
      url: json['url'] as String? ?? '', // Fallback for null
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String? ?? '', // Fallback for null
      content: json['content'] as String?,
    );
  }
}