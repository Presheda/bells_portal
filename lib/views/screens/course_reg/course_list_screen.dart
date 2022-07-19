import 'package:bells_portal/views/screens/course_reg/course_list_screen_controller.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseListScreenController>(
        init: CourseListScreenController(),
        builder: (model) {
          return Scaffold(
            body: SlidingUpPanel(
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
                ],
              ),
              maxHeight: 150,
              minHeight: 150,
              panel: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                              color:
                                  Theme.of(context).appBarTheme.iconTheme.color,
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
                      title: "Proceed",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
