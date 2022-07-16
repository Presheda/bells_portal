import 'export_widgets.dart';
class CustomCircleAvatar extends StatelessWidget {

  final double radius;
  final Color backgroundColor;
  final Widget child;



  CustomCircleAvatar({this.radius, this.backgroundColor, this.child});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: child,

    );
  }
}
