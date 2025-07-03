import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/general_model.dart';

import '../models/article_model.dart';

class ApiAll {
  final String allPointUrl =
      "https://newsapi.org/v2/top-headlines?category=general&apiKey=035a7a8c633d4ec6aac50b91cd3c6e3b";

  Future<List<Article>> getGeneral() async {
    try {
      final response = await http.get(Uri.parse(allPointUrl));

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

