import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

typedef SummaryScreenTitledRowBuilder = Widget Function(
    BuildContext context, BoxConstraints boxConstraints);

class SummaryScreenTitledRow extends StatelessWidget {
  final String titleString;
  final SummaryScreenTitledRowBuilder contentBuilder;

  const SummaryScreenTitledRow(
      {super.key, required this.titleString, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryContainerBg,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                titleString,
                style: AppTextStyle.headLine1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFF1E1C21),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints boxConstraints) {
                return contentBuilder(context, boxConstraints);
              }),
            ),
          )
        ],
      ),
    );
  }
}
