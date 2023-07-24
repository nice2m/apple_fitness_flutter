import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static const double standardScreenHeight = 667.0;
  static const double standardScreenWidth = 375.0;
  static Size screenSize = Get.size;

  static double height(double height) {
    final ratio = screenSize.height / standardScreenHeight;
    return height * ratio;
  }

  static double width(double width) {
    final ratio = screenSize.width / standardScreenWidth;
    return width * ratio;
  }

  static Size sizeOf(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double heightOf(BuildContext context) {
    return AppLayout.sizeOf(context).height;
  }

  static double widthOf(BuildContext context) {
    return AppLayout.sizeOf(context).width;
  }
}

class AppColor {
  
  //  标题颜色 白色
  static const title = Color(0xFFFFFFFF);
  // 副标题颜色 灰色
  static const subtitle = Color(0xFF868488);

  static const subtitle2 = Color(0xFFA1A0A7);

  // 基础色 绿色
  static const primary = Color(0xFFABFD33);
  // 基础背景色 深灰色
  static const primaryBg = Color(0xFF1F1C21);

  static const primaryBg2 = Color(0xFF080508);

  static const primaryBg3 = Color(0xFF1F1C21);

  static const primaryRed = Color(0xFFFD1153);

  // app 中默认黑色
  static const primaryBlack = Color(0xff000102);

  // controller 基础容器，背景色
  static const primaryContainerBg = Color(0xFF020002);

  static const gray0 = Color(0xFF2E2B2E);

  static const gray1 = Color(0xFF505052);

  static const gray2 = Color(0xFF7F7E85);
}

class AppTextStyle {
  static const headLine0 = TextStyle(
      fontSize: 38, fontWeight: FontWeight.w800, color: AppColor.title);

  static const headLine1 = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w800, color: AppColor.title);

  static const headLine2 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.title);

  static const title = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: AppColor.title);

  static const title2 = TextStyle(
      fontSize: 70, fontWeight: FontWeight.w300, color: AppColor.subtitle2);

  static const subTitle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: AppColor.subtitle);

  static const subtitle3 = TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: AppColor.title);

  static const subtitle15 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: AppColor.subtitle2);

  static const subtitle4 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: AppColor.title);

  static const subtitle5 = TextStyle(
      fontSize: 13, fontWeight: FontWeight.normal, color: AppColor.subtitle2);


  static const subTitle2 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, color: AppColor.subtitle);
}
