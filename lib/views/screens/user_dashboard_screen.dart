import 'dart:io';

import 'package:bells_portal/views/controllers/export_controller.dart';
import 'package:bells_portal/views/screens/course_reg/course_reg_page.dart';

import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:upgrader/upgrader.dart';
import 'export_screens.dart';
import 'profile/profile_page.dart';

class UserDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDashboardController>(
        init: UserDashboardController(),
        builder: (model) {
          return Scaffold(
              body: UpgradeAlert(
                upgrader: Upgrader(
                  dialogStyle: Platform.isIOS
                      ? UpgradeDialogStyle.cupertino
                      : UpgradeDialogStyle.material,
                  durationUntilAlertAgain: Duration(hours: 5),
                  showIgnore: false,
                  onLater: () {
                    return true;
                  },
                ),
                child: _UserDashboardMobile(
                  model: model,
                ),
              ),
              bottomNavigationBar: DBottomNavBar(
                index: model.currentIndex,
                onTap: model.bItemTapped,
              ));
        });
  }
}

class _UserDashboardMobile extends StatelessWidget {
  final UserDashboardController model;

  _UserDashboardMobile({this.model});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: model.currentIndex,
      children: [
        HomePage(),
        CourseRegPage(),
        ProfilePage(),
      ],
    );
  }
}

class _UserDashboardTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: Get.width,
      height: Get.height,
    );
  }
}
