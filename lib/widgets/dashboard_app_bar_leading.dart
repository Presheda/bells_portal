import 'export_widgets.dart';

class DashboardAppBarLeadingWidget extends StatelessWidget {
  final int index;
  final Function onTap;

  DashboardAppBarLeadingWidget({this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return DIconButtonWidget(
          iconData: Icons.wallet_giftcard,
          onTap: onTap,
        );

      case 1:
        return DIconButtonWidget(
          iconData: Icons.help_outline,
          onTap: onTap,
        );
    }

    return SizedBox.shrink();
  }
}
