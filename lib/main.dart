import 'dart:ffi';

import 'package:apple_fitness_flutter/constant/keys.dart';
import 'package:apple_fitness_flutter/screens/grant_notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:apple_fitness_flutter/screens/share_screen.dart';
import 'package:apple_fitness_flutter/screens/welcome_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:get_storage/get_storage.dart';
import 'components/fapp_bottom_bar.dart';
import './utils/app_storage.dart';
import './constant/keys.dart';

void main() async {
  await initStorage();

  runApp(const FApp());
}

enum FAppScreens {
  normal(0),
  share(1),
  grantNotification(2);

  final int state;
  const FAppScreens(this.state);
}

class FApp extends StatefulWidget {
  const FApp({super.key});

  @override
  State<FApp> createState() => _FAppState();
}

class _FAppState extends State<FApp> {
  FAppScreens screen = FAppScreens.share;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: AppColor.primaryBg,
        debugShowCheckedModeBanner: true,
        home: Builder(builder: (BuildContext context) {
          return getHome(context);
        }));
  }

  Widget getHome(BuildContext context) {
    final showWelcome = getStorage(shownWelcomeGetStorageKey);
    final showNotification = getStorage(shownGrantNotificationAccessKey);

    if (showWelcome == null) {
      screen = FAppScreens.share;
    } else if (showNotification == null) {
      screen = FAppScreens.grantNotification;
    } else {
      screen = FAppScreens.normal;
    }

    switch (screen) {
      case FAppScreens.normal:
        return const FAppBottomBar();
      case FAppScreens.share:
        return WelcomeScreen(continueCallBack: () {
          screen = FAppScreens.grantNotification;
          setState(() {
            updateStorage(shownWelcomeGetStorageKey
            , "1");
          });
        });
      case FAppScreens.grantNotification:
        return GrantNotificationScreen(continueCallBack: () {
          screen = FAppScreens.normal;
          setState(() {
            updateStorage(shownGrantNotificationAccessKey
            , "1");
          });
        });
      default:
        return const Text('unknown');
    }
  }
}
