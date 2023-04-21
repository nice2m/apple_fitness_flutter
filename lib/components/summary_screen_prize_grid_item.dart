import 'package:apple_fitness_flutter/entities/summary_screen_display_entities.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SummaryScreenPrizeGridItem extends StatelessWidget {
  final SummaryScreenPrizeGridItemEntity model;
  const SummaryScreenPrizeGridItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 88,
          // TODO: build image content~~
          child: Placeholder(),
        ),
        SizedBox(height: 6,),
        Text(
          model.title,
          style: AppTextStyle.subtitle4,
        ),
        Text(
          model.kalulyDes,
          style: AppTextStyle.subtitle5,
        )
      ],
    );
  }
}