import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeggiaDarkTheme {

  static const Color Blue = Color(0xff6678ff);
  static const Color greyBackgroundColor =Color(0xff141917);
  static const Color primaryColorLight = Color(0xffB08B51);
  static const Color errorColor = Color(0xffFF4D42);


  //body color
  static const Color textColorDark = Color(0xffA1A1A1);




  static const Color accentColor = Color(0xffD0B871);
  static const backgroundColor = Color(0xff020202);

  //text field color
  static const Color textFieldFilledColor = Color(0xff232D28);

  static const Color textFieldLabelColor = Color(0xff808080);

  static const Color headerTextColor = Color(0xffEDF8F2);

  ///-- empty cardLoader colors
  /// defaults it for headline 2 and 3
  static const Color headLine2Color = Color(0xff232D28);
  static const Color headLine3Color = Color(0xff394741);




  static ThemeData appDarkTheme() {
    return ThemeData.dark().copyWith(
      dialogBackgroundColor: backgroundColor,
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
        primaryColorDark: textColorDark,
        tabBarTheme: TabBarTheme(labelStyle: TextStyle(color: textColorDark)),
        iconTheme: IconThemeData(color: Colors.black),


        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.dark,
          color: backgroundColor,
          textTheme: TextTheme(
            headline1: TextStyle(color: textColorDark),
            headline2: TextStyle(color: textColorDark),
            headline3: TextStyle(color: textColorDark),
            headline4: TextStyle(color: textColorDark),
            headline5: TextStyle(color: textColorDark),
            headline6: TextStyle(
                color: textColorDark, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          iconTheme: IconThemeData(color: Color(0xffD2D5D3)),
          actionsIconTheme: IconThemeData(color: Color(0xffD2D5D3)),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff394741),
            selectedItemColor: Color(0xffEDF8F2),
            unselectedItemColor: Color(0xff808080)
        ),


        disabledColor: Color(0xffA1A1A1),

        inputDecorationTheme: InputDecorationTheme(
            fillColor:   textFieldFilledColor,
            labelStyle: TextStyle(
                fontSize: 14,
                color: textFieldLabelColor)));
  }
}
