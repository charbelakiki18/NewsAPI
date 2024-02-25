import 'package:flutter/material.dart';
import './services/api_services.dart';
import './model/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
          ),
          body: FutureBuilder(
              future: client.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text("Succes!"));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
