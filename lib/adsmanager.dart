import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';

class AdsManager {
  static bool _testMode = false;

  ///
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9655728112092831~3918763783";
    } else if (Platform.isIOS) {
      return "--------------------------------------";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (_testMode == true) {
      return AdmobBanner.testAdUnitId;
    } else if (Platform.isAndroid) {
      return "ca-app-pub-9655728112092831/3699271931";
    } else if (Platform.isIOS) {
      return "--------------------------------------";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }

  }

  static String get bannerAdUnitId2 {
    if (_testMode == true) {
      return AdmobBanner.testAdUnitId;
    } else if (Platform.isAndroid) {
      return "ca-app-pub-9655728112092831/7207218201";
    } else if (Platform.isIOS) {
      return "--------------------------------------";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }

  }

}