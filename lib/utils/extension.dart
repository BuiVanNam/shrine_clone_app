import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension ContextExtensions on BuildContext {
  bool isDarkTheme() {
    var brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  bool darkModeEnabled() {
    final ThemeData theme = Theme.of(this);
    return theme.brightness == Brightness.dark;
  }

  String currency() {
    Locale locale = Localizations.localeOf(this);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }
}

RectTween createRectTweenCenter(Rect? begin, Rect? end) {
  return MaterialRectCenterArcTween(begin: begin, end: end);
}
