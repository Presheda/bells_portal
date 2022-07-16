import 'dart:io';

import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/cupertino.dart';

Future<bool> customNativeDialog({String message, BuildContext context}) async {
  var text = CustomText(title: message, fontSize: 14, isNaira: true);


  var _yesButton =  CustomText (title: 'YES', fontSize: 12, color: DeggiaDarkTheme.Blue);
  var _noButton =  CustomText (title: 'No', fontSize: 12, color: Theme.of(context).errorColor,);


  var dialog = Platform.isIOS
      ? new CupertinoAlertDialog(
          content: text,
          actions: <Widget>[
            new CupertinoDialogAction(
              child:  _yesButton,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, true); // Returning true to
                // _onWillPop will pop again.
              },
            ),
            new CupertinoDialogAction(
              child:  _noButton,
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context,
                    false); // Pops the confirmation dialog but not the page.
              },
            ),
          ],
        )
      : new AlertDialog(
          content: text,
          actions: <Widget>[
            new TextButton(
                child:  _noButton,
                onPressed: () {
                  Navigator.of(context).pop(
                      false); // Pops the confirmation dialog but not the page.
                }),
            new TextButton(
                child:  _yesButton,
                onPressed: () {
                  Navigator.of(context).pop(
                      true); // Returning true to _onWillPop will pop again.
                })
          ],
        );



  bool exit = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) => dialog,
  ) ??
       false;
  return exit;

}
