import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/pages/articles_details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget everythingListTile(Articles article, BuildContext context) {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150.0,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage ??
                    'https://via.placeholder.com/750x500.jpeg?text=Image+Error'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? 'No Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle, color: Colors.blue),
                        SizedBox(width: 4.0),
                        Text(
                          article.author ?? 'Unknown',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue),
                        SizedBox(width: 4.0),
                        Text(
                          article.publishedAt != null
                              ? DateFormat('dd MMMM yyyy')
                                  .format(DateTime.parse(article.publishedAt!))
                              : 'Unknown',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
