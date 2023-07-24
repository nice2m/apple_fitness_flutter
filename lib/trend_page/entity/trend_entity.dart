import 'dart:math';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TrendSectionEntity {
  TrendSectionEntity({
    required this.title,
    required this.items,});

  TrendSectionEntity.fromJson(dynamic json) {
    title = json['title'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(TrendRowEntity.fromJson(v));
      });
    }
  }
  late String title;
  late List<TrendRowEntity> items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    if (items != null) {
      map['items'] = items.map((v) => v.toJson()).toList();
    }
    return map;
  }

  static Future<List<TrendSectionEntity>> data() async {
    const jsonFileName = "trends.json";
    final jsonString = await rootBundle.loadString('assets/other/$jsonFileName');
    Iterable jsonRaw = json.decode(jsonString);
    final retList = jsonRaw.map((jsonObj) => TrendSectionEntity.fromJson(jsonObj)).toList();
    return Future.value(retList);
  }
}

// 趋势类型
enum TrendItemState<Int>{
  // 增加 箭头向上
  increase(state: 1),
  // 进行中
  undergoing(state: 0),
  // 减少 箭头向下
  decrease(state: -1);

  final int state;
  const TrendItemState({required this.state});

  static TrendItemState from(int state) {
    switch (state){
      case -1:
        return TrendItemState.decrease;
      case 0:
        return TrendItemState.undergoing;
      case 1:
        return TrendItemState.increase;
    }
    return TrendItemState.decrease;
  }

}

bool trendRowEntityIncreateSateRedArrow = false;
class TrendRowEntity {
  TrendRowEntity({
    required this.state,
    required this.name,
    required this.des,
    required this.subdes,});

  TrendRowEntity.fromJson(dynamic json) {
    state = json['state'];
    name = json['name'];
    des = json['des'];
    subdes = json['subdes'];
  }
  late int state;
  late String name;
  late String des;
  late String subdes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    map['name'] = name;
    map['des'] = des;
    map['subdes'] = subdes;
    return map;
  }

  TrendItemState itemState() => TrendItemState.from(state);

  Color desColor() {
    final itemState = this.itemState();
    switch (itemState) {
      case TrendItemState.increase:
        return AppColor.primaryRed;
      case TrendItemState.decrease:
        return const Color(0xff2AC1FA);
      case TrendItemState.undergoing:
        final random = (Random().nextInt(255) + 1).toRadixString(16);
        final colorHex = int.parse("0xff${random}C1FA");
        return Color(colorHex);
    }
  }

  String riveAssetName() {
    /*
    * line_even.riv
      blue_arrow_go_up.riv
      red_arrow_go_up.riv
    * */
    const prefix = "assets/animation/Rive/";
    final state = itemState();
    switch (state) {
      case TrendItemState.increase:
        trendRowEntityIncreateSateRedArrow = !trendRowEntityIncreateSateRedArrow;
        if (trendRowEntityIncreateSateRedArrow){
          return "${prefix}red_arrow_go_up.riv";
        }
        return "${prefix}blue_arrow_go_up.riv";
      case TrendItemState.undergoing:
        trendRowEntityIncreateSateRedArrow = !trendRowEntityIncreateSateRedArrow;
        if (trendRowEntityIncreateSateRedArrow){
          return "${prefix}red_arrow_go_up.riv";
        }
        return "${prefix}blue_arrow_go_up.riv";
      case TrendItemState.decrease:
        return "${prefix}line_even.riv";
    }
  }
}