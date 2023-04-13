import 'package:apple_fitness_flutter/screens/share_screen.dart';
import 'package:apple_fitness_flutter/screens/summary_screen.dart';
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
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: "概要",
              icon: Icon(
                Icons.circle_outlined,
                color: Colors.blueGrey,
              ),
              activeIcon: Icon(
                Icons.circle_outlined,
                color: Colors.lightBlue,
              )),
          BottomNavigationBarItem(
            label: "共享",
              icon: Icon(
                Icons.share,
                color: Colors.blueGrey,
              ),
              activeIcon: Icon(
                Icons.share,
                color: Colors.lightBlue,
              ))
        ],
        onTap: bottomNavigationBarOnTap,
      ),
    );
  }

  void bottomNavigationBarOnTap(int index) {
    _selectedScreenIndex = index;
    setState(() {});
  }
}
