import 'package:bells_portal/Services/dNavigationService.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class PaymentScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();

  List<String> sessionList = ["2021/2022", "2022/2023"];
  List<String> semesterList = ["500 First semester", "500 Second semester"];

  String selectedSession = "Selected session";

  String selectedLevel = "Selected level";

  @override
  void onInit() {
    // selectedSession = sessionList[0];
    super.onInit();
  }

  void payFeesTap() {
    _navigationService.goToNamed(name: RouteName.payment_screen_session);
  }

  sessionSelected({String name}) {
    selectedSession = name;

    update();
  }

  semesterSelected({String name}) {
    selectedLevel = name;

    update();
  }

  bool isSessionSelected() {
    return selectedSession.toLowerCase() != "selected session".toLowerCase();
  }

  bool isLevelSelected() {
    return selectedLevel.toLowerCase() != "selected level".toLowerCase();
  }

  getInfoTitle() {
    return "You are to select an available session as appropriate. Please register early before closing date.";
  }

  proceedTaped() async {
    print("${isLevelSelected() }" "${isSessionSelected()}");

    print("${selectedLevel} ${selectedSession}");

    if (!isSessionSelected() || !isLevelSelected()) {
       CustomSnackBar.errorSnackBar(
          title: "Please select level or session");

       return;
    }



    loadDialog(title: "Paying Fees", dismiss: false);

    await Future.delayed(Duration(milliseconds: 1500));

    _navigationService.offUntil(name: RouteName.user_dashboard);

    CustomSnackBar.successSnackBar(title: "Fees Completed");


  }
}
