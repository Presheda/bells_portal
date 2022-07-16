import 'export_widgets.dart';

///reusable icon button
class DIconButtonWidget extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final Color color;

  DIconButtonWidget({this.onTap, this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: color ?? Theme.of(context).appBarTheme.iconTheme.color,
      ),
      onPressed: onTap,
    );
  }
}
