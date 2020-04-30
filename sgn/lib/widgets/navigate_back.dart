import 'package:flutter/material.dart';

class PaddingNavigateBackButton extends StatelessWidget {
  final Widget child;
  PaddingNavigateBackButton({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: child);
  }
}

class NavigateBackButton extends StatelessWidget {
  final Color color;
  final IconData iconData;
  NavigateBackButton(
      {this.color = Colors.white70, this.iconData = Icons.arrow_back, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _click(context), child: Icon(this.iconData, color: color));
  }

  void _click(context) {
    Navigator.pop(context);
  }
}
