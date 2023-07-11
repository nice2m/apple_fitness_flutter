import 'package:apple_fitness_flutter/entities/prize_item_model.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class PrizeGridTitlView extends StatelessWidget {
  final PrizePageModel entity;

  const PrizeGridTitlView({Key? key, required this.entity});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(entity.title,
          style: AppTextStyle.headLine1.copyWith(color: Colors.white),
        ),
        SizedBox(height: AppLayout.height(8),),
        Divider(
          height: 1.0,
          color: Colors.white,
          indent: AppLayout.width(4),
        ),
        GridView(
          padding: EdgeInsets.only(top: AppLayout.height(8)),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
        ),
          children:
            List.generate(entity.items.length, (index) {
              final prizeItem = entity.items[index];
              Color? archivedColor = prizeItem.archived ? null : AppColor.gray2;
              return Column(
                children: [
                  Image.asset(prizeItem.iconName,color: archivedColor,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: AppLayout.height(2),),
                  Text(prizeItem.title,
                    style: AppTextStyle.subtitle4,
                  )
                ],
              );
            }).toList(),
        )
      ],
    );
  }
}
