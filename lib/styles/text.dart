import 'package:flutter/material.dart';

extension StyledText on String {
  Text withStyle(TextStyle style) => Text(
        this,
        style: style,
      );
}
