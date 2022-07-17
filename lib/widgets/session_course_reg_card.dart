import 'export_widgets.dart';

class SessionCourseRegCard extends StatelessWidget {
  String image;
  String title;
  String titleValue;
  String subTitle;
  String subTileValue;

  Color cardColor;
  Color imageColor;
  Color imageBackColor;

  Function onTap;

  SessionCourseRegCard(
      {this.image,
      this.title,
      this.titleValue,
      this.subTitle,
      this.subTileValue,
      this.cardColor,
        this.onTap,
      this.imageColor,
      this.imageBackColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: imageBackColor,
                shape: BoxShape.circle,
              ),
              child: ImageIcon(
                AssetImage(image),
                color: imageColor,
                size: 25,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              title: title,
              color: Theme.of(context).textTheme.headline5.color,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              lineHeight: 20,
            ),
            CustomText(
              title: titleValue,
              color: Theme.of(context).textTheme.headline5.color,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              lineHeight: 20,
            ),
            SizedBox(
              height: 16,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  title: "${subTitle }:",
                  color: Theme.of(context).textTheme.headline5.color,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  lineHeight: 20,
                ),

                SizedBox(
                  width: 5,
                ),

                Expanded(
                  child: CustomText(
                    title: subTileValue,
                    color: Theme.of(context).textTheme.headline5.color,
                    fontSize: 11,
                    maxLine: 1,
                    fontWeight: FontWeight.w600,
                    lineHeight: 20,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
