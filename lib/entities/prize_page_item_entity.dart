import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/*
* ref: https://dart.dev/language/enums
* */
enum PrizeCate implements Comparable<PrizeCate> {
  workingOn(displayName:"加油", id: 0),
  finished(displayName: "合上进度圆环", id: 1),
  mothlyChallenge(displayName: "每月挑战", id: 2),
  bodyEnergyExecise(displayName: "体能训练", id: 3),
  competetion(displayName: "竞赛", id: 4);

  const PrizeCate({
    required this.displayName,
    required this.id
  });

  final String displayName;
  final int id;

  @override
  int compareTo(PrizeCate other) => id - other.id;
}

class PrizePageItemEntity {
  late int cateId;
  late List<PrizeItemEntity> item;

  PrizePageItemEntity({
    required this.cateId,
    required this.item});

  String get displayName {
    final cateIdTmp = cateId != null ? cateId! : 0;

    return PrizeCate.values[cateIdTmp].displayName;
  }

  static Future<String> getJson() {
    return rootBundle.loadString('assets/other/prize_items.json');
  }

  static Future<List<PrizePageItemEntity>> get pages async {
    Iterable l = json.decode(await getJson());
    List<PrizePageItemEntity> retList = List<PrizePageItemEntity>.from(l.map((model) => PrizePageItemEntity.fromJson(model)));
    return Future.value(retList);
  }

  PrizePageItemEntity.fromJson(Map<String, dynamic> json) {
    cateId = json['cateId'];
    if (json['item'] != null) {
      item = <PrizeItemEntity>[];
      json['item'].forEach((v) {
        item!.add(new PrizeItemEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateId'] = this.cateId;
    if (this.item != null) {
      data['item'] = this.item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrizeItemEntity {
  late int id;
  late String title;
  late String subTitle;
  late bool archived;
  late String archiveDes;

  PrizeItemEntity({required this.id,required this.title,required this.subTitle,required this.archived,required this.archiveDes});

  String get iconName => "assets/images/prizeIcon/prizeIcon$id.png";

  PrizeItemEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    archived = json['archived'];
    archiveDes = json['archiveDes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['archived'] = this.archived;
    data['archiveDes'] = this.archiveDes;
    return data;
  }
}
