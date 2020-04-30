import 'package:flutter/material.dart';

class PaddingNavigateBackButton extends StatelessWidget {
  final Widget child;
  PaddingNavigateBackButton(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(left: 10, top: 10, child: child);
  }
}

class NavigateBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () => _click(context),
        icon: Icon(Icons.arrow_back),
        label: null);
  }

  void _click(context) {
    Navigator.pop(context);
  }
}
