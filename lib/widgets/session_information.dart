import 'export_widgets.dart';

class SessionInformation extends StatelessWidget {
  final String currentSession;

  final String registrationStatus;

  final String tuitionStatus;

  final String currentSemester;

  SessionInformation(
      {this.currentSession,
      this.registrationStatus,
      this.tuitionStatus,
      this.currentSemester});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
    //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            title: "Session Information",
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline6.color,
            lineHeight: 24,
            fontSize: 16,
          ),
          SizedBox(
            height: 28,
          ),
          _rowWidget(
            title: "Current Session",
            value: currentSession,
          ),
          SizedBox(
            height: 28,
          ),
          _rowWidget(
            title: "Registration Status",
            value: registrationStatus,
          ),
          SizedBox(
            height: 28,
          ),
          _rowWidget(
            title: "Tuition Status",
            value: tuitionStatus,
          ),
          SizedBox(
            height: 28,
          ),
          _rowWidget(
            title: "Semester",
            value: currentSemester,
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}



class _rowWidget extends StatelessWidget {
  final String title;
  final String value;

  _rowWidget({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title: title,
          lineHeight: 18,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: CustomText(
            title: value,
            lineHeight: 21,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.end,
            fontSize: 12,
            color: Theme.of(context).textTheme.headline6.color,
            maxLine: 1,
          ),
        ),
      ],
    );
  }
}
