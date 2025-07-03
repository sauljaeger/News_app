import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_service.dart';

class business_page extends StatefulWidget {
  const business_page({super.key});

  @override
  State<business_page> createState() => _business_pageState();
}

class _business_pageState extends State<business_page> {
  final ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => CustomListTile(
                article: articles[index], // Pass the Article instance
              ),
            );
          } else {
            return const Center(child: Text('No articles found'));
          }
        },
      ),

    );
  }
}
