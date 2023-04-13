import 'package:apple_fitness_flutter/components/welcome_screen.dart';
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
    return const MaterialApp(
      title: "test",
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // const FAppBottomBar(),
    );
  }
}
