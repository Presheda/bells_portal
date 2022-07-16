import 'package:bells_portal/widgets/export_widgets.dart';

class CustomCircleImage extends StatelessWidget {

  final String image;


  CustomCircleImage({this.image});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 164,
      height: 164,
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        shape : BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 45,
          left: 26,
          right: 26,
          bottom: 44
        ),
        child: Image.asset(image)
      ),
    );
  }
}
