import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgn/model/news.dart';

class Story extends StatelessWidget {
  final News news;
  const Story(this.news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Color(0xffCCCCCC),
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
            ),
            child: Column(children: [Text(news.title)])));
  }
}
