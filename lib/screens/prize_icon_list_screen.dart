import 'package:apple_fitness_flutter/components/prize_list_navigation_bar.dart';
import 'package:apple_fitness_flutter/components/prize_title_grid_view.dart';
import 'package:apple_fitness_flutter/entities/prize_item_model.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrizeIconListScreen extends StatefulWidget {
  const PrizeIconListScreen({super.key});

  @override
  State<PrizeIconListScreen> createState() => _PrizeIconListScreenState();
}

class _PrizeIconListScreenState extends State<PrizeIconListScreen> {
  @override
  Widget build(BuildContext context) {
    final grids = PrizePageModel.pages();

    return Scaffold(
        backgroundColor: AppColor.primaryContainerBg,
        appBar: AppBar(
          backgroundColor: AppColor.primaryBlack,
          automaticallyImplyLeading: false,
          title: PrizeListNavigationBarTitle(
              titleText: "概要",
              backOnTap: () {
                Navigator.of(context).pop();
              },
              tintColor: AppColor.primary),
        ),
        body: CustomScrollView(
          slivers: _generateTitleAndGrids("奖章", grids),
        ));
  }

  List<Widget> _generateTitleAndGrids(
      String title, List<PrizePageModel> grids) {
    final List<Widget> ret = [];

    ret.add(SliverToBoxAdapter(
      child: const Text(
        "奖章",
        style: AppTextStyle.headLine1,
      ),
    ));

    List.generate(grids.length, (index) {
      final entity = grids[index];

      ret.add(SliverToBoxAdapter(
        child: PrizeGridTitlView(entity: entity),
      ));
    });
    return ret;
  }
}
