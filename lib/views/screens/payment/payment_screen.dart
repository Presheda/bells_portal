import 'package:bells_portal/widgets/export_widgets.dart';

import 'payment_screen_controller.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentScreenController>(

        init: PaymentScreenController(),
        builder: (model) {
      return Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: CustomText(
                  title: "Pay Fees",
                  fontWeight: FontWeight.w500,
                  lineHeight: 21,
                  fontSize: 14,
                  color: Color(0xff050616)),
              centerTitle: true,
              // expandedHeight: 50,
              // collapsedHeight: 50,
              toolbarHeight: 124,
              //  backgroundColor: Colors.red,
              pinned: false,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(([
                  Center(
                    child: CustomText(
                      title: "Pay your fees with ease",
                      textAlign: TextAlign.center,
                      color: Color(0xff0E0F13),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      lineHeight: 36,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: CustomText(
                      title: "Click the icon above to view payment instruction",
                      textAlign: TextAlign.center,
                      color: Color(0xff4F4F5A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      lineHeight: 21,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: model.payFeesTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff4092D6).withOpacity(.15),
                      ),
                      child: Center(
                        child: CustomText(
                          title: "Click to pay fees",
                          color: Color(0xff4092D6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ])),
              ),
            )
          ],
        ),
      );
    });
  }
}
