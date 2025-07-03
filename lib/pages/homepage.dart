import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:news_app/pages/settings.dart';
import 'package:news_app/services/api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ApiService client = ApiService();

  final List _pages = [
    news_page(),
    settings(),

  ];
  int _selectedIndex = 0;

  void _navigation(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navigation,

        //selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,


        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded), label: "Business"),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],

      ),
    );
  }
}
