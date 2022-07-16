import 'export_widgets.dart';

class CustomRatingToggleButton extends StatelessWidget {
  final bool yes;
  Function onTap;
  String title;

  CustomRatingToggleButton({this.yes = true, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(
                color: yes
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                width: 2),
            borderRadius: BorderRadius.circular(5),
            color: yes ? Theme.of(context).primaryColor.withOpacity(.2) : null),
        child: CustomText(
          title: title,
          fontSize: 18,
          textAlign: TextAlign.center,
          color: yes ? Theme.of(context).primaryColor : null,
        ),
      ),
    );
  }
}
