import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sgn/model/news.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  final News news;

  NewsDetails({@required this.news, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          NewsDetailsHeader(news: news),
          NewsDetailsContent(news: news)
        ],
      ),
    );
  }
}

class MoreInformationLink extends StatelessWidget {
  final News news;

  MoreInformationLink({@required this.news, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: _click,
        color: Colors.transparent,
        child: Text(
          "Read more →",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  void _click() async {
    if (await canLaunch(news.url)) {
      await launch(news.url);
    } else {
      throw 'Could not launch ${news.url}';
    }
  }
}

class NewsDetailsHeader extends StatelessWidget {
  final News news;

  NewsDetailsHeader({@required this.news, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
        floating: false,
        pinned: true,
        delegate: NewsDetailsHeaderDelegate(news),
      );
}

class NewsDetailsHeaderDelegate implements SliverPersistentHeaderDelegate {
  final News news;

  NewsDetailsHeaderDelegate(this.news);

  final double minExtent = 100;
  final double maxExtent = 450;

  final double percExpandedStartOpaquingImg = 0.5;
  final Color endBackgroundColor = Colors.black54;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(20 * _getPercExpandedUntilZero(shrinkOffset)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(news.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: orangeToRed
                      .scale(1.0 - _getPercExpandedUntilZero(shrinkOffset))),
            ),
            Opacity(
              opacity: _getPercExpandedUntilZero(shrinkOffset),
              child: Container(
                decoration: BoxDecoration(
                  gradient: transparentToBlack,
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              right: 16.0,
              bottom: 8 + _getPercExpandedUntilZero(shrinkOffset) * 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: _getPercExpandedUntilZero(shrinkOffset),
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
                              _getPercExpanded(shrinkOffset).clamp(0.6, 1.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getPercExpanded(double shrinkOffset) {
    return 1.0 - min(maxExtent - minExtent, shrinkOffset) / maxExtent;
  }

  double _getPercExpandedUntilZero(double shrinkOffset) {
    return max(0, (maxExtent - shrinkOffset) / (maxExtent - minExtent) - 0.4);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

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
              "${news.text}",
              style: TextStyle(
                  fontSize: 16, height: 1.4, color: Color(0xFF454545)),
            ),
            MoreInformationLink(news: news)
          ],
        ),
      ),
    );
  }
}
