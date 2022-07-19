import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'export_widgets.dart';

class FinancialInfoWidget extends StatelessWidget {
  final Function onTap;

  FinancialInfoWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        decoration: BoxDecoration(
            color: Color(0xff0B0D0C), borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: ImageIcon(
                AssetImage(AssetNames.nairaIcon),
                color: Color(0xff0B0D0C),
                size: 10,
              ),
            ),
            SizedBox(
              width: 14.5,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: "Click here to view your ",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0xffEAEAEA),
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: "financial status",
                        recognizer:  TapGestureRecognizer()..onTap = onTap,
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xffEAEAEA),
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}
