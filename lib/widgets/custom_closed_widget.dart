import 'export_widgets.dart';

class CustomClosedWidget extends StatelessWidget {
  final Widget child;
  final bool deleteState;
  final double iconSize;
  final Function onTap;

  CustomClosedWidget(
      {@required this.child, @required this.deleteState, this.onTap, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: deleteState != null && deleteState ? 5 : 1,
          ),
          child: child,
        ),
        Visibility(
          visible: deleteState ?? false,
          child: Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                  backgroundColor: Theme.of(context).errorColor,
                  radius: iconSize ?? 11,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: iconSize ?? 12,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
