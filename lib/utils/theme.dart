import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF283593);
const kPrimaryRippleColor = Color(0x32283593);
const kAccentColor = Color(0xFF283593);
const kErrorRedColor = Color(0xFFC5032B);
const kColorBgThumbCart = Color(0xFF3f51b5);

const kBackgroundColorLight = Colors.white;
const kBackgroundColorDark = Color(0xD7000000);

const kPrimaryTextColorLight = Color(0xFF212121);
const kPrimaryTextColorDark = Colors.white;

const kSecondaryTextColorLight = Color(0xFF757575);
const kSecondaryTextColorDark = Colors.white60;

const SystemUiOverlayStyle lightSystemUi = SystemUiOverlayStyle(
  systemNavigationBarColor: kBackgroundColorLight,
  systemNavigationBarDividerColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
);

const SystemUiOverlayStyle darkSystemUi = SystemUiOverlayStyle(
  systemNavigationBarColor: kBackgroundColorDark,
  systemNavigationBarDividerColor: Colors.black,
  statusBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
);

final ThemeData kThemeLight = _buildLightTheme();

ThemeData _buildLightTheme() {
  final base = ThemeData.light();
  return base.copyWith(
      accentColor: kAccentColor,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColorLight,
      errorColor: kErrorRedColor,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: kAccentColor,
          selectionColor: kPrimaryRippleColor,
          selectionHandleColor: kAccentColor),
      textTheme: _buildTextTheme(base.textTheme, true),
      appBarTheme:
          AppBarTheme(textTheme: GoogleFonts.notoSansTextTheme()),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(18, 10, 18, 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        textStyle: MaterialStateProperty.all(
            GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
        overlayColor: MaterialStateProperty.all(kPrimaryRippleColor),
      )));
}

final ThemeData kThemeDark = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
      accentColor: kAccentColor,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColorDark,
      errorColor: kErrorRedColor,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: kAccentColor,
          selectionColor: kPrimaryRippleColor,
          selectionHandleColor: kAccentColor),
      textTheme: _buildTextTheme(base.textTheme, false),
      appBarTheme: AppBarTheme(textTheme: GoogleFonts.notoSansTextTheme()),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(18, 10, 18, 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        textStyle: MaterialStateProperty.all(
            GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
        overlayColor: MaterialStateProperty.all(kPrimaryRippleColor),
      )));
}

TextTheme _buildTextTheme(TextTheme base, bool isLight) {
  return GoogleFonts.notoSansTextTheme(base.copyWith().apply(
        displayColor: isLight ? kPrimaryTextColorLight : kPrimaryTextColorDark,
        bodyColor: isLight ? kPrimaryTextColorLight : kPrimaryTextColorDark,
      ));
}
