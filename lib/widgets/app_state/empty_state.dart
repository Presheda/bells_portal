import 'package:bells_portal/utils/asset_names.dart';
import 'package:bells_portal/utils/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class DeggiaEmptyState extends StatelessWidget {
  final String image;
  final String title;

  DeggiaEmptyState({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: image != null && image.isNotEmpty,
          child: Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image ?? AssetNames.checkedIcon))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: title != null && title.isNotEmpty,
          child: CustomText(
           title : title ?? "",
            fontSize: 16,

          ),
        ),
        SizedBox(
          height: 15,
        ),
//        Text(
//          title,
//          style: TextStyle(
//            color: Theme.of(context).primaryColorLight,
//            fontWeight: FontWeight.normal,
//            fontStyle: FontStyle.normal,
//            fontSize: ScreenUtil().setSp(14, allowFontScalingSelf: true),
//          ),
//        )
      ],
    );
  }
}
