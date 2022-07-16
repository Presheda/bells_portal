import 'export_widgets.dart';

class WalletActionCard extends StatelessWidget {

  final String image;
 final String title;
 final  String des;
 final IconData iconData;
 final Function action;
 final Color color;
 final  Color desColor;
  final  Color iconColor;
 final Color titleColor;
 final int index;
 final String titleTwo;


 WalletActionCard({this.title, this.index, this.iconColor, this.titleTwo, this.des, this.iconData, this.action, this.color, this.image,
      this.desColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right:20,
          top: 36,

        ),
      //  margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(.36)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            ImageIcon(
              AssetImage(image),
              size: 32,
              color:  iconColor,
            ),


            SizedBox(
              height: 40,
            ),

            CustomHeaderText(
              title: title,
              fontSize: 18,
            ),
            SizedBox(
              height: 5,
            ),
            CustomHeaderText(
              title: titleTwo,
              fontSize: 18,
            ),

            SizedBox(
              height: 5,
            ),
            CustomText(
              color: index == 3 ? Theme.of(context).errorColor : null,
              title: des,
              maxLine: 1,
              fontSize: 14,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
