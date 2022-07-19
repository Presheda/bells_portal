import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:bells_portal/widgets/select_course_widget.dart';

import 'payment_screen_controller.dart';

class PaymentScreenSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentScreenController>(builder: (model) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close, color: Color(0xff050616)),
              ),

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
                  CustomText(
                    title: "Pay fees",
                    color: Color(0xff0E0F13),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    lineHeight: 36,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    title: "Click the icon above to view payment instruction",
                    color: Color(0xff4F4F5A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    lineHeight: 21,
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  CustomText(
                    title: "Select session",
                    color: Theme.of(context).textTheme.headline6.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    lineHeight: 21,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SelectCourseWidget(
                    isSelected: model.isSessionSelected(),
                    nameList: model.sessionList,
                    title: model.selectedSession,
                    onTap: model.sessionSelected,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(
                    title: "Select level",
                    color: Theme.of(context).textTheme.headline6.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    lineHeight: 21,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SelectCourseWidget(
                    isSelected: model.isLevelSelected(),
                    nameList: model.semesterList,
                    title: model.selectedLevel,
                    onTap: model.semesterSelected,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Visibility(
                      visible:
                          model.isSessionSelected() && model.isLevelSelected(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Amount",
                            color: Theme.of(context).textTheme.headline6.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            lineHeight: 21,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                                //  color: Theme.of(context).primaryColor.withOpacity(.15),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.15)),
                            child: Row(
                              children: [
                                CustomText(
                                    title: "N365,000",
                                    textAlign: TextAlign.start,
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .color),
                              ],
                            ),
                          )
                        ],
                      ))
                ])),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(([
                    SizedBox(
                      height: 70,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .iconTheme
                                      .color,
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: CustomText(
                                    //     fontStyle: FontStyle.italic,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    lineHeight: 20,
                                    title: model.getInfoTitle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        GradientButton(
                          title: "Confirm Pay",
                          onTap: model.proceedTaped,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ])),
                ))
          ],
        ),
      );
    });
  }
}
