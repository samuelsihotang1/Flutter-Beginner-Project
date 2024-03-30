import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/pages/articles_details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget customListTile(Articles article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(
            article: article,
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage ??
                    'https://via.placeholder.com/750x500.jpeg?text=Image+Error'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(6.0),
            child: Text(
              article.title ?? 'No Title', // Handling null here
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.source?.name ?? 'Unknown',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  article.publishedAt != null
                      ? DateFormat('dd MMMM yyyy')
                          .format(DateTime.parse(article.publishedAt!))
                      : 'Unknown',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
