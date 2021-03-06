import 'package:google_fonts/google_fonts.dart';

import 'export_widgets.dart';

class CustomText extends StatelessWidget {
  final String title;

  final double fontSize;
  final Color color;
  final int maxLine;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool isNaira;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final double lineHeight;
  final double letterSpacing;


  CustomText(
      {this.color,
      this.title,
      this.maxLine,
      this.fontSize,
      this.fontFamily,
        this.isNaira,
        this.textAlign,
        this.lineHeight,
        this.fontStyle,
        this.letterSpacing,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ?? 3,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,

      style: isNaira != null && isNaira ? GoogleFonts.roboto(
          letterSpacing: letterSpacing,
          fontSize: fontSize ?? 10,
          fontWeight: fontWeight ?? FontWeight.w600,
          height: _calculateLineHeight(fontSize ?? 14, lineHeight),
          color: color ?? Theme.of(context).textTheme.bodyText1.color,
        fontStyle: fontStyle
      ) : GoogleFonts.poppins(
          letterSpacing: letterSpacing,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 10,
        fontStyle: fontStyle,
          height: _calculateLineHeight(fontSize ?? 14, lineHeight),
          color: color ?? Theme.of(context).textTheme.bodyText1.color),

    );
  }

  _calculateLineHeight(double d, double lineHeight) {
    if(lineHeight == null || d == null) return null;

    return lineHeight / fontSize;
  }
}

class CustomHeaderText extends StatelessWidget {
  final String title;

  final double fontSize;
  final Color color;
  final int maxLine;
  final String fontFamily;
  final FontWeight fontWeight;
  final double lineHeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;

  CustomHeaderText(
      {this.color,
      this.title,
      this.maxLine,
      this.fontSize,
      this.fontFamily,
        this.lineHeight,
        this.textAlign,
        this.fontStyle,
        this.textDecoration,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        decoration: textDecoration,
        letterSpacing: -0.25,
        fontSize: fontSize ?? 10,
        //fontFamily: "ITCAVANT",
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: fontStyle,
        height: _calculateLineHeight(fontSize ?? 14, lineHeight),
        color: color ?? Theme.of(context).textTheme.headline6.color,
      ),
    );
  }

  _calculateLineHeight(double d, double lineHeight) {
    if(lineHeight == null) return null;

    return lineHeight / d;
  }
}
