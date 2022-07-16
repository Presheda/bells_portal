import 'export_widgets.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color firstColor;
  final Color secondColor;


  GradientButton({this.title, this.onTap, this.firstColor, this.secondColor});

  @override
  Widget build(BuildContext context) {
    //
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     height: 55,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       gradient: LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [firstColor ?? Color(0xff46B97F), secondColor ?? Color(0xff46B97F)])
    //     ),
    //     child: Center(
    //       child: CustomHeaderText(
    //         title: title,
    //         color: Colors.white,
    //         fontWeight: FontWeight.w500,
    //         fontSize: 18,
    //       ),
    //     ),
    //   ),
    // );


  return  ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(Get.width, 55)),
          backgroundColor:
          MaterialStateProperty.all(
             firstColor ?? Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(5)),
          )),
      child: Center(
        child: CustomText(
          title: title,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );


  }
}
