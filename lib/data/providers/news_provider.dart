import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/news_response.dart';
import 'package:news_app/utils/constants.dart';

class NewsProvider extends ChangeNotifier {
  final Box box;

  NewsProvider({required this.box});

  List<Article> news = [];
  String error = '';

  // _addNewsData(jsonData) {
  //   news = [];
  //   if (jsonData['status'] == statusOk) {
  //     for (var e in (jsonData['articles'])) {
  //       if (e['urlToImage'] != null && e['description'] != null) {
  //         news.add(Article.fromJson(e as Map<String, dynamic>));
  //       }
  //     }
  //   }
  // }

  Future getNews() async {
    // if (box.isOpen && box.isNotEmpty) {
    //   final cachedData = box.get(keyNews);
    //   news = NewsResponse.fromJson(cachedData).articles;
    //   notifyListeners();
    // }
    final apiUrl = '$newsUrl$apiKey';
    try {
      final response = await Dio().get(apiUrl);
      box.put(keyNews, response.data);
      news = NewsResponse.fromJson(response.data).articles;
      error = '';
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}