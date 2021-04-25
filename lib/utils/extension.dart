import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension ContextExtensions on BuildContext {
  bool isDarkTheme() {
    var brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  String currency() {
    Locale locale = Localizations.localeOf(this);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }
}
