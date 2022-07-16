
import 'package:bells_portal/widgets/export_widgets.dart';

class CheckEmailScreen extends StatelessWidget {

  final String  title;
 final String message;


  CheckEmailScreen({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScaffoldBackground(
        child: CustomScrollView(
          slivers: [


            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage(AssetNames.checkMailImage))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomHeaderText(
                      title: title,
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    CustomText(
                      title: message,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                    ),



                  ],
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
