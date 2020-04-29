import 'package:flutter/material.dart';

class NavigateBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        top: 10,
        child: FlatButton.icon(
            onPressed: () => _click(context),
            icon: Icon(Icons.arrow_back),
            label: null));
  }

  void _click(context) {
    Navigator.pop(context);
  }
}
