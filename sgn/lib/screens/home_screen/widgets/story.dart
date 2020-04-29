import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgn/model/story.dart';
import 'package:sgn/styles/gradient.dart';
import 'package:sgn/styles/text.dart';

class StoryThumbnail extends StatelessWidget {
  final Story story;

  const StoryThumbnail(this.story, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 124 / 186,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.8),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.8),
            image: DecorationImage(
              image: NetworkImage(story.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(gradient: transparentToBlack),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: story.shortTitle.withStyle(
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
