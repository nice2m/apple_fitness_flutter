import 'dart:ui';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../entity/trend_entity.dart';

class TrendRow extends StatefulWidget {
  final TrendRowEntity entity;

  const TrendRow({Key? key,required this.entity}) : super(key: key);

  @override
  State<TrendRow> createState() => _TrendRowState();
}

class _TrendRowState extends State<TrendRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppLayout.width(6)),
      padding: EdgeInsets.only(top: AppLayout.width(12), left: AppLayout.width(16), bottom: AppLayout.width(12), right: AppLayout.width(12)),
      decoration: BoxDecoration(
       color: AppColor.gray0,
       borderRadius: BorderRadius.all(Radius.circular(AppLayout.width(16))),
     ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            child: RiveAnimation.asset(widget.entity.riveAssetName()),
          ),
          SizedBox(width: AppLayout.width(2),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.entity.name,style: AppTextStyle.title),
              Text(widget.entity.des,style: AppTextStyle.title.copyWith(color: widget.entity.desColor()),),
              widget.entity.subdes.isNotEmpty ? Text(widget.entity.subdes,style: AppTextStyle.subtitle5,) : SizedBox.fromSize(size: Size.zero,)
            ],
          )
        ],
      ),
    );
  }
}
