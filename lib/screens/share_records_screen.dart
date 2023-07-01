import 'dart:async';
import 'dart:math';

import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShareRecordsScreen extends StatefulWidget {
  ShareRecordsScreen({super.key});

  @override
  State<ShareRecordsScreen> createState() => _ShareRecordsScreenState();
}

class _ShareRecordsScreenState extends State<ShareRecordsScreen> {
  final _controller = StreamController.broadcast();

  @override
  void initState() {
    _controller.stream.listen((event) {
      print("listen${event}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ...List.generate(5, (index) => Puzzle()),
      Align(
        alignment: Alignment.bottomCenter,
        child: KeyPad(_controller),
      )
    ]));
  }
}

class KeyPad extends StatelessWidget {
  final _controller;

  KeyPad(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 2 / 1,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(9, (index) {
          return MaterialButton(
            shape: RoundedRectangleBorder(),
            color: Colors.primaries[index][200],
            child: Text(
              "${index + 1}",
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _controller.add(index + 1);
              // keyOnPressed(index);
            },
          );
        }),
      ),
    );
  }
}

class Puzzle extends StatefulWidget {
  const Puzzle({super.key});

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> with SingleTickerProviderStateMixin {
  int a = 0, b = 0;
  Color color = Colors.primaries[Random().nextInt(18)];
  double x = Random().nextDouble() * 400;
  late AnimationController _controller;

  void reset() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 400;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _controller.duration =
        Duration(milliseconds: Random().nextInt(5000) + 5000);
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    reset();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        reset();
        _controller.forward(from: 0.0);
      }
    });

    _controller.forward(from: Random().nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
              top: 800 * _controller.value - 100,
              left: x,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color,
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                child: Text(
                  "$a + $b",
                  style: TextStyle(fontSize: 24),
                ),
              ));
        });
  }
}
