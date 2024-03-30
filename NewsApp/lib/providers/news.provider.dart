import 'package:NewsApp/helpers/api.dart';
import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  getTopNews() async {
    final res = await api(
        '${baseUrl}top-headlines?country=us&pageSize=100&apiKey=$API_KEY');

    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }

    // MENCOBA BUAT KE FLUTTER BARU

    isLoading = false;
    notifyListeners();
  }
}
