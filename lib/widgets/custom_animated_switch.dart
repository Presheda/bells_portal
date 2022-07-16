import 'export_widgets.dart';

class CustomAnimatedSwitch extends StatelessWidget {


  final bool lightMode;


  CustomAnimatedSwitch({this.lightMode});

  @override
  Widget build(BuildContext context) {

    return AnimatedCrossFade(
      firstCurve: Curves.easeIn,
     sizeCurve: Curves.easeIn,

      secondCurve: Curves.easeIn,

      duration: Duration(milliseconds: 500),
      firstChild: Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 6.6,
                backgroundColor: Color(0xffEDF8F2),
              ),
            ],
          ),
        ),
      ),
      crossFadeState: lightMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      secondChild: Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.21),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 6.6,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
