import 'package:bells_portal/widgets/export_widgets.dart';

import 'course_reg_controller.dart';

class CourseRegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseRegController>(builder: (model) {
      return CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: CustomText(
                title: "Course Registration",
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
                    title: "Welcome to  your course registration portal",
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
                    title: "Click the button to register for your courses",
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
                  onTap: model.registerCourseTap,
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
                        title: "Click to register course",
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
      );
    });
  }
}
