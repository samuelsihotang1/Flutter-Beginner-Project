import 'package:NewsApp/components/everythingList.dart';
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
      create: (context) => NewsProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 10.0),
            Text(
              "Mandiri News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          } else if (newsProvider.resNews != null) {
            List<Articles>? articles = newsProvider.resNews!.articles!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Berita Terkini',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            customListTile(articles[index], context),
                          ],
                        );
                      } else {
                        if (index == 1) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'Semua Berita',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              everythingListTile(articles[index], context),
                            ],
                          );
                        } else {
                          return everythingListTile(articles[index], context);
                        }
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("Failed to load news"));
          }
        },
      ),
    );
  }
}
