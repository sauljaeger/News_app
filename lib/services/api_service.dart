import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class ApiService {
  final String endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY";

  Future<List<Article>> getArticle() async {
    try {
      final response = await http.get(Uri.parse(endPointUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles']; // Fixed: 'article' to 'articles'

        List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching articles: $e');
      rethrow; // Let FutureBuilder handle the error
    }
  }
}
