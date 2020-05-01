import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/news_feed/index.dart';
import 'package:sgn/screens/stories_feed/index.dart';
import 'package:sgn/screens/story_page_view/index.dart';
import 'package:sgn/stores/news_store.dart';
import 'package:sgn/stores/stories_store.dart';
import 'package:sgn/styles/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => new NewsFeedStore()),
        Provider(create: (_) => new StoriesStore()),
      ],
      child: SgnApp(),
    ),
  );
}

class SgnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: "SGN - Some good news",
      initialRoute: '/',
      routes: {
        '/': (context) => NewsFeed(),
        '/news': (context) => NewsFeed(),
        '/stories': (context) => StoriesFeed(),
        '/story': (context) => StoryPageView(),
      },
    );
  }
}
