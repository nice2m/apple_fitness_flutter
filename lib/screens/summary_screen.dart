import 'package:apple_fitness_flutter/components/summary_screen_date_row.dart';
import 'package:apple_fitness_flutter/components/summary_screen_titled_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
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
              SummaryScreenTitledRow(
                  titleString: "健身记录",
                  contentBuilder: (context, constraints) {
                    return Row(
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
                      ],
                    );
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
