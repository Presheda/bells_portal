
import 'package:bells_portal/utils/constant_string.dart';
import 'package:bells_portal/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetConnection extends StatelessWidget {
  final Function function;

  NoInternetConnection({this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100.w,
          height: 100.w,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(AssetNames.logoImage))),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Please check your internet connection",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        Container(
          width: 100.w,
          child: RaisedButton(onPressed: (){
            function();
          }, color: DeggiaLightTheme.primaryColorLight,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: Text(
              "Retry",
              style: TextStyle(color: Colors.white,

                  fontSize: ScreenUtil().setSp(13, allowFontScalingSelf: true)
              ),
            ),),
          ),
        ),

      ],
    );
  }
}
