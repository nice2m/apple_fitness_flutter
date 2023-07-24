import 'package:apple_fitness_flutter/components/prize_title_grid_item_view.dart';
import 'package:apple_fitness_flutter/components/summary_screen_date_row.dart';
import 'package:apple_fitness_flutter/components/summary_screen_progress_indicator.dart';
import 'package:apple_fitness_flutter/components/summary_screen_titled_row.dart';
import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/screens/prize_icon_detail_screen.dart';
import 'package:apple_fitness_flutter/screens/prize_icon_list_screen.dart';
import 'package:apple_fitness_flutter/trend_page/screen/trend_page.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  late List<PrizeItemEntity> _topPrizeList = [];

  @override
  void initState() {
    super.initState();

    PrizePageItemEntity.pages.then((value) => {
          setState(() {
            _topPrizeList =
                value.expand((element) => element.item).toList().sublist(0, 3);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryContainerBg,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppColor.primaryContainerBg,
            title: const Text(
              "概要",
              style: AppTextStyle.title,
            ),
            expandedHeight: 44,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SummaryScreenDateRow(),
              buildFitRecordRow(context),
              buildTrendRow(context),
              buildOnPrizeIcons(context),
              SizedBox(
                height: AppLayout.width(20),
              ),
            ]),
          )
        ],
      ),
    );
  }

  // data
  double getPorgress() {
    return 0.66;
  }

  //
  Widget buildFitRecordRow(BuildContext context) {
    return SummaryScreenTitledRow(
        titleString: "健身记录",
        contentBuilder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "活动",
                      style: AppTextStyle.subtitle3,
                    ),
                    Text(
                      "100/1020千卡",
                      style: AppTextStyle.subTitle2
                          .copyWith(color: AppColor.primaryRed),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "步数",
                      style: AppTextStyle.subtitle3,
                    ),
                    Text(
                      "2807",
                      style: AppTextStyle.subTitle2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "距离",
                      style: AppTextStyle.subtitle3,
                    ),
                    Text(
                      "1.89公里",
                      style: AppTextStyle.subTitle2,
                    ),
                  ],
                ),
              ),
              Container(
                  width: 140,
                  height: 140,
                  child:
                      SummaryScreenProgressIndicator(progress: getPorgress()))
            ],
          );
        });
  }

  Widget buildTrendRow(BuildContext context) {
    return SummaryScreenTitledRow(
        titleString: "趋势",
        contentBuilder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppLayout.height(16), left: 0, bottom: 8, right: 0),
                  child: const Text(
                    "每天合上圆环是保持活跃的良策。趋势肩头可提供更多健身详情来持续激励你。",
                    style: AppTextStyle.subtitle3,
                    maxLines: 2,
                  ),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "开始使用",
                    style: AppTextStyle.subtitle3
                        .copyWith(color: AppColor.primary),
                  ),
                ),
                onTap: () => _trendOnStartTap(),
              ),
            ],
          );
        });
  }

  Widget buildOnPrizeIcons(BuildContext context) {
    final grids = _topPrizeList
        .map((prizeItem) => PrizeItemGridItemView(
            prizeItem: prizeItem,
            onClick: (onClickEntity) {
              _onPrizeItemTap(onClickEntity);
            }))
        .toList();
    return SummaryScreenTitledRow(titleBuilder: (context, boxConstraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "奖章",
            style: AppTextStyle.headLine1,
          ),
          GestureDetector(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "显示更多",
                style: AppTextStyle.subtitle3.copyWith(color: AppColor.primary),
              ),
            ),
            onTap: () => _onPrizeIconShowMoreTap(),
          ),
        ],
      );
    }, contentBuilder: ((context, boxConstraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 0, bottom: 8, right: 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, children: grids),
      );
    }));
  }

  void _trendOnStartTap() {
    // 跳转trend 趋势页
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const TrendPage()
      )
    );
  }

  void _onPrizeIconShowMoreTap() {
    // 跳转奖牌列表页
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrizeIconListScreen(),
      ),
    );
  }

  void _onPrizeItemTap(PrizeItemEntity prizeItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PrizeItemDetailScreen(entity: prizeItem),
      ),
    );
  }
}
