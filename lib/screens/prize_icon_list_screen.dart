import 'package:apple_fitness_flutter/components/prize_list_navigation_bar.dart';
import 'package:apple_fitness_flutter/components/prize_title_grid_view.dart';
import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/screens/prize_icon_detail_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class PrizeIconListScreen extends StatefulWidget {
  const PrizeIconListScreen({super.key});

  @override
  State<PrizeIconListScreen> createState() => _PrizeIconListScreenState();
}

class _PrizeIconListScreenState extends State<PrizeIconListScreen> {
  late List<PrizePageItemEntity> list = [];

  @override
  void initState() {
    super.initState();
    PrizePageItemEntity.pages.then((value){
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryContainerBg,
        appBar: AppBar(
          backgroundColor: AppColor.primaryBlack,
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: PrizeListNavigationBarTitle(
              titleText: "概要",
              backOnTap: () {
                Navigator.of(context).pop();
              },
              tintColor: AppColor.primary),
        ) ,
        body: CustomScrollView(
          slivers: _generateTitleAndGrids("奖章", list),
        ));
  }

  List<Widget> _generateTitleAndGrids(
      String title, List<PrizePageItemEntity> grids) {
    final List<Widget> ret = [];

    ret.add(const SliverToBoxAdapter(
      child: Text(
        "奖章",
        style: AppTextStyle.headLine1,
      ),
    ));

    List.generate(grids.length, (index) {
      final entity = grids[index];
      ret.add(SliverToBoxAdapter(
        child: PrizeGridTitlView(entity: entity, itemOnClick: (page , prizeItem ) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PrizeItemDetailScreen(page: page, entity: prizeItem),
            ),
          );
        },),
      ));
    });
    return ret;
  }
}
