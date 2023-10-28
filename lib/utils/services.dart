import 'package:flutter/services.dart';

// dont use any package other than flutter/services
// you can use any class from flutter/services

class AppServices {
  static const platform = MethodChannel('flutter.dev/connectivity');

  static Future<bool> checkConnectivity() async {
    print("hasjkh");
    try {
      // final result = await platform.invokeMethod<int>('checkConnectivity');
      return true;
      // return result as bool;
    } on PlatformException {
      rethrow;
    }
  }
}
