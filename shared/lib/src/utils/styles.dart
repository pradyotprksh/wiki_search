import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/shared.dart';

/// A chunk of styles used in the application.
abstract class Styles {
  static String baseFontFamily = GoogleFonts.ptSans().fontFamily;

  // light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColor: ColorsValue.primaryColor,
    backgroundColor: ColorsValue.backgroundColor,
    primarySwatch: MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: baseFontFamily,
    textTheme: TextTheme(
      bodyText1: bodyTextLight1,
      bodyText2: bodyTextLight2,
      subtitle1: subtitleLight1,
      subtitle2: subtitleLight2,
      caption: captionLight,
      button: buttonLight,
      headline1: headlineLight1,
      headline2: headlineLight2,
      headline3: headlineLight3,
      headline4: headlineLight4,
      headline5: headlineLight5,
      headline6: headlineLight6,
    ),
    iconTheme: iconThemeData,
    buttonTheme: buttonThemeData,
  );

  // dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColor: ColorsValue.primaryColor,
    backgroundColor: ColorsValue.backgroundColor,
    primarySwatch: MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: baseFontFamily,
    textTheme: TextTheme(
      subtitle1: subtitleDark1,
      subtitle2: subtitleDark2,
      bodyText1: bodyTextDark1,
      bodyText2: bodyTextDark2,
      caption: captionDark,
      button: buttonDark,
      headline1: headlineDark1,
      headline2: headlineDark2,
      headline3: headlineDark3,
      headline4: headlineDark4,
      headline5: headlineDark5,
      headline6: headlineDark6,
    ),
    iconTheme: iconThemeData,
    buttonTheme: buttonThemeData,
  );

  static IconThemeData iconThemeData = const IconThemeData(
    color: Colors.white,
    size: Dimens.eighteen,
  );

  static ButtonThemeData buttonThemeData = ButtonThemeData(
      buttonColor: ColorsValue.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.fifty,
        ),
      ));

  // Different style used in the application
  // light
  static TextStyle bodyTextLight1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyTextLight2 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitleLight1 = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitleLight2 = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle buttonLight = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );
  static TextStyle captionLight = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle headlineLight6 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight5 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight4 = GoogleFonts.ptSans(
    fontSize: Dimens.eighteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight3 = GoogleFonts.ptSans(
    fontSize: Dimens.twenty,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight2 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight1 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyFour,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // dark
  static TextStyle bodyTextDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle bodyTextDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
  );
  static TextStyle subtitleDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle subtitleDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.twelve,
    color: Colors.white,
  );
  static TextStyle buttonDark = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );
  static TextStyle captionDark = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
  );
  static TextStyle headlineDark6 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark5 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark4 = GoogleFonts.ptSans(
    fontSize: Dimens.eighteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark3 = GoogleFonts.ptSans(
    fontSize: Dimens.twenty,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyFour,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

/// A chunks of colors used
/// in the application
abstract class ColorsValue {
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(199, 61, 93, .1),
    100: Color.fromRGBO(199, 61, 93, .2),
    200: Color.fromRGBO(199, 61, 93, .3),
    300: Color.fromRGBO(199, 61, 93, .4),
    400: Color.fromRGBO(199, 61, 93, .5),
    500: Color.fromRGBO(199, 61, 93, .6),
    600: Color.fromRGBO(199, 61, 93, .7),
    700: Color.fromRGBO(199, 61, 93, .8),
    800: Color.fromRGBO(199, 61, 93, .9),
    900: Color.fromRGBO(199, 61, 93, 1),
  };

  static Color primaryColorRgb = const Color.fromRGBO(199, 61, 93, 1);

  static Color primaryColorLight1Rgbo = const Color.fromRGBO(199, 61, 93, .1);

  static Color primaryColor = Color(
    primaryColorHex,
  );

  static Color titleGreyColor = Color(
    titleGreyColorHex,
  );

  static Color backgroundColor = Colors.white;

  static int primaryColorHex = 0xFFC73D5D;

  static int titleGreyColorHex = 0xFFB2AEAE;
}
