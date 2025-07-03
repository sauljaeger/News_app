import 'package:news_app/models/source_model.dart';

class General {
  Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  General({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory General.fromJson(Map<String, dynamic> json) {
    return General(
      source: Source.fromJson(json['source'] ?? {}),//fallback for null
      author: json['author'] as String?,
      title: json['title'] as String? ?? 'No Title',//fall back for null
      description: json['description'] as String?,
      url: json['url'] as String? ?? '',// fallback for null
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String? ?? '',//fallback for null
      content: json['content'] as String?,
    );
  }
}
