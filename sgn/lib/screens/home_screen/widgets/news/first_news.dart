import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/screens/news_details.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:sgn/styles/text.dart';

class FirstNews extends StatelessWidget {
  final News news;

  const FirstNews(this.news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 340 / 230,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(news.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(gradient: transparentToBlack),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: _buildTextualInfo(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextualInfo(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetails(news: news)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 7),
              child: news.headline.withStyle(Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(color: Colors.white)),
            ),
            DateFormat().format(news.timestamp).withStyle(
                  TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFF6F6F6),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
