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
      child: HomeContentPadding(
        child: Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: newsList
                .map((news) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Story(news)))
                .toList(),
          ),
        ),
      ),
    );
  }
}
