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
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final news = newsList[index];
          final isFirst = index == 0;
          return HomeContentPadding(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0,isFirst ? 32 : 20),
              child:  isFirst ? FirstNews(news)  : HorizontalNews(news),
            ),
          );
        },
        childCount: newsList.length,
      ),
    );
  }
}
