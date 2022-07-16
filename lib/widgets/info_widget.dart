import 'export_widgets.dart';

class InfoWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final EdgeInsets padding;

  InfoWidget({this.icon, this.title, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.help_outline,
              color: Theme.of(context).appBarTheme.iconTheme.color,
            ),
            SizedBox(
              width: 13,
            ),
            CustomText(
              //     fontStyle: FontStyle.italic,
              fontSize: 12,
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}
