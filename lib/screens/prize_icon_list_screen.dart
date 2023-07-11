import 'package:flutter/material.dart';

class PrizeIconListScreen extends StatefulWidget {
  const PrizeIconListScreen({super.key});

  @override
  State<PrizeIconListScreen> createState() => _PrizeIconListScreenState();
}

class _PrizeIconListScreenState extends State<PrizeIconListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("奖章"),),
      
    );
  }
}