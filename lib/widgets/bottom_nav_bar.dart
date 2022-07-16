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
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      onTap: onTap,
      itemCount: 4,
      tabBuilder: (int index, bool isActive) {
        IconData icon;
        switch (index) {
          case 0:
            icon = Icons.home;
            break;

          case 1:
            icon = Icons.account_balance_wallet_rounded;
            break;

          case 2:
            icon = Icons.history;
            break;

          case 3:
            icon = Icons.settings;
            break;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive != null && isActive
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor,
              size: isActive != null && isActive ? 28 : 24,
            ),
          ],
        );
      },
      //other params
    );
  }
}
