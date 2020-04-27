import 'package:flutter/material.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/widgets/story.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final news = [News("News 1"), News("News 2")];
    return Scaffold(
        body: SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  children: news.map((news) => Story(news)).toList(),
                ))));
  }
}
