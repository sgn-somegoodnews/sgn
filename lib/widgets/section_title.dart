import 'package:flutter/material.dart';
import 'package:sgn/styles/text.dart';

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
      child: text.withStyle(
        TextStyle(
          fontSize: 24,
          color: Color(0xFF2F2F2F),
        ),
      ),
    );
  }
}
