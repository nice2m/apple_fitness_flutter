import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SummaryScreenDateRow extends StatelessWidget {
  final VoidCallback avatarOntap;
  const SummaryScreenDateRow({super.key, required this.avatarOntap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryContainerBg,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(dateString(), style: AppTextStyle.subTitle),
              const SizedBox(
                width: 8,
              ),
              Text(
                dayString(),
                style: AppTextStyle.subTitle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "概要",
                style: AppTextStyle.headLine0,
              ),
              SizedBox(
                width: 32.0,
                height: 32.0,
                child: GestureDetector(
                  onTap: avatarOntap,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/share_icon.png")),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  String dateString() {
    final date  = DateTime.now();
    return "${date.month}月${date.day}日";
  }

  String dayString() {
     final date  = DateTime.now();
     final daysDes = [
      "周日",
      "周一",
      "周二",
      "周三",
      "周四",
      "周五",
      "周六",
     ];
    return daysDes[date.weekday];
  }
}
