import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SummaryScreenDateRow extends StatelessWidget {
  const SummaryScreenDateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryBg,
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
    return "4月13日";
  }

  String dayString() {
    return "星期四";
  }
}
