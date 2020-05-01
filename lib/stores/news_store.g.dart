// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsFeedStore on _NewsFeedStore, Store {
  final _$newsAtom = Atom(name: '_NewsFeedStore.news');

  @override
  ObservableList<News> get news {
    _$newsAtom.context.enforceReadPolicy(_$newsAtom);
    _$newsAtom.reportObserved();
    return super.news;
  }

  @override
  set news(ObservableList<News> value) {
    _$newsAtom.context.conditionallyRunInAction(() {
      super.news = value;
      _$newsAtom.reportChanged();
    }, _$newsAtom, name: '${_$newsAtom.name}_set');
  }

  final _$_NewsFeedStoreActionController =
      ActionController(name: '_NewsFeedStore');

  @override
  void refresh(List<News> newsList) {
    final _$actionInfo = _$_NewsFeedStoreActionController.startAction();
    try {
      return super.refresh(newsList);
    } finally {
      _$_NewsFeedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'news: ${news.toString()}';
    return '{$string}';
  }
}
