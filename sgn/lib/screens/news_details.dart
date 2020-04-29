import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:intl/intl.dart';
import 'package:sgn/model/news.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  NewsDetails({@required this.news, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomScrollView(
            slivers: <Widget>[
              NewsDetailsHeader(news: news),
              NewsDetailsContent(news: news)
            ],
          ),
          Positioned(
              bottom: 20, right: 10, child: MoreInformationLink(news: news)),
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
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(
      //     color: Color(0xaa111111),
      //     blurRadius: 2,
      //     spreadRadius: 0.5,
      //   ),
      // ]),
      child: FlatButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/newsDetailsContent');
        },
        color: Color(0xffdddddd),
        icon: Icon(Icons.arrow_forward, color: Colors.redAccent),
        label: Text(
          "Saiba mais",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
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
  final double maxExtent = 350;

  final double percExpandedStartOpaquingImg = 0.5;
  final Color endBackgroundColor = Colors.black54;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        child: Stack(fit: StackFit.expand, children: [
      Image.network(news.image, fit: BoxFit.cover),
      Container(color: _backgroundColor(shrinkOffset)),
      //     NavigateBackButton(),
      Positioned(
        left: 16.0,
        right: 16.0,
        bottom: 8 + _getPercExpandedUntilZero(shrinkOffset) * 12,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            new DateFormat().format(news.timestamp),
            style: TextStyle(
                fontSize: _titleSize(shrinkOffset, maxSize: 14, minSize: 11),
                color: Colors.white70),
          ),
          Text(
            news.headline,
            style: TextStyle(
              fontSize: _titleSize(shrinkOffset, maxSize: 28, minSize: 16),
              color: Colors.white,
            ),
          ),
        ]),
      ),
    ]));
  }

  Color _backgroundColor(double shrinkOffset) {
    final percExpanded = _getPercExpandedUntilZero(shrinkOffset);
    final transparency = percExpanded / percExpandedStartOpaquingImg;
    if (transparency > 1) return Colors.transparent;
    return endBackgroundColor.withOpacity(1.0 - transparency);
  }

  double _titleSize(double shrinkOffset,
      {@required double maxSize, @required double minSize}) {
    return minSize + _getPercExpanded(shrinkOffset) * (maxSize - minSize);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 15),
                child: Text(
                  news.subheadline,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Text(
              "${news.text} \n ${_mockDescription()}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: remove this
  String _mockDescription() {
    return """
    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """;
  }
}
