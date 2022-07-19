import 'package:expandable/expandable.dart';

import 'export_widgets.dart';

class SelectCourseWidget extends StatelessWidget {
  final List<String> nameList;
  final String title;
  final Function({String name}) onTap;
  final bool isSelected;

  SelectCourseWidget({this.nameList, this.onTap, this.title, this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color _backColor = isSelected
        ? Theme.of(context).inputDecorationTheme.fillColor
        : Theme.of(context).primaryColor.withOpacity(.15);

    Color _borderColor = isSelected
        ? Theme.of(context).inputDecorationTheme.fillColor
        : Theme.of(context).primaryColor;

    Color _textColor = isSelected
        ? null
        : Color(0xff88888F);



    return Container(
      decoration: BoxDecoration(
        //  color: Theme.of(context).primaryColor.withOpacity(.15),
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            backColor: _backColor,
            borderRadius: BorderRadius.circular(5),
            inkWellBorderRadius: BorderRadius.circular(5),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            useInkWell: false,
            iconColor: Color(0xff0E0F13)),
        header: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
            child: CustomText(
              title: title ?? "Nothing selected",
              fontSize: 12,
              color: _textColor
            )),
        expanded: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: nameList.map((e) {
                return InkWell(
                  onTap: () {
                    onTap(name: e);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomText(
                        title: e,
                        color: Theme.of(context).textTheme.headline6.color,
                        fontSize: 14),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
