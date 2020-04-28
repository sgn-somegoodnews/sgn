import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sgn/model/news.dart';

// Include generated file
part 'news_store.g.dart';

// This is the class used by rest of your codebase
class NewsFeedStore extends _NewsFeedStore with _$NewsFeedStore {

  static Provider get provider => Provider(create: (_) => new NewsFeedStore());
  static NewsFeedStore of(BuildContext context) => Provider.of<NewsFeedStore>(context);
}

// The store-class
abstract class _NewsFeedStore with Store {

  DateTime lastRefresh = DateTime.now();

  @observable
  ObservableList<News> fetchedNews = new ObservableList();

  @action
  void refresh() {
    lastRefresh = DateTime.now();
  }
}