import 'package:apple_fitness_flutter/account_page/screen/account_view.dart';
import 'package:apple_fitness_flutter/app_component/view/fapp_bottom_bar.dart';
import 'package:apple_fitness_flutter/constant/keys.dart';
import 'package:apple_fitness_flutter/grant_notification_page/view/grant_notification_screen.dart';
import 'package:apple_fitness_flutter/login_page/screen/login_page.dart';
import 'package:apple_fitness_flutter/logined_page/screen/logined_page.dart';
import 'package:apple_fitness_flutter/app_component/manager/messengers.dart';
import 'package:apple_fitness_flutter/regist_page/screen/regist_page.dart';
import 'package:apple_fitness_flutter/verify_email_page/screen/verify_email_page.dart';
import 'package:flutter/material.dart';
import 'package:apple_fitness_flutter/welcome_page/screen/welcome_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import './utils/app_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await initStorage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FApp());
}

// 定义参考 constant/keys.dart
enum FAppScreens {
  // 常规展示主页，已经提示经过了欢迎通知介绍页，健身介绍
  normal(0),
  // 是否未展示分享页，启动时展示分享页
  share(1),
  // 是否展示通知授权获取页，未展示那启动时展示该页
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
  void initState() {
    super.initState();
    print("FApp.initState");

    
  }

  @override
  void didUpdateWidget(covariant FApp oldWidget) {
    print("didUpdateWidget");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

   
  }

  void test(BuildContext context) {
    NativeMessenger.getBatteryLevel().then((value) {
      print("NativeMessenger.getBatteryLevel");
      print("$value");
    }).onError((error, stackTrace) {
      print("== onError");
      print(error.toString());
      print(stackTrace);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
    var ctext = context;

    Future.delayed(Duration(seconds: 5), () {
      print("futuer.delayed");
      test(ctext);
    });

    return MaterialApp(
        color: AppColor.primaryBg,
        debugShowCheckedModeBanner: true,
        home: Builder(builder: (BuildContext context) {
          return getHome(context);
        }),
        routes: {
          "/account/": (context) { return const AccountView();},
          "/login/": (context) => const LoginPage(),
          "/regist/": (context) => const RegistPage(),
          "/verifyEmail/": (context) => const VerifyEmailView(),
          "/logined/": (context) => const LoginedPage()
        });
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
            updateStorage(shownWelcomeGetStorageKey, "1");
          });
        });
      case FAppScreens.grantNotification:
        return GrantNotificationScreen(continueCallBack: () {
          screen = FAppScreens.normal;
          setState(() {
            updateStorage(shownGrantNotificationAccessKey, "1");
          });
          NativeMessenger.getNotificationPermission();
        });
      default:
        return const Text('unknown');
    }
  }
}
