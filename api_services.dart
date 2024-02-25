import 'dart:convert';

import 'package:http/http.dart';
import '../model/article_model.dart';

class ApiService {
  String apikey = '5824601a9b976cc61b097e544a99879d';
  final endPointUrl =
      "https://gnews.io/api/v4/search?q=example&lang=en&country=us&max=10&apikey=5824601a9b976cc61b097e544a99879d";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl as Uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
