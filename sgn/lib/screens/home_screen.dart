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
    return Scaffold(
        body: SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: _buildStories())));
  }

  Widget _buildStories() {
    final news = [
      News("Small title", "assets/smiling-little-girls.jpg"),
      News("Big news title", "assets/woman.jpg"),
      News("Big news title", "assets/woman.jpg"),
      News("Big news title", "assets/woman.jpg"),
      News("Big news title", "assets/woman.jpg"),
      News("Big news title", "assets/woman.jpg"),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            "Stories",
            style: TextStyle(fontSize: 22),
          )),
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: news.map((news) => Story(news)).toList(),
        ),
      )
    ]);
  }
}
