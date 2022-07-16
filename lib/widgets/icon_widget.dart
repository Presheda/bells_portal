import 'export_widgets.dart';

class DIconWidget extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final Color color;
  final Color splashColor;

  DIconWidget({this.iconData, this.onPressed, this.color, this.splashColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
      splashColor: splashColor,
      color: color ?? Theme.of(context).appBarTheme.iconTheme.color,
    );
  }
}
