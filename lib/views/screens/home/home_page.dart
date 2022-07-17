import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      //     init: HomePageController(),
      autoRemove: false,
      builder: (model) {
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(([
                SizedBox(
                  height: 74,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: model.getTimeOfDay(),
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff0B0D0C),
                          ),
                          CustomHeaderText(
                            title: model.getUserName(),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0B0D0C),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage(AssetNames.portalNameIcon),
                          color: Color(0xff0B0D0C),
                        ))
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                FinancialInfoWidget(
                  onTap: model.financialWidgetTap,
                ),
                SizedBox(
                  height: 24,
                ),
              ]))),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((c, index) {
                    String image;
                    String title;
                    String titleValue;
                    String subTitle;
                    String subTileValue;

                    Color cardColor;
                    Color imageColor;
                    Color imageBackColor;

                    switch (index) {
                      case 0:
                        title = "Current Session";
                        titleValue = model.getCurrentSession();

                        subTitle = "Reg Status";
                        subTileValue = model.getCourseRegStatus();
                        image = AssetNames.portalGraduationCapIcon;

                        imageColor = Color(0xff4092D6);
                        cardColor = Color(0xffF3FAFF);
                        imageBackColor = Color(0xffC6E6FC);

                        break;

                      case 1:
                        title = "Current Semester";
                        titleValue = model.getCurrentSemester();

                        subTitle = "Course Reg";
                        subTileValue = model.getStudentCourseRegStatus();
                        image = AssetNames.portalGraduationCapIcon;

                        imageColor = Color(0xff409049);
                        cardColor = Color(0xffF2FFF4);
                        imageBackColor = Color(0xffDAFFDF);

                        break;
                    }

                    return SessionCourseRegCard(
                      title: title,
                      titleValue: titleValue,
                      subTitle: subTitle,
                      subTileValue: subTileValue,
                      image: image,
                      imageColor: imageColor,
                      cardColor: cardColor,
                      imageBackColor: imageBackColor,
                    );
                  }, childCount: 2),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20)),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(([

                  SizedBox(
                    height: 20,
                  ),


                  CustomText(
                    title: "Student Biodata",
                    color: Theme.of(context).textTheme.headline5.color,
                    fontSize: 14,
                    maxLine: 1,
                    fontWeight: FontWeight.w700,
                    lineHeight: 20,
                  ),

                  CustomText(
                    title: "This is a brief biodata of yourself",
                    fontSize: 12,
                    maxLine: 1,
                    fontWeight: FontWeight.w400,
                    lineHeight: 20,
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  StudentBioDataCard(
                    userData : model.userData
                  ),



                ])),
              )
            )
          ],
        );
      },
    );
  }
}
