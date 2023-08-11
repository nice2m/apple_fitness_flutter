import 'package:apple_fitness_flutter/grant_notification_page/view/grant_share_records_screen.dart';
import 'package:apple_fitness_flutter/share_page/screen/share_records_screen.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

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
