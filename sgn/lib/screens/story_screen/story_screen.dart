import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgn/model/story.dart';
import 'package:sgn/stores/stories_store.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:sgn/styles/text.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryScreen extends StatefulWidget {
  final int startingIndex;

  const StoryScreen({Key key, this.startingIndex = 0}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  PageController controller;
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    print(widget.startingIndex);
    controller = PageController(
      initialPage: widget.startingIndex,
      keepPage: true,
    );

    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storiesList = Provider.of<StoriesStore>(context).stories;
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: storiesList.length,
        itemBuilder: (context, index) {
          return StoryPage(
            storiesList[index],
            index: index,
            currentPageValue: currentPageValue,
          );
        },
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  final Story story;
  final int index;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final double currentPageValue;

  const StoryPage(
    this.story, {
    Key key,
    this.index,
    this.onNext,
    this.onPrev,
    this.currentPageValue,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  double opacity = 0.0;
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(scroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  get alignment {
    if (widget.index == widget.currentPageValue.floor()) {
      return Alignment(0.0 + (widget.currentPageValue - widget.index), 0.0);
    } else if (widget.index == widget.currentPageValue.floor() + 1) {
      return Alignment(0.0 + (widget.currentPageValue - widget.index), 0.0);
    } else {
      return Alignment(0.0, 0.0);
    }
  }

  void scroll() {
    setState(() {
      opacity = controller.offset.clamp(0.0, 150.0) / 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1.0 - opacity,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: alignment,
                  image: NetworkImage(widget.story.image),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(gradient: transparentToBlack2),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: CustomScrollView(
              controller: controller,
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverFillViewport(
                  viewportFraction: 0.9,
                  padEnds: false,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 40.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
                                ),
                              ),
                              child: widget.story.title.withStyle(
                                TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.4,
                                  fontFamily:
                                      GoogleFonts.robotoSlab().fontFamily,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    childCount: 1,
                  ),
                ),
                StoryReadMore(widget.story),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StoryReadMore extends StatefulWidget {
  final Story story;

  const StoryReadMore(this.story, {Key key}) : super(key: key);

  @override
  _StoryReadMoreState createState() => _StoryReadMoreState();
}

class _StoryReadMoreState extends State<StoryReadMore> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 40, top: 40),
                child: widget.story.body.withStyle(
                  TextStyle(height: 1.4, color: Colors.white, fontSize: 16),
                ),
              ),
              MoreInformationLink(widget.story),
            ],
          )),
    );
  }
}

class MoreInformationLink extends StatelessWidget {
  final Story story;

  MoreInformationLink(this.story, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: FlatButton(
        onPressed: _click,
        color: Colors.transparent,
        child: Text(
          "${story.callToAction ?? "Read more"} →",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  void _click() async {
    if (await canLaunch(story.link)) {
      await launch(story.link);
    } else {
      throw 'Could not launch ${story.link}';
    }
  }
}
