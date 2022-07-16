import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class Constant {
  static const String nairaSymbol = "\u{20A6}";

  static const String processing = "processing";
  static const String delivered = "delivered";
  static const String canceled = "canceled";
  static const String queried = "queried";
  static const String pending = "pending";

  static const String loginSuccess = "success";

  static const String darkMode = "darkMode";

  static const String firstTimeUser = "firstTimeUser";

  static const String cachedSchool = "cachedSchool";
  static const String cachedLocation = "cachedLocation";

  static const bool release = true;

  static String isProfileCompleted = "isProfileCompleted";

  static String paymentGatewayFlutterwave = "flutterwave";

  static String paymentGatewayPaystack = "paystack";

  static String moneyFormat(double amount, {bool space}) {
    if (amount == null) {
      return NumberFormat.simpleCurrency(
              name: "${Constant.nairaSymbol} ", decimalDigits: 1)
          .format(0);
    }

    if (space != null && space) {
      return NumberFormat.simpleCurrency(
              name: "${Constant.nairaSymbol} ", decimalDigits: 1)
          .format(amount);
    }

    return NumberFormat.simpleCurrency(
            name: "${Constant.nairaSymbol}", decimalDigits: 1)
        .format(amount);
  }

  static List<Color> multiColors = [
    Colors.red,
    Colors.amber,
    Color(0xff34C47C),
    Colors.cyan,
    Colors.deepPurple,
    Colors.purpleAccent,
    Colors.blue,
  ];

  static final animOptions = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 0),
    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  static double getTransferCharges({double amount}) {
    double charges = 0;
    if (amount <= 5000) {
      charges = 11;
    } else if (amount > 5000) {
      charges = 27;
    } else if (amount > 10000) {
      charges = 54;
    }
    return charges;
  }

  static List<String> hardCodedHostel() {

    return <String>[

      "Male Silver 1",
      "Male Silver 2",
      "Male Silver 3",
      "Female Silver",
      "Female Bronze",
      "Elt",
      "Adenuga",
      "Hall D",
      "Hall B",
      "Wema Bank",


    ];
  }

  static List<String> hardCodedBanks() {

    return <String>[

      "Access Bank",
      "Wema Bank",
      "GT bank",
      "Fidelity Bank",
      "Sky Bank"


    ];
  }




}
