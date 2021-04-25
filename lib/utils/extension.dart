import 'dart:ui';
import 'package:flutter/widgets.dart';

extension ContextExtensions on BuildContext {
  bool isDarkTheme() {
    var brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
