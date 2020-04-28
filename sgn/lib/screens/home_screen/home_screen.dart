import 'package:flutter/material.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/screens/home_screen/widgets/horizontal_news.dart';
import 'package:sgn/screens/home_screen/widgets/story.dart';

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
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Center(
            child: Text(
          "SGN",
          style: TextStyle(color: Colors.white),
        )),
        expandedHeight: 50,
        backgroundColor: Colors.blue,
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            switch (index) {
              case 0:
                return _buildSectionTitle("Stories");
              case 1:
                return _buildStoriesSection(context);
              case 2:
                return _buildSectionTitle("Algumas boas notícias");
              default:
                final indexNewsGoodSection = index - 3;
                return _goodNewsSectionBuilderDelegate(
                    indexNewsGoodSection, context);
            }
          },
          childCount: _mockStories().length + 3,
        ),
      )
    ]));
  }

  Widget _buildStoriesSection(BuildContext context) {
    final news = _mockStories();

    return _buildLeftPaddingNews(
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: news
                .map((news) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Story(news)))
                .toList(),
          ),
        ),
        context);
  }

  Widget _goodNewsSectionBuilderDelegate(int index, BuildContext context) {
    final newsList = _mockStories();
    final news = newsList[index];

    return _buildLeftPaddingNews(
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: HorizontalNews(news)),
        context);
  }

  Widget _buildLeftPaddingNews(Widget child, BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0), child: child);
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
        padding: EdgeInsets.fromLTRB(18, 40, 18, 10),
        child: Text(
          text,
          style: TextStyle(fontSize: 22),
        ));
  }

  List<News> _mockStories() {
    return [
      News("Small title", "Todo mundo adotou, isso eh muito legal",
          DateTime(2020, 4, 12, 5, 52), "assets/smiling-little-girls.jpg"),
      News(
          "This is a very large title! Even larger than you think",
          "This is a very large description. Lots of information down here, you know? Look at meee",
          DateTime(2020, 4, 12, 5, 52),
          "assets/woman.jpg"),
      News("Small title", "Todo mundo adotou, isso eh muito legal",
          DateTime(2020, 4, 12, 5, 52), "assets/smiling-little-girls.jpg"),
      News("Small title", "Todo mundo adotou, isso eh muito legal",
          DateTime(2020, 4, 12, 5, 52), "assets/woman.jpg"),
      News("Small title", "Todo mundo adotou, isso eh muito legal",
          DateTime(2020, 4, 12, 5, 52), "assets/smiling-little-girls.jpg"),
    ];
  }
}
