// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsFeedStore on _NewsFeedStore, Store {
  final _$fetchedNewsAtom = Atom(name: '_NewsFeedStore.fetchedNews');

  @override
  ObservableList<News> get fetchedNews {
    _$fetchedNewsAtom.context.enforceReadPolicy(_$fetchedNewsAtom);
    _$fetchedNewsAtom.reportObserved();
    return super.fetchedNews;
  }

  @override
  set fetchedNews(ObservableList<News> value) {
    _$fetchedNewsAtom.context.conditionallyRunInAction(() {
      super.fetchedNews = value;
      _$fetchedNewsAtom.reportChanged();
    }, _$fetchedNewsAtom, name: '${_$fetchedNewsAtom.name}_set');
  }

  final _$_NewsFeedStoreActionController =
      ActionController(name: '_NewsFeedStore');

  @override
  void refresh() {
    final _$actionInfo = _$_NewsFeedStoreActionController.startAction();
    try {
      return super.refresh();
    } finally {
      _$_NewsFeedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'fetchedNews: ${fetchedNews.toString()}';
    return '{$string}';
  }
}
