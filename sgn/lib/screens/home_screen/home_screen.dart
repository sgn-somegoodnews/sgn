import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/home_screen/widgets/news_feed.dart';
import 'package:sgn/screens/home_screen/widgets/story.dart';
import 'package:sgn/stores/news_store.dart';
import 'package:sgn/styles/text.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          HomeAppBar(),
          HomeSectionTitle("Stories"),
          StoriesContainer(),
          HomeSectionTitle("Some good news"),
          HomeNewsFeed(),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Center(
        child: Text(
          "SGN",
          style: TextStyle(color: Colors.white),
        ),
      ),
      expandedHeight: 50,
      backgroundColor: Colors.blue,
    );
  }
}

class HomeContentPadding extends StatelessWidget {
  final Widget child;
  HomeContentPadding({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10), child: child);
  }
}

class HomeSectionTitle extends StatelessWidget {
  final String text;

  const HomeSectionTitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 40, 18, 10),
        child: text.withStyle(TextStyle(fontSize: 22)),
      ),
    );
  }
}

class StoriesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<NewsFeedStore>(context).fetchedNews;

    return SliverToBoxAdapter(
      child: HomeContentPadding(
        child: Container(
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
