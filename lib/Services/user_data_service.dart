import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bells_portal/DataModel/user_data.dart';
import 'package:bells_portal/Services/auth_service.dart';
import 'package:bells_portal/utils/locator.dart';
import 'package:mockito/mockito.dart';

abstract class UserDataService {
  Future<UserData> getUserData();

  Stream<UserData> listenForChanges();

  Future<void> saveUserData({UserData data});
}

class UserDataServiceFake implements UserDataService {
  @override
  Future<UserData> getUserData() async {
    await Future.delayed(Duration(seconds: 2));

    return UserData(
        firstName: "Doyin",
        location: "ClassRoom 5",
        lastName: "Afonja",
        phone: "08183698193",
        email: "example@gmail.com",
        uid: "hfrfgpojghhguygig");
  }

  @override
  Stream<UserData> listenForChanges() async* {
    yield UserData(
        firstName: "Doyin",
        location: "ClassRoom 5",
        lastName: "frck you",
        email: "example@gmail.com",
        uid: "hfrfgpojghhguygig");
  }

  @override
  Future<void> saveUserData({UserData data}) async {
    await Future.delayed(Duration(seconds: 3));
  }
}

class UserDataServiceReal implements UserDataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService _authService = locator<AuthService>();

  @override
  Future<UserData> getUserData() async {
    DocumentSnapshot snapshot = await firestore
        .collection("users")
        .doc(_authService.currentUserId())
        .get();
    return UserData.fromMap(snapshot.data());
  }

  @override
  Stream<UserData> listenForChanges() async* {
    yield* firestore
        .collection("users")
        .doc(_authService.currentUserId())
        .snapshots()
        .map((event) => UserData.fromMap(event.data()));
  }

  @override
  Future<void> saveUserData({UserData data}) async {
    data.uid = _authService.currentUserId();
    data.email = _authService.getCurrentUserEmail();

    await firestore
        .collection("users")
        .doc(_authService.currentUserId())
        .set(data.toMap());
  }
}
