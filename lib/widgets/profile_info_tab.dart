import 'package:bells_portal/DataModel/model_export.dart';

import 'export_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileInfoTab extends StatelessWidget {
  final UserData userData;

  ProfileInfoTab({this.userData});

  @override
  Widget build(BuildContext context) {
    String url =
        "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
              child: Container(
            height: 90,
            width: 90,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Color(0xff000000)),
            ),
            //  padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(url))),
              ),
            ),
          )),
          SizedBox(
            height: 30,
          ),
          ProfileCustomWidget(
            title: "FullName",
            value: "${userData.firstName} ${userData.lastName}",
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Matric. No",
            value: userData.matric,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Marital Status",
            value: userData.maritalStatus,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Religion",
            value: userData.religion,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Genotype",
            value: userData.genotype,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Blood group",
            value: userData.bloodGroup,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class ResidentialInfoTab extends StatelessWidget {
  final UserData userData;

  ResidentialInfoTab({this.userData});

  @override
  Widget build(BuildContext context) {
    String url =
        "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ProfileCustomWidget(
            title: "L.G.A",
            value: "${userData.lga}",
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "State of origin",
            value: userData.state,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Nationality",
            value: userData.nationality,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Religion",
            value: userData.religion,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Contact Address",
            value: userData.contactAddress,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Full Name",
            value: "${userData.firstName} ${userData.lastName}",
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}



class AcademicInfoTab extends StatelessWidget {
  final UserData userData;

  AcademicInfoTab({this.userData});

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ProfileCustomWidget(
            title: "Matric. No",
            value: "${userData.matric}",
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Current Level",
            value: userData.level,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "College",
            value: userData.college,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Academic Year",
            value: userData.admissionYear,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Admission Level",
            value: userData.admissionLevel,
          ),
          SizedBox(
            height: 8,
          ),
          ProfileCustomWidget(
            title: "Full Name",
            value: "${userData.admissionMode}",
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class ProfileCustomWidget extends StatelessWidget {
  final String title;
  final String value;

  ProfileCustomWidget({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
            color: Color(0xffF9F9F9), borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: title,
              lineHeight: 18,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            SizedBox(
              width: 1,
            ),
            Expanded(
              child: CustomText(
                title: value,
                lineHeight: 18,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.end,
                fontSize: 12,
                color: Theme.of(context).textTheme.headline6.color,
                maxLine: 1,
              ),
            ),
          ],
        ));
  }
}

// class StudentSubBioData extends StatelessWidget {
//   final String title;
//   final String value;
//
//   StudentSubBioData({this.title, this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomText(
//           title: title,
//           lineHeight: 21,
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//         ),
//         SizedBox(
//           width: 1,
//         ),
//         Expanded(
//           child: CustomText(
//             title: value,
//             lineHeight: 21,
//             fontWeight: FontWeight.w600,
//             textAlign: TextAlign.end,
//             fontSize: 14,
//             color: Theme.of(context).textTheme.headline6.color,
//             maxLine: 1,
//           ),
//         ),
//       ],
//     );
//   }
// }
