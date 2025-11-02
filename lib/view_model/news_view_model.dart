import 'package:flutter/material.dart';
import 'package:news/api_manger/api_manger.dart';
import 'package:news/api_manger/models/article_model.dart';

class NewsViewModel extends ChangeNotifier {
  List<ArticleModel> articles = [];
  List<Source> sources = [];

  bool isLoadingArticles = false;
  bool isLoadingSources = false;

  Future<void> getNews(String source) async {
    isLoadingArticles = true;
    notifyListeners();

    articles = await ApiManger.getNews(source);

    isLoadingArticles = false;
    notifyListeners();
  }

  Future<void> getSource(String category) async {
    isLoadingSources = true;
    notifyListeners();

    sources = await ApiManger.getSource(category);

    isLoadingSources = false;
    notifyListeners();
  }
}
