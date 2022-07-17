import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DeggiaLightTheme {
  static const Color Blue = Color(0xff6678ff);
  static const Color greyBackgroundColor = Color(0xffEFEFEF);
  static const Color primaryColorLight = Color(0xff4092D6);
  static const Color errorColor = Color(0xffFF4D42);


  //body color
  static const Color textColorDark = Color(0xff82928B);


  static const Color textColorLight = Color(0xff919099);


  static const Color accentColor = Color(0xffEBA41D);
  static const backgroundColor = Colors.white;

  //text field color
  static const Color textFieldFilledColor = Color(0xffF2F2F2);

  static const Color textFieldLabelColor = Color(0xff808080);

  static const Color headerTextColor = Color(0xff0E0F13);

  ///-- empty cardLoader colors
  /// defaults it for headline 2 and 3
  static const Color headLine2Color = Color(0xffD2D5D3);
  static const Color headLine3Color = Color(0xffF2F2F2);

  static ThemeData appLightTheme() {
    return ThemeData.light().copyWith(



        primaryTextTheme: TextTheme(
            bodyText1: TextStyle(color: primaryColorLight),
            headline6: TextStyle(
              color: headerTextColor,
            ),
            headline2: TextStyle(
              color: headLine2Color,
            ),
            headline3: TextStyle(
              color: headLine3Color,
            ),

        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: greyBackgroundColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorLight,
        ),
        dividerTheme: DividerThemeData(),
        dialogTheme:
            DialogTheme(contentTextStyle: TextStyle(color: textColorDark)),
        primaryColor: primaryColorLight,
        scaffoldBackgroundColor: backgroundColor,
        errorColor: errorColor,
        backgroundColor: greyBackgroundColor,
        accentColor: accentColor,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(color: textColorDark),
          bodyText2: GoogleFonts.poppins(color: textColorDark),
          headline2: TextStyle(
            color: headLine2Color,
          ),
          headline3: TextStyle(
            color: headLine3Color,
          ),
          headline5: TextStyle(color: headerTextColor),
          headline6: TextStyle(
            fontFamily: "ITCAVANT", fontWeight: FontWeight.w700,
              color: headerTextColor,  fontSize: 24),
        ),
        primaryColorLight: textColorLight,
        primaryColorDark: textColorDark,
        tabBarTheme: TabBarTheme(labelStyle: TextStyle(color: textColorDark)),
        iconTheme: IconThemeData(color: Colors.black),


        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          color: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(color: textColorDark),
            headline2: TextStyle(color: textColorDark),
            headline3: TextStyle(color: textColorDark),
            headline4: TextStyle(color: textColorDark),
            headline5: TextStyle(color: Color(0xff0B0D0C)),
            headline6: TextStyle(
                color: Color(0xff0E0F13), fontWeight: FontWeight.bold, fontSize: 20),
          ),
          iconTheme: IconThemeData(color: Color(0xffBFBFBF)),
          actionsIconTheme: IconThemeData(color: Color(0xffBFBFBF)),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColorLight,
          unselectedItemColor: Color(0xffE7E4E4)
        ),


        disabledColor: Color(0xffA1A1A1),

        inputDecorationTheme: InputDecorationTheme(

            fillColor:   textFieldFilledColor,
            labelStyle: TextStyle(
                fontSize: 14,
                color: textFieldLabelColor)));
  }
}
