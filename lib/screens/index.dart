import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:sgn/screens/config_screen/index.dart';
import 'package:sgn/screens/news_feed/index.dart';
import 'package:sgn/screens/saved_news/index.dart';
import 'package:sgn/screens/stories_feed/index.dart';

enum AppPage { NewsFeed, StoriesFeed, Saved, Config }

class App extends StatefulWidget {
  final AppPage startPage;
  App({@required this.startPage, Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.startPage.index;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Color(0xffdddddd)),
          child: SizedBox.expand(
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  children: <Widget>[
                NewsFeed(),
                StoriesFeed(),
                SavedNews(),
                ConfigScreen(),
              ]))),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          pageController.jumpToPage(index);
        },
        backgroundColor: Color(0xff020f6b),
        items: <BottomNavyBarItem>[
          //Icons.assignment, Icons.art_track, Icons.featured_play_list, Icons.description,
          //Icons.fiber_new, Icons.filter, Icons.format_align_left, Icons.image,
          //Icons.insert_drive_file, Icons.library_books, Icons.photo_album, Icons.receipt,
          //Icons.short_text, Icons.sort, Icons.subject, Icons.subtitles, Icons.turned_in
          buildBarItem('News', Icons.art_track),
          buildBarItem('Stories', Icons.view_carousel),
          buildBarItem('Saved', Icons.turned_in),
          buildBarItem('Config', Icons.settings),
        ],
      ),
    );
  }

  BottomNavyBarItem buildBarItem(String title, IconData iconData) {
    return BottomNavyBarItem(
        title: Text(title),
        icon: Icon(iconData),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        textAlign: TextAlign.center);
  }
}
