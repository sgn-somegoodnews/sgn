import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:sgn/styles/text.dart';

class Story extends StatelessWidget {
  final News news;

  const Story(this.news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 124 / 186,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.8),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.8),
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
                child: news.headline.withStyle(
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

/*  Positioned(
  bottom: 10,
  left: 10,
  child: Container(
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
  child: Text(
  news.headline,
  style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.white),
  ),
  ),
  )*/

  Decoration _buildDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey[600],
      //     blurRadius: 5.0,
      //     spreadRadius: 1.5,
      //     offset: Offset(
      //       1.0,
      //       1.0,
      //     ),
      //   )
      // ],
    );
  }
}
