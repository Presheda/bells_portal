
import 'export_widgets.dart';
import 'package:get/get.dart';


Future<void> loadDialog({String title, bool dismiss}){



  Get.to(LoadingScreen(title: title,),
      opaque: false,
      fullscreenDialog: true,
      transition: Transition.fadeIn
  );
}