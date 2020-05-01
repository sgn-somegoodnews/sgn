import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:sgn/model/story.dart';

part 'stories_store.g.dart';

class StoriesStore extends _StoriesStore with _$StoriesStore {
  StoriesStore() {
    Firestore.instance.collection('stories').orderBy('Timestamp').snapshots().listen((data) {
      final storiesList = data.documents.map(
        (doc) {
          return Story.fromJson(doc.data);
        },
      ).toList();
      this.refresh(storiesList);
    });
  }
}

abstract class _StoriesStore with Store {
  @observable
  ObservableList<Story> stories = new ObservableList();

  @action
  void refresh(List<Story> storiesList) {
    stories
      ..clear()
      ..addAll(storiesList);
  }
}
