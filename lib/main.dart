import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/splashscreen.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
