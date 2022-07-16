import 'package:bells_portal/utils/constant_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

abstract class StorageService {
  Future<bool> isLightMode();
  Future<bool> toggleLightMode();

  Future<bool> firstTime();

  Future<bool> setFirstTime();

  Future<bool> setIsProfileCompleted({bool complete});

  Future<bool> isProfileCompleted();
}

class StorageServiceFake extends StorageService {
  @override
  Future<bool> isLightMode() async {
    return false;
  }

  @override
  Future<bool> toggleLightMode() async {
    return true;
  }

  @override
  Future<bool> firstTime() async {
    return true;
  }

  @override
  Future<bool> setFirstTime() async {
    return false;
  }

  @override
  Future<bool> isProfileCompleted() async {
    return true;
  }

  @override
  Future<bool> setIsProfileCompleted({bool complete}) async {}
}

class StorageServiceReal extends StorageService {
  Future<SharedPreferences> getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> isLightMode() async {
    var preferences = await getSharedPreference();

    bool light = preferences.getBool(Constant.darkMode) ?? true;
    preferences.setBool(Constant.darkMode, light);
    return light;
  }

  @override
  Future<bool> toggleLightMode() async {
    var preferences = await getSharedPreference();
    bool light = !(preferences.getBool(Constant.darkMode) ?? false);
    await preferences.setBool(Constant.darkMode, light);

    return light;
  }

  @override
  Future<bool> firstTime() async {
    var preference = await getSharedPreference();
    return preference.getBool(Constant.firstTimeUser) ?? true;
  }

  @override
  Future<bool> setFirstTime() async {
    var preference = await getSharedPreference();
    return await preference.setBool(Constant.firstTimeUser, false);
  }

  @override
  Future<bool> setIsProfileCompleted({bool complete}) async {
    var preference = await getSharedPreference();
    return await preference.setBool(
        Constant.isProfileCompleted, complete ?? true);
  }

  @override
  Future<bool> isProfileCompleted() async {
    var preference = await getSharedPreference();
    return preference.getBool(Constant.isProfileCompleted) ?? false;
  }
}
