import 'package:apple_fitness_flutter/screens/share_screen.dart';
import 'package:apple_fitness_flutter/screens/summary_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FAppBottomBar extends StatefulWidget {
  const FAppBottomBar({super.key});

  @override
  State<FAppBottomBar> createState() => _FAppBottomBarState();
}

class _FAppBottomBarState extends State<FAppBottomBar> {
  int _selectedScreenIndex = 0;
  static final List<Widget> _screens = <Widget>[
    const SummaryScreen(),
    const ShareScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:AppColor.primary ,
        unselectedItemColor: AppColor.subtitle,
        backgroundColor: AppColor.primaryBg,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            label: "概要",
              icon: Image.asset("assets/images/ring_icon.png",
              height: 24,
              width: 24,
              color: AppColor.subtitle,
              ),
              activeIcon: Image.asset("assets/images/ring_icon.png",
              height: 24,
              width: 24,
              color: AppColor.primary,
              )),
          BottomNavigationBarItem(
            label: "共享",
              icon: Image.asset("assets/images/share_icon.png",
              width: 24,
              height: 24,
              color: AppColor.subtitle,
              ),
              activeIcon: Image.asset("assets/images/share_icon.png",
              width: 24,
              height: 24,
              color: AppColor.primary,
              ))
        ],
        onTap: bottomNavigationBarOnTap,
      ),
    );
  }

  void bottomNavigationBarOnTap(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}
