import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sgn/screens/home_screen/widgets/story.dart';
import 'package:sgn/stores/stories_store.dart';

class StoriesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<StoriesStore>(context).stories;

    return new Observer(
      builder: (_) => SliverToBoxAdapter(
        child: Container(
          height: 186,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(right: 16),
            children: newsList.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final news = entry.value;
                return Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: StoryThumbnail(
                    news,
                    index: index,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
