import 'package:bells_portal/utils/utils_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class ScaffoldBackground extends StatelessWidget {

 final Widget child;

 final double opacity;

 ScaffoldBackground({ @required this.child, this.opacity});

 @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      Opacity(
        opacity: opacity ?? 0.05,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetNames.backgroundImage))),
        ),
      ),
      child,
    ]);
  }
}
