import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

abstract class CloudFunctionService {
  Future<dynamic> callFunction({@required String name, dynamic data});
}

class CloudFunctionServiceFake implements CloudFunctionService {
  @override
  Future callFunction({String name, data}) async {
    print(data);

    await Future.delayed(Duration(seconds: 4));

    return 1;
  }
}

class CloudFunctionServiceReal implements CloudFunctionService {
  @override
  Future callFunction({String name, data}) async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(name);

    print("Calling function :::: $name");

    var result;

    try {
      var call = await callable.call(data);

      result = call.data;

      return result;
    } catch (e) {
    //  print(e);
      result = -1;
    }

    return result;
  }
}
