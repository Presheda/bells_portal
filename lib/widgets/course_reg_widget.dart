import 'package:bells_portal/DataModel/course_reg_data.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseRegWidget extends StatelessWidget {
  final CourseRegData course;
  final bool isChecked;
  final Function onTap;

  CourseRegWidget({this.course, this.isChecked, this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData _iconData = isChecked != null && isChecked
        ? Icons.check_circle_outlined
        : Icons.radio_button_off;

    Color _iconColor =
        isChecked != null && isChecked ? Color(0xff4092D6) : Color(0xffC6C8C7);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _iconData,
              size: 14,
              color: _iconColor,
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  title: course.courseTitle,
                  lineHeight: 24,
                  fontSize: 14,
                  color: Color(0xff101211),
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    CustomText(
                      title: "${course.courseCode}",
                      lineHeight: 16,
                      fontSize: 11,
                      color: Color(0xff6E717C),
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      title: " : ${course.courseUnit} Units",
                      lineHeight: 16,
                      fontSize: 11,
                      color: Color(0xff09090F),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            CustomText(
              title: "Status: ${course.courseStatus}",
              lineHeight: 18,
              fontSize: 12,
              color: Color(0xff101211),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
