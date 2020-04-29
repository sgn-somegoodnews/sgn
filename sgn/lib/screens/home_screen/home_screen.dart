import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgn/screens/home_screen/widgets/news_feed.dart';
import 'package:sgn/screens/home_screen/widgets/stories_container.dart';
import 'package:sgn/styles/gradient.dart';
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
      title: Center(child: _logo(context)),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 80,
      child: AspectRatio(
        aspectRatio: 400 / 141,
        child: Image.asset(
          "assets/ui/logo_outline.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HomeContentPadding extends StatelessWidget {
  final Widget child;

  HomeContentPadding({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}

class HomeSectionTitle extends StatelessWidget {
  final String text;

  const HomeSectionTitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
        child: text.withStyle(
          TextStyle(
            fontSize: 24,
            color: Color(0xFF2F2F2F),
          ),
        ),
      ),
    );
  }
}

