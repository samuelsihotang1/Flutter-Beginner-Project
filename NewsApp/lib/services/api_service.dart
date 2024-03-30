import 'dart:convert';

import 'package:NewsApp/model/article_model.dart';
import 'package:http/http.dart' as http; // Importing http package with alias

class ApiService {
  final endPointUrl = Uri.parse(
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c19b0a831e2e4a1bbd04fa118ad61326");

  Future<List<Article>> getArticle() async {
    http.Response res = await http
        .get(endPointUrl); // Using http alias for accessing get method

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception("Can't get the Articles"); // Throwing an Exception object
    }
  }
}
