import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class StudentBioDataCard extends StatelessWidget {
  final UserData userData;

  StudentBioDataCard({this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0),

            // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _StudentSubBioData(
            title: "Matriculation Number",
            value: userData.matric,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffE1E3ED),
            ),
          ),
          _StudentSubBioData(
            title: "Full Name",
            value: "${userData.firstName} ${userData.lastName}",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffE1E3ED),
            ),
          ),
          _StudentSubBioData(
            title: "Level",
            value: userData.level,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffE1E3ED),
            ),
          ),
          _StudentSubBioData(
            title: "Department",
            value: userData.department,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffE1E3ED),
            ),
          ),
          _StudentSubBioData(
            title: "Porgram",
            value: userData.program,
          ),
        ],
      ),
    );
  }
}

class _StudentSubBioData extends StatelessWidget {
  final String title;
  final String value;

  _StudentSubBioData({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title: title,
          lineHeight: 21,
          fontWeight: FontWeight.w500,
          fontSize: 14,
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
            fontSize: 14,
            color: Theme.of(context).textTheme.headline6.color,
            maxLine: 1,
          ),
        ),
      ],
    );
  }
}
