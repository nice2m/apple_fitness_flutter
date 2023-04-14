import 'dart:io';
import 'dart:ui';
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

  // 基础色 绿色
  static const primary = Color(0xFFABFD33);
  // 基础背景色 深灰色
  static const primaryBg = Color(0xFF1F1C21);
}

class AppTextStyle {
  static const headLine1 = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w800, color: AppColor.title);
  static const headLine2 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.title);

  static const title = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: AppColor.title);
  static const subTitle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: AppColor.subtitle);
}
