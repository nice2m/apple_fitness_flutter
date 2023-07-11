import 'dart:core';
import 'dart:ffi';

/*
* 每一个奖项图标entity
* */
class PrizeItemEntity {
  late String title;
  late String iconName;
  late bool archived;

  PrizeItemEntity({required this.title,required this.iconName, required this.archived});
}

/*
* 1.某一栏大标题奖项；
* 2.奖项图标数据管理Model
* */
class PrizePageModel {
  late String title;
  late List<PrizeItemEntity> items;

  PrizePageModel({required this.title, required this.items});

  /*
  * 获取全部渲染奖项数据
  * */
  static List<PrizePageModel> pages() {
   final List<PrizePageModel> ret = [];
   for(var i = 0;i < 5; i++){
     final page = PrizePageModel.generatePage(i);
     ret.add(page);
   }
   return ret;
  }

  /*
  * 生成某一栏奖项数据
  * */
  static PrizePageModel generatePage(int index) {
    switch(index) {
      case 0:
      // section
      final item1 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: false);

      // page
      final page1 = PrizePageModel(title: "加油", items: [item1]);
      return page1;

      default:
      // section
        final item1 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: false);
        final item2 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: true);
        final item3 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: true);
        final item4 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: true);
        final item5 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: true);
        final item6 = PrizeItemEntity(title: "七月挑战", iconName: "assets/images/share_icon.png", archived: true);
        // page
        final page1 = PrizePageModel(title: "加油", items: [item1,item2,item3,item4,item5,item6]);
        return page1;
    }
  }

}