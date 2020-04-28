import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/home_screen/home_screen.dart';
import 'package:sgn/screens/home_screen/widgets/horizontal_news.dart';
import 'package:sgn/stores/news_store.dart';

class HomeNewsFeed extends StatefulWidget {
  @override
  _HomeNewsFeedState createState() => _HomeNewsFeedState();
}

class _HomeNewsFeedState extends State<HomeNewsFeed> {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<NewsFeedStore>(context).fetchedNews;
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final news = newsList[index];
        return HomeContentPadding(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: HorizontalNews(news),
          ),
        );
      }, childCount: newsList.length),
    );
  }
}