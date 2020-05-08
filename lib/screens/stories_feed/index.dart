import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

import 'package:sgn/model/news.dart';
import 'package:sgn/screens/saved_news/data.dart';
import 'package:tuple/tuple.dart';

List<News> newsList = [
  News(
      headline: "Hounted Ground",
      image:
          "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1008&q=80"),
  News(
      headline: "Fallen In Love",
      image:
          "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
  News(
      headline: "The Dreaming Moon",
      image:
          "https://images.unsplash.com/photo-1537522306408-8435f315b2e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"),
  News(
      headline: "Jack the Persian and the Black Castel",
      image:
          "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1050&q=80"),
];

class StoriesFeed extends StatefulWidget {
  @override
  _StoriesFeedState createState() => new _StoriesFeedState();
}

final maxMisalignmentPageSnapping = 5;

class _StoriesFeedState extends State<StoriesFeed> {
  var currentPage = newsList.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: newsList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 0, 30.0),
                  child: Text(
                      "Stories ${currentPage.toString().substring(0, currentPage.toString().length >= 4 ? 4 : 1)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        CardScrollWidget(currentPage),
                        Positioned.fill(
                          child: PageView.builder(
                            itemCount: newsList.length,
                            controller: controller,
                            // TODO: pageSnapping
                            // pageSnapping: min(currentPage - currentPage.floor(),
                            // currentPage.ceil() - currentPage) <=
                            // maxMisalignmentPageSnapping,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

final cardAspectRatio = 12.0 / 16.0;
final percWidthSize = 0.6;
final widthSubtractedSideCards = 20;

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      List<Widget> cardList = new List();
      var i = 0, isDrawingLeft = true;
      final cardPropertiesCalculator = CardPropertiesCalculator(
          context, constraints, currentPage, newsList.length);
      while (true) {
        if (isDrawingLeft && i == currentPage.round()) {
          i = newsList.length - 1;
          isDrawingLeft = false;
        }

        final delta = currentPage - i;
        final cardWidth = cardPropertiesCalculator.getCardWidth(delta, context);
        final cardStart = cardPropertiesCalculator.getCardStart(delta, context);
        cardList.add(buildCard(
          context,
          i: i,
          width: cardWidth,
          start: cardStart,
          maxHeight: constraints.maxHeight,
        ));

        if (i == currentPage.round()) {
          break;
        }
        if (isDrawingLeft)
          i++;
        else
          i--;
      }
      return Stack(
        children: cardList,
      );
    });
  }

  Widget buildCard(BuildContext context,
      {int i, double start, double width, double maxHeight}) {
    final height = width / cardAspectRatio;
    final top = (maxHeight - height) / 2;

    return Positioned.directional(
      top: top,
      start: start,
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(3.0, 6.0),
                blurRadius: 10.0)
          ]),
          width: width,
          child: AspectRatio(
            aspectRatio: cardAspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(newsList[i].image, fit: BoxFit.cover),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(newsList[i].headline,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontFamily: "SF-Pro-Text-Regular")),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 12.0, bottom: 12.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text("Read Later",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final maxCardsInScreen = 10;
final minPercShowCard = 0;
final maxPercShowCard = 0.2;
final amntPxlMoveOneDelta = 50;

class CardPropertiesCalculator {
  final BuildContext context;
  final BoxConstraints constraints;
  final double currentPage;
  final int amountCards;

  double widthOfPrimaryCard;
  double startCenter;
  final List<double> rightCardsWidth = [];
  final List<double> leftCardsWidth = [];
  final List<double> rightCardsStart = [];
  final List<double> leftCardsStart = [];
  CardPropertiesCalculator(
      this.context, this.constraints, this.currentPage, this.amountCards) {
    widthOfPrimaryCard = constraints.maxWidth * percWidthSize;
    startCenter = (constraints.maxWidth - widthOfPrimaryCard) / 2;
  }

  double getCardWidth(double delta, BuildContext context) {
    final widthList = (delta > 0) ? rightCardsWidth : leftCardsWidth;
    final wasAlreadyGenerated = widthList.length >= delta.floor() + 1;
    if (!wasAlreadyGenerated) {
      _generateCardValuesUntil(delta, context);
    }

    return widthList[delta.floor()];
  }

  double getCardStart(double delta, BuildContext context) {
    final startList = (delta > 0) ? rightCardsStart : leftCardsStart;
    final wasAlreadyGenerated = startList.length >= delta.floor() + 1;
    if (!wasAlreadyGenerated) {
      _generateCardValuesUntil(delta, context);
    }

    return startList[delta.floor()];
  }

  void _generateCardValuesUntil(double delta, BuildContext context) {
    final toRight = delta > 0;
    final variation = delta - delta.floor();

    final startPrimaryCard =
        (MediaQuery.of(context).size.width - widthOfPrimaryCard) / 2;

    final startList = toRight ? rightCardsStart : leftCardsStart;
    final widthList = toRight ? rightCardsWidth : leftCardsWidth;

    final amountGenerated = startList.length;
    for (var iIndexAbs = amountGenerated;
        iIndexAbs <= delta.floor();
        iIndexAbs++) {
      debugPrint("index: $iIndexAbs");

      final curDelta = (iIndexAbs + variation) * (toRight ? 1 : -1);
      final isOnCenter = curDelta.floor() == 0;

      final subtractedWidth = (Curves.easeOutQuad
                  .transform(curDelta.abs() - curDelta.abs().floor()) +
              curDelta.abs().floor()) *
          widthSubtractedSideCards;
      final currentWidth = max(widthOfPrimaryCard - subtractedWidth, 0.0);
      widthList.add(currentWidth);

      double start;
      if (!isOnCenter) {
        final lastWidth = widthList[iIndexAbs - 1];
        final lastStart = startList[iIndexAbs - 1];

        final startAlignAbsHigh = lastStart + (toRight ? lastWidth : 0);

        final factorIndirectPropIndex =
            1 - Curves.linear.transform(min(iIndexAbs / amountCards, 1));
        final percWidthShow = minPercShowCard +
            factorIndirectPropIndex * (maxPercShowCard - minPercShowCard);
        start = startAlignAbsHigh +
            currentWidth * (1 - percWidthShow) * (toRight ? -1 : 1);
      } else
        start = startPrimaryCard + variation * amntPxlMoveOneDelta;
      startList.add(start);
    }
  }
}
