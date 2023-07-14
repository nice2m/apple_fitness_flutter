
import 'package:apple_fitness_flutter/components/prize_list_navigation_bar.dart';
import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class PrizeItemDetailScreen extends StatefulWidget {
  final PrizePageItemEntity? page;
  final PrizeItemEntity entity;

  const PrizeItemDetailScreen({super.key,this.page,required this.entity});

  @override
  State<PrizeItemDetailScreen> createState() => _PrizeItemDetailScreenState();
}

class _PrizeItemDetailScreenState extends State<PrizeItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryContainerBg,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlack,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: PrizeListNavigationBarTitle(titleText: "奖章", backOnTap: (){
          Navigator.of(context).pop();
        }, tintColor: AppColor.primary),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  border: Border.all(width: 1,color: Colors.white),
                  image: DecorationImage(
                    image: AssetImage(widget.entity.iconName),
                    fit: BoxFit.contain
                  )
                ),
              )
              ,
              Padding(
                padding: EdgeInsets.only(left: AppLayout.width(4),right:AppLayout.width(4) ),
                child: Text(
                  widget.entity.title,
                  style: AppTextStyle.headLine2,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
