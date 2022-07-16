
import 'package:bells_portal/utils/utils_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/material.dart';

class LoadFailed extends StatelessWidget {
  final Function function;
  final String description;

  LoadFailed({this.function, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        CustomHeaderText(
        title: description == null ? "Could not fetch data. " : description,
          fontSize: 18,
        ),

        SizedBox(
          height: 20,
        ),

        Container(
          width: 100,
          child: RaisedButton(
            key: Key("load_failed_refresh"),
            onPressed: (){
            function();
          }, color: DeggiaLightTheme.primaryColorLight,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: CustomText(
            title:  "Retry",
              color: Colors.white,
              fontSize: 14,
            ),),
          ),
        ),

      ],
    );
  }
}
