import 'export_widgets.dart';

class GeneralSliverAppBar extends StatelessWidget {

  final String title;
  final Widget leading;
  final Widget action;
  final Color backgroundColor;
  final bool pinned;

  GeneralSliverAppBar({@required this.title, this.leading, this.action, this.backgroundColor, this.pinned});

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
      automaticallyImplyLeading: false,

      backgroundColor: backgroundColor,
      pinned: pinned == null ? true : pinned,
      flexibleSpace: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           leading ?? SizedBox.shrink(),
            CustomText(
              title: title,
              fontSize: 16,
            ),
          action??  SizedBox.shrink(),
          ],
        ),
      ),
      centerTitle: true,
      expandedHeight: 100,
      collapsedHeight: 100,
    );
  }
}
