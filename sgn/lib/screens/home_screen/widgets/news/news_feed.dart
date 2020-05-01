import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/screens/home_screen/home_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sgn/screens/home_screen/widgets/news/first_news.dart';
import 'package:sgn/screens/home_screen/widgets/news/horizontal_news.dart';
import 'package:sgn/theme.dart';

class HomeNewsFeed extends StatefulWidget {
  @override
  _HomeNewsFeedState createState() => _HomeNewsFeedState();
}

class _HomeNewsFeedState extends State<HomeNewsFeed> {
  @override
  Widget build(BuildContext context) {
    // TODO: mocked
    //final newsList = Provider.of<NewsFeedStore>(context).news;

    debugPrint("before");
    final news = News(
        headline:
            "Hospital cria barreira barata contra covid para refeitório: almoçar junto",
        image:
            "https://www.sonoticiaboa.com.br/wp-content/uploads/2020/04/barreira-PVC-corona-close.jpg",
        subheadline:
            "Uma barreira contra a covid, barata e simples de fazer, foi criada por brasileiros e está sendo usada no refeitório de um hospital de Goiânia. Ela permite que os colaboradores almocem juntos sem risco de contaminação",
        text:
            "[Text]Uma barreira contra a covid, barata e simples de fazer, foi criada por brasileiros e está sendo usada no refeitório de um hospital de Goiânia. Ela permite que os colaboradores almocem juntos sem risco de contaminação",
        timestamp: DateTime(2020),
        url:
            "https://www.sonoticiaboa.com.br/2020/04/29/hospital-barreira-barata-contra-covid-refeitorio-almocar-junto/");
    debugPrint("after");
    debugPrint("news: " + news.toString());
    final newsList = [
      news,
      news,
      news,
      news,
      news,
      news,
      news,
      news,
      news,
      news,
      news
    ];

    if (newsList.isEmpty) {
      return SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Column(children: [
              Text(
                "No news were found!",
                style: TextStyle(
                    fontFamily: GoogleFonts.robotoSlab().fontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Please, check out your internet connection...",
                      style: theme.textTheme.headline5))
            ]))),
      );
    }

    return Observer(
      builder: (_) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final news = newsList[index];
            final isFirst = index == 0;
            return HomeContentPadding(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, isFirst ? 32 : 20),
                child: isFirst ? FirstNews(news) : HorizontalNews(index, news),
              ),
            );
          },
          childCount: newsList.length,
        ),
      ),
    );
  }
}
