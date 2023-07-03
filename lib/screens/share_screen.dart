import 'package:apple_fitness_flutter/screens/grant_share_records_screen.dart';
import 'package:apple_fitness_flutter/screens/share_records_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  var _selectIndex = 0;
  var _screens;

  final grantShareRecordsScreen =
      GrantShareRecordsScreen(continueCallBack: () {});

  final shareRecordsScreen = ShareRecordsScreen();

  @override
  void initState() {
    _screens = [grantShareRecordsScreen, shareRecordsScreen];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _screens[_selectIndex];
  }
}
