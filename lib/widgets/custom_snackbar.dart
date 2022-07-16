import 'export_widgets.dart';

class CustomSnackBar {
  static errorSnackBar({String title, String message}) {


    if(Get.isSnackbarOpen) return;

    Get.snackbar(
      null,
        null,
        backgroundColor: Get.theme.errorColor,
        messageText: CustomText(
          fontSize: 18,
          title: title,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 25, top: 25));
  }

  static topSuccessSnackBar({String title}){



    if(Get.isSnackbarOpen) return;

    Get.snackbar(
        null,
      null,
        backgroundColor: Get.theme.primaryColor,
        messageText: CustomText(
          fontSize: 18,
          title: title,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 25, top: 25)
    );

  }

  static successSnackBar({String title, String message}) {


    if(Get.isSnackbarOpen) return;

    Get.snackbar(
      null,
        null,

        backgroundColor: Get.theme.primaryColor,
        messageText: CustomText(
          fontSize: 18,
          title: title,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 25, top: 25));
  }
}
