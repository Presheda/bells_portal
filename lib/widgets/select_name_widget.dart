import 'package:expandable/expandable.dart';

import 'export_widgets.dart';
class SelectNameWidget extends StatelessWidget {

final  List<String> nameList;
final String title;
final Function({String name}) onTap;

SelectNameWidget ({this.nameList, this.onTap, this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color : Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius : BorderRadius.circular(5),
      ),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            backColor: Theme.of(context).inputDecorationTheme.fillColor,
            inkWellBorderRadius: BorderRadius.circular(5),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            useInkWell: false,
            iconColor: Theme.of(context).appBarTheme.iconTheme.color),
        header: Padding(
          padding:
          const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
          child:  CustomText(title: title ?? "Nothing selected",
              fontSize: 14
          )
        ),
        expanded: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical : 16
          ),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.start,
            crossAxisAlignment : CrossAxisAlignment.start,
            children: nameList.map((e) {

             return InkWell(
               onTap : (){
                 onTap(name : e);
               },
               child: Padding(
                 padding: const EdgeInsets.symmetric(
                   vertical : 10
                 ),
                 child: CustomText(title: e,
                  color: Theme.of(context).textTheme.headline6.color,
                   fontSize: 14
                  ),
               ),
             );
            }).toList()
          ),
        ),
      ),
    );
  }
}
