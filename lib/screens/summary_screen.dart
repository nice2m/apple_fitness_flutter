import 'package:apple_fitness_flutter/components/circle_progress_indicator.dart';
import 'package:apple_fitness_flutter/components/summary_screen_date_row.dart';
import 'package:apple_fitness_flutter/components/summary_screen_progress_indicator.dart';
import 'package:apple_fitness_flutter/components/summary_screen_titled_row.dart';
import 'package:apple_fitness_flutter/entities/summary_screen_display_entities.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import '../components/summary_screen_prize_grid_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    super.initState();
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
              SizedBox(height: AppLayout.width(20),),
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
                          child: SummaryScreenProgressIndicator(progress: getPorgress())
                        )
                      ],
                    );
                  });
  }

  Widget buildTrendRow(BuildContext context) {
    return SummaryScreenTitledRow(titleString: "趋势", contentBuilder: (context,constraints) {
                return Column(
                  children: [
                    
                    SizedBox(
                      // height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16,left: 0, bottom: 8,right: 0),
                        child: Text(
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
                          onTap: () => onStartTap(),
                        ),
                  ],
                );
              });
  }

  Widget buildOnPrizeIcons(BuildContext context) {
    final grids = [
      SummaryScreenPrizeGridItemEntity(iconName: "iconName", title: "四月挑战", kalulyDes: "0/1天"),
      SummaryScreenPrizeGridItemEntity(iconName: "iconName", title: "三月挑战1", kalulyDes: "2023年"),
      SummaryScreenPrizeGridItemEntity(iconName: "iconName", title: "新活动记录", kalulyDes: "251千卡"),
    ];
     return SummaryScreenTitledRow(
      titleBuilder: (context, boxConstraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "奖章",
              style: AppTextStyle.headLine1,
              ),
              GestureDetector(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "显示更多",
                              style: AppTextStyle.subtitle3
                                  .copyWith(color: AppColor.primary),
                            ),
                          ),
                          onTap: () => onPrizeIconShowMoreTap(),
                        ),
          ],
        );
      },
      contentBuilder: ((context, boxConstraints) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8,left: 0, bottom: 8,right: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: grids.map((e) => SummaryScreenPrizeGridItem(model: e)).toList(),
                  ),
                );
              }));
  }

  void onStartTap() {
    print("onStartTap");
  }
  
  void onPrizeIconShowMoreTap() {
    print("onPrizeIconShowMoreTap");
  }
}
