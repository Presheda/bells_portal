import 'package:bells_portal/DataModel/temp_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GeneralRefService {
  Future<String> findMatric({String matric});
}

class GeneralRefServiceReal extends GeneralRefService {
  @override
  Future<String> findMatric({String matric}) async {


    matric =  matric.replaceAll("/", "");

    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection("generalref")
        .doc((matric))
        .get();

    if (!result.exists) return null;

    TempData temp = TempData.fromMap(result.data());

    return temp.email;
  }
}

class GeneralRefServiceFake extends GeneralRefService {
  @override
  Future<String> findMatric({String matric}) async {
    return null;
  }
}
