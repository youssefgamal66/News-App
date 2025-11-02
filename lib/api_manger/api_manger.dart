import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_manger/models/article_model.dart';

class ApiManger {
  static Future<List<ArticleModel>> getNews(String source) async {
    List<ArticleModel> articles = [];
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=8a6b8469285047008de4a8f2848f2c42");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    for (var e in json["articles"]) {
      articles.add(ArticleModel.fromJson(e));
    }
    return articles;
  }
  static Future<List<Source>> getSource(String id) async {
    List<Source> source = [];
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=8a6b8469285047008de4a8f2848f2c42&category=$id");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    for (var e in json["sources"]) {
      source.add(Source.fromJson(e));
    }
    return source;
  }
}
