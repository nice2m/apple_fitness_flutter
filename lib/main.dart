import 'package:apple_fitness_flutter/screens/share_screen.dart';
import 'package:apple_fitness_flutter/screens/welcome_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'components/fapp_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColor.primaryBg,
      debugShowCheckedModeBanner: true,
      home: getHome(), //FAppBottomBar(),
    );
  }

  Widget getHome() {
    final showWelcome = true;
    final showNotification = true;

    if (showWelcome) {
      return WelcomeScreen(continueCallBack: () {
        print("continue clicked");
      });
    }
  }
}
