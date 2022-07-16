import 'package:bells_portal/utils/utils_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetBuilder<SplashScreenController>(
     init: SplashScreenController(),
     builder: (model){
       return Scaffold(
         backgroundColor: DeggiaDarkTheme.backgroundColor,
         body: Center(
           child:  Container(
             width: 150,
             height: 100,
             decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage(AssetNames.logoImage),
                     fit: BoxFit.contain
                 )
             ),
           ),
         )
       );
     },
   );
  }
}
