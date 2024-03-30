import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/providers/news.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/customListTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(), // Provide NewsProvider here
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            // return Center(child: CircularProgressIndicator());
            return Center(child: Text(newsProvider.resNews.toString()));
          } else if (newsProvider.resNews != null) {
            List<Articles>? articles = newsProvider.resNews!.articles!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          } else {
            return Center(child: Text("Failed to load news"));
          }
        },
      ),
    );
  }
}
