
import 'package:bells_portal/utils/constant_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
//import 'package:onesignal_flutter/onesignal_flutter.dart';

abstract class AuthService {
  Future<dynamic> login({String email, String password});

  Future<dynamic> register({String email, String password});

  Future<dynamic> sendEmailVerification();

  String getCurrentUserEmail();

  User getCurrentUser();

  bool isEmailVerified();

  Future signOut();

  Stream<User> authStateChange();

  Stream<bool> changeUser();

  bool isLoggedIn();

  Future<dynamic> passwordReset({String email});

  String currentUserId();

  Future<bool> isRider();
}

class AuthServiceFake implements AuthService {
  @override
  Future login({String email, String password}) async {
    await Future.delayed(Duration(seconds: 3));

    return Constant.loginSuccess;
  }

  @override
  Future passwordReset({String email}) async {
    await Future.delayed(Duration(seconds: 3));

    return AuthResultStatus.successful;
  }

  @override
  Future register({String email, String password}) async {
    await Future.delayed(Duration(seconds: 4));

    return AuthResultStatus.successful;
  }

  @override
  User getCurrentUser() {}

  @override
  Stream<User> authStateChange() {}

  @override
  bool isEmailVerified() {
    return true;
  }

  @override
  Future sendEmailVerification() async {}

  @override
  Future signOut() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Stream<bool> changeUser() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 5));

      if (i % 2 == 0) {
        yield true;
      } else {
        yield true;
      }
    }
  }

  @override
  bool isLoggedIn() {
    return true;
  }

  @override
  String currentUserId() {
    return "Hello";
  }

  @override
  Future<bool> isRider() async {
    return false;
  }

  @override
  String getCurrentUserEmail() {
    return "";
  }
}

class AuthServiceReal implements AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future login({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);



      // try {
      //  OneSignal.shared.setEmail(email: email);
      //  OneSignal.shared.setExternalUserId(getCurrentUser().uid);
      // } catch (e) {
      //   print("Error trying to set up initialization");
      // }

      return AuthResultStatus.successful;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthServiceExceptionHandler.generateExceptionMessage(
            AuthServiceExceptionHandler.handleException(e));
      }

      return "Error occurred";
    }
  }

  @override
  Future passwordReset({String email}) async {
    Future.delayed(Duration(seconds: 2));

    List<String> providers = await auth.fetchSignInMethodsForEmail(email);

    if (providers.isEmpty) return "No user found";

    await auth.sendPasswordResetEmail(email: email);
    return AuthResultStatus.successful;
  }

  @override
  Future register({String email, String password}) async {



    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(Duration(seconds: 30));



      return AuthResultStatus.successful;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthServiceExceptionHandler.generateExceptionMessage(
            AuthServiceExceptionHandler.handleException(e));
      }

      return "Registration failed";
    }
    auth.currentUser.email;
  }

  @override
  User getCurrentUser() {
    return auth.currentUser;
  }

  @override
  String getCurrentUserEmail() {
    if (auth.currentUser == null) return null;

    return auth.currentUser.email;
  }

  @override
  Stream<User> authStateChange() async* {
    yield* auth.authStateChanges();
  }

  @override
  bool isEmailVerified() {
    if (auth.currentUser == null) return false;

    return auth.currentUser.emailVerified;
  }

  @override
  Future sendEmailVerification() async {
    await auth.currentUser.sendEmailVerification();
    await auth.signOut();
  }

  @override
  Future signOut() async {


    await auth.signOut();
  }

  @override
  Stream<bool> changeUser() async* {
    yield* auth.authStateChanges().map((event) => event != null);
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  @override
  String currentUserId() {
    return auth.currentUser.uid;
  }

  @override
  Future<bool> isRider() async {
    var token = await auth.currentUser.getIdTokenResult();

    bool rider = token.claims["rider"];

    if (rider == null || !rider)
      return false;

    return true;
  }
}

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthServiceExceptionHandler {
  static AuthResultStatus handleException(e) {
    var status;

    print("error is ${e.code.toUpperCase()}");
    switch (e.code.toUpperCase()) {
      case "INVALID-EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "WRONG-PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "USER-NOT-FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "USER-DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "TOO-MANY-REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "OPERATION-NOT-ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "EMAIL-ALREADY-IN-USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static generateExceptionMessage(AuthResultStatus exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "The email has already been registered.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
