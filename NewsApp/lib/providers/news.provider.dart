import 'package:NewsApp/helpers/api.dart';
import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;

  Future<void> getTopNews() async {
    try {
      final res = await api(
          '${baseUrl}top-headlines?country=us&pageSize=100&apiKey=$API_KEY');

      if (res.statusCode == 200) {
        resNews = TopNewsModel.fromJson(res.data);
      } else {
        throw Exception('Failed to load news: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
