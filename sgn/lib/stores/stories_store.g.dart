// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoriesStore on _StoriesStore, Store {
  final _$storiesAtom = Atom(name: '_StoriesStore.stories');

  @override
  ObservableList<Story> get stories {
    _$storiesAtom.context.enforceReadPolicy(_$storiesAtom);
    _$storiesAtom.reportObserved();
    return super.stories;
  }

  @override
  set stories(ObservableList<Story> value) {
    _$storiesAtom.context.conditionallyRunInAction(() {
      super.stories = value;
      _$storiesAtom.reportChanged();
    }, _$storiesAtom, name: '${_$storiesAtom.name}_set');
  }

  final _$_StoriesStoreActionController =
      ActionController(name: '_StoriesStore');

  @override
  void refresh(List<Story> storiesList) {
    final _$actionInfo = _$_StoriesStoreActionController.startAction();
    try {
      return super.refresh(storiesList);
    } finally {
      _$_StoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'stories: ${stories.toString()}';
    return '{$string}';
  }
}
