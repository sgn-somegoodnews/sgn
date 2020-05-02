import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgn/model/news.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sgn/screens/news_feed/widgets/larger_news_card.dart';
import 'package:sgn/screens/news_feed/widgets/news_card.dart';
import 'package:sgn/stores/news_store.dart';
import 'package:sgn/widgets/section_title.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return
        //TODO: (mocked) Observer(builder: (context) =>
        Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SafeArea(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(child: SectionTitle("Some good news")),
                  buildContent(context),
                ],
              ),
            ));
    //);
  }

  Widget buildContent(BuildContext context) {
    final newsList = _getNews();

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
                      style: Theme.of(context).textTheme.headline5))
            ]))),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final news = newsList[index];
          final isFirst = index == 0;
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, isFirst ? 32 : 20),
            child: isFirst ? LargerNewsCard(news) : NewsCard(index, news),
          );
        },
        childCount: newsList.length,
      ),
    );
  }

  List<News> _getNews() {
    // TODO: mocked
    // final newsList = Provider.of<NewsFeedStore>(context).news;

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
    return [news, news, news, news, news, news, news, news];
  }
}
