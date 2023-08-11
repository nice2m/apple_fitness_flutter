import 'dart:io';

import 'package:flutter/services.dart';

class NativeMessenger {
  static const platform = MethodChannel('fapp.flutter/methodChannel');

  static Future<int> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (_) {
      return -1;
    }
  }

  static Future<bool> getNotificationPermission() async {
    if (Platform.isIOS) {
      return _iosGetNotificationPermission();
    }
    return false;
  }

  // iOS 获取通知推送权限
  static Future<bool> _iosGetNotificationPermission() async {
    try {
      final bool granted =
          await platform.invokeMethod('notificationServiceGetAccess');
      return granted;
    } on PlatformException catch (_) {
      return false;
    }
  }
}
