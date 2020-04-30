import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlatLink extends StatelessWidget {
  final String url;
  final String text;
  final TextStyle textStyle;
  FlatLink(
      {@required this.text,
      @required this.url,
      this.textStyle = const TextStyle(
          color: Colors.blueAccent, decoration: TextDecoration.underline),
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: _click,
        color: Colors.transparent,
        child: Text(text, style: textStyle),
      ),
    );
  }

  void _click() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ${url}';
    }
  }
}
