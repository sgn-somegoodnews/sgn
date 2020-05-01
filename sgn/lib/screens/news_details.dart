import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sgn/config/heros_tag.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:sgn/widgets/flat_link.dart';
import 'package:sgn/widgets/navigate_back.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  final int index;

  NewsDetails({@required this.news, @required this.index, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          NewsDetailsHeader(news: news, index: index),
          NewsDetailsContent(news: news)
        ],
      ),
    );
  }
}

class NewsDetailsHeader extends StatelessWidget {
  final News news;
  final int index;

  NewsDetailsHeader({@required this.news, @required this.index, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
        floating: false,
        pinned: true,
        delegate: NewsDetailsHeaderDelegate(index, news),
      );
}

class NewsDetailsHeaderDelegate implements SliverPersistentHeaderDelegate {
  final News news;
  final int index;
  NewsDetailsHeaderDelegate(this.index, this.news);

  final double minExtent = 100;
  final double maxExtent = 450;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
        borderRadius:
            BorderRadius.circular(20 * getPercExpandedUntilZero(shrinkOffset)),
        child: Stack(children: [
          Hero(
              tag: HerosTag.imageNews(index),
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                  image: NetworkImage(news.image),
                  fit: BoxFit.cover,
                ))),
                Container(
                  decoration: BoxDecoration(
                      gradient: orangeToRed
                          .scale(1.0 - getPercExpandedUntilZero(shrinkOffset))),
                ),
                Opacity(
                  opacity: getPercExpandedUntilZero(shrinkOffset),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: transparentToBlack,
                    ),
                  ),
                ),
              ])),
          Positioned(
              left: 0,
              top: 0,
              child: PaddingNavigateBackButton(child: NavigateBackButton())),
          Positioned(
              left: 16.0,
              right: 16.0,
              bottom: 8 + getPercExpandedUntilZero(shrinkOffset) * 12,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: getPercExpandedUntilZero(shrinkOffset),
                      child: Text(
                        new DateFormat().format(news.timestamp),
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        news.headline,
                        style: Theme.of(context).textTheme.headline1.apply(
                            color: Colors.white,
                            fontSizeFactor:
                                getPercExpanded(shrinkOffset).clamp(0.6, 1.0)),
                      ),
                    ),
                  ])),
        ]));
  }

  double getPercExpanded(double shrinkOffset) {
    return 1.0 - min(maxExtent - minExtent, shrinkOffset) / maxExtent;
  }

  double getPercExpandedUntilZero(double shrinkOffset) {
    return max(0, (maxExtent - shrinkOffset) / (maxExtent - minExtent) - 0.4);
  }

  // TODO
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  // TODO
  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  // TODO
  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class NewsDetailsContent extends StatelessWidget {
  final News news;

  const NewsDetailsContent({@required this.news, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 15),
                child: Text(
                  news.subheadline,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Text(
              news.text,
              style: TextStyle(
                  fontSize: 16, height: 1.4, color: Color(0xFF454545)),
            ),
            FlatLink(
              text: "Read more →",
              url: news.url,
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
