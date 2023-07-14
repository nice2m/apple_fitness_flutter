// import 'dart:core';
// import 'dart:ffi';
//
// /*
// * 每一个奖项图标entity
// * */
// class PrizeItemEntity {
//   PrizeItemEntity({
//     this.cateId,
//     this.id,
//     this.title,
//     this.subTitle,
//     this.archived,});
//
//   PrizeItemEntity.fromJson(dynamic json) {
//     cateId = json['cateId'];
//     id = json['id'];
//     title = json['title'];
//     subTitle = json['subTitle'];
//     archived = json['archived'];
//   }
//   int? cateId;
//   int? id;
//   String? title;
//   String? subTitle;
//   bool? archived;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['cateId'] = cateId;
//     map['id'] = id;
//     map['title'] = title;
//     map['subTitle'] = subTitle;
//     map['archived'] = archived;
//     return map;
//   }
//
// }
// /*
// * ref: https://dart.dev/language/enums
// * */
// enum PrizeCate implements Comparable<PrizeCate> {
//   workingOn(displayName:"加油", id: 0),
//   finished(displayName: "合上进度圆环", id: 1),
//   mothlyChallenge(displayName: "每月挑战", id: 2),
//   bodyEnergyExecise(displayName: "体能训练", id: 3),
//   competetion(displayName: "竞赛", id: 4);
//
//   const PrizeCate({
//     required this.displayName,
//     required this.id
//   });
//
//   final String displayName;
//   final int id;
//
//   @override
//   int compareTo(PrizeCate other) => id - other.id;
// }
//
// /*
// * 1.某一栏大标题奖项；
// * 2.奖项图标数据管理Model
// * */
// class PrizePageModel {
//   late String title;
//   late List<PrizeItemEntity> items;
//
//   PrizePageModel({required this.title, required this.items});
//
//   /*
//   * 获取全部渲染奖项数据
//   * */
//   static List<PrizePageModel> pages() {
//    final List<PrizePageModel> ret = [];
//    for(var i = 0;i < PrizeCate.values.length; i++){
//      final page = PrizePageModel.generatePage(i);
//      ret.add(page);
//    }
//    return ret;
//   }
//
//   /*
//   * 生成某一栏奖项数据
//   * */
//   static PrizePageModel generatePage(int index) {
//     final cates = PrizeCate.values;
//     final cateName = cates[index].displayName;
//
//     switch(index) {
//       case 0:
//       // section
//
//       final item1 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/prize/prizeIcon0.png", archived: false, subtitle: '0/14天',cate: 0);
//       final item2 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: false, subtitle: '800千卡',cate: 0);
//
//       // page
//       final page1 = PrizePageModel(title: "加油", items: [item1,item2]);
//       return page1;
//
//       case 1:
//
//       default:
//       // section
//       final page1 = PrizePageModel(title: "加油", items: []);
//       return page1;
//     }
//   }
//
// }