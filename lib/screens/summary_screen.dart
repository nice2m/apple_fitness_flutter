import 'package:apple_fitness_flutter/components/summary_screen_date_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  // ScrollController _scrollController =
  //    ScrollController(debugLabel: "test debug");

  @override
  void initState() {
    // _scrollController.addListener(() {
    //   print("$_scrollController.offset");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // controller: _scrollController,
      slivers: [
        SliverAppBar(
          snap: true,
          backgroundColor: AppColor.primaryBg,
          title: const Text(
            "概要",
            style: AppTextStyle.title,
          ),
          expandedHeight: 44,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SummaryScreenDateRow(),
        ])),
      ],
    );
  }
}
