import 'export_widgets.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  SettingsCard({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color _backColor = Theme.of(context).inputDecorationTheme.fillColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: _backColor, borderRadius: BorderRadius.circular(5)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Icon(
              icon,
                color: Theme.of(context).primaryColor
            )
            ,
            SizedBox(
              width: 20,
            )

            ,

            CustomHeaderText(
              title: title,
              fontSize: 14,
            ),

            Expanded(
              child: SizedBox(width: 1,),
            ),

            Icon(
              Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).primaryColor
            )

          ],
        ),
      ),
    );
  }
}
