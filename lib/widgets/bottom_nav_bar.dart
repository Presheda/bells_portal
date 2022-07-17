import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bells_portal/utils/utils_export.dart';

import 'export_widgets.dart';

class DBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int index) onTap;

  DBottomNavBar({this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      height: 100,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      elevation: 20,
      activeIndex: index,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      // leftCornerRadius: 25,
      // rightCornerRadius: 25,
      onTap: onTap,
      itemCount: 3,
      tabBuilder: (int index, bool isActive) {
        String icon;
        String title = "Home";
        switch (index) {
          case 0:
            icon = AssetNames.portalHomeIcon;
            title = "Home";
            break;

          case 1:
            icon = AssetNames.portalRegisterCourse;
            title = "Register Course";
            break;

          case 2:
            icon = AssetNames.portalProfile;
            title = "Profile";
            break;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(icon),
              color: isActive != null && isActive ? Color(0xff444854) : Color(0xffA8A8A8),
              size: isActive != null && isActive ? 28 : 24,
            ),
            SizedBox(
              height: 8,
            ),
            CustomHeaderText(
              title: title,
              fontSize: 12,
              fontWeight: isActive != null && isActive ?  FontWeight.w600 : FontWeight.w400,
              color: isActive != null && isActive ? Color(0xff444854) : Color(0xffA8A8A8),
            )
          ],
        );
      },
      //other params
    );
  }
}
