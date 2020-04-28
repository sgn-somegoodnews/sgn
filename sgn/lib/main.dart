import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/home_screen/home_screen.dart';
import 'package:sgn/theme.dart';

import 'stores/news_store.dart';

void main() {
  runApp(SgnApp());
}

class SgnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [NewsFeedStore.provider],
      child: MaterialApp(
        title: "SGN - Some good news",
        theme: theme,
        home: HomeScreen(),
      ));
}
