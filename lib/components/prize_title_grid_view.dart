import 'dart:math';
import 'package:apple_fitness_flutter/components/prize_title_grid_item_view.dart';
import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/screens/prize_icon_detail_screen.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

typedef PrizeGridTitlViewOnClick = Function(PrizePageItemEntity,PrizeItemEntity);
class PrizeGridTitlView extends StatelessWidget {
  final PrizePageItemEntity entity;
  final PrizeGridTitlViewOnClick itemOnClick;

  const PrizeGridTitlView({Key? key, required this.entity, required this.itemOnClick});

  @override
  Widget build(BuildContext context) {
    final blueRandom = Random().nextInt(200);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppLayout.height(8)),
          child: Divider(
            height: 1.0,
            color: Colors.white,
            indent: AppLayout.width(4),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top:AppLayout.height(8) ,left: AppLayout.width(4),bottom: AppLayout.height(8)),
          child: Text(
            entity.displayName,
            style: AppTextStyle.headLine2.copyWith(color: Colors.white),
          ),
        ),

        GridView(
          // padding: EdgeInsets.only(top: AppLayout.height(8)),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0 /1.2,

          ),
          children: List.generate(entity.item.length, (index) {
            final prizeItem = entity.item[index];
            return PrizeItemGridItemView(prizeItem: prizeItem, onClick: (item){
              itemOnClick(entity,prizeItem);
            });
          }).toList(),
        ),
      ],
    );
  }
}
