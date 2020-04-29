import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/home_screen/home_screen.dart';
import 'package:sgn/screens/home_screen/widgets/story.dart';
import 'package:sgn/stores/news_store.dart';

class StoriesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<NewsFeedStore>(context).fetchedNews;

    return SliverToBoxAdapter(
      child: Container(
        height: 186,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(right: 16),
          children: newsList
              .map(
                (news) => Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Story(news),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
