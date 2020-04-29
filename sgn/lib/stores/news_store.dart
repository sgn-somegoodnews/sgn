import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:sgn/model/news.dart';

part 'news_store.g.dart';

// This is the class used by rest of your codebase
class NewsFeedStore extends _NewsFeedStore with _$NewsFeedStore {
  NewsFeedStore() {
    Firestore.instance.collection('news').snapshots().listen(
      (data) {
        final newsList = data.documents
            .map(
              (doc) {
                return News.fromJson(doc.data);
              },
            )
            .toList();
        this.refresh(newsList);
      },
    );
  }
}

// The store-class
abstract class _NewsFeedStore with Store {
  @observable
  ObservableList<News> news = new ObservableList();

  @action
  void refresh(List<News> newsList) {
    news
      ..clear()
      ..addAll(newsList);
  }
}
