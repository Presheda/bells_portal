import 'export_widgets.dart';

class DropCustomTextField extends StatelessWidget {
  final String value;
  final String hint;
  final IconData icon;
  final Function tap;

  DropCustomTextField({this.value, this.hint, this.tap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).inputDecorationTheme.fillColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              value == null || value.isEmpty
                  ? Expanded(
                    child: CustomText(
                        title: value == null || value.isEmpty ? hint : value,
                        fontSize: 16,
                        maxLine: 1,
                      ),
                  )
                  : Expanded(
                    child: CustomText(
                        title: value == null || value.isEmpty ? hint : value,
                        fontSize: 16,
                        maxLine: 1,
                      ),
                  ),
              Icon(
                icon,
                color: Theme.of(context).appBarTheme.iconTheme.color,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
