import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/screens/news_details.dart';

class HorizontalNews extends StatelessWidget {
  final News news;
  const HorizontalNews(this.news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetails(news: news)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _buildSideImage(context)),
            Expanded(flex: 7, child: _buildTextualInfo()),
          ],
        ),
      ),
    );
  }

  Widget _buildTextualInfo() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateFormat().format(news.timestamp),
                style: TextStyle(fontSize: 11, color: Colors.grey[700]),
              ),
              Text(news.headline,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              Text(news.subheadline,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            ]));
  }

  Widget _buildSideImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(news.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
