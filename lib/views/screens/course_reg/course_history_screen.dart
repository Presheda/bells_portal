import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'course_history_screen_controller.dart';

class CourseHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseHistoryScreenController>(
        init: CourseHistoryScreenController(),
        builder: (model) {
          return Scaffold(
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, color: Color(0xff050616)),
                  ),

                  title: CustomText(
                      title: "Registration History",
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
                  sliver: model.appState == DeggiaAppState.Idle
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate((c, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: CourseHistoryWidget(
                                  onTap: () {
                                    model.selectCourse(
                                        courseHistory:
                                            model.courseHistory[index]);
                                  },
                                  courseHistory: model.courseHistory[index]),
                            );
                          }, childCount: model.courseHistory.length),
                        )
                      : SliverFillRemaining(
                          child: Center(
                            child: DeggiaAppStateWidget(
                              appState: model.appState,
                              emptyState: DeggiaEmptyState(
                                title: "No Data Yet",
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          );
        });
  }
}
