import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgn/model/news.dart';

class Story extends StatelessWidget {
  final News news;
  const Story(this.news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthStory = MediaQuery.of(context).size.width * 0.38;
    return Container(
        width: widthStory,
        decoration: _buildDecoration(),
        child: Stack(children: [
          Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                  width: widthStory * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    news.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )))
        ]));
  }

  Decoration _buildDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(news.image),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[600],
          blurRadius: 5.0,
          spreadRadius: 1.5,
          offset: Offset(
            1.0,
            1.0,
          ),
        )
      ],
    );
  }
}
