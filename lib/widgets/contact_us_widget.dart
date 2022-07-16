import 'package:bells_portal/widgets/export_widgets.dart';

class ContactUsWidget extends StatelessWidget {

  final Function function;
  final String title, desc;
  ContactUsWidget({this.function, this.title, this.desc});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .45,
      padding: EdgeInsets.only(
        left: 20,
        right : 20,
        top: 30,
        bottom : 0
      ),
      child: SingleChildScrollView(
        physics : BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeaderText(title: title ?? "Contact Us", fontSize: 20),
            SizedBox(height: 20),
            CustomText(
                title:
                   desc ?? "If you are unable to find answers to your questions in our help desk, please send us a mail.",
                textAlign: TextAlign.center,
                maxLine: 10,
                fontSize: 14),
            SizedBox(height: 20),
            CustomHeaderText(
              title: "support@deggia.inbox.ai",
              color: Theme.of(context).accentColor,
              fontSize: 16,
            ),
            SizedBox(height: 50),
            GradientButton(title: title ?? "Contact Us", onTap : function),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
