import 'package:flutter/material.dart';
import 'package:news_app/models/general_model.dart';
import 'package:news_app/services/api_all.dart';

class Headlines extends StatefulWidget {
  const Headlines({super.key});

  @override
  State<Headlines> createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  final ApiAll client = ApiAll();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<General>>(
      future: client.getGeneral(),
      builder: (BuildContext context, AsyncSnapshot<List<General>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error:  ${snapshot.error}"),);
        }
        else if (snapshot.hasData&& snapshot.data!.isNotEmpty){
          List<General> generals = snapshot.data!;
        }
      },
    );
  }
}
