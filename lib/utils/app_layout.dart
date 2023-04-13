import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppLayout {
  static const double standartScreenHeight = 667.0;
  static const double standartScreenWidth = 375.0;
  static Size screenSize =  Get.size;

  static double height(double height) {
    final ratio = screenSize.height / standartScreenHeight;
    return height * ratio;
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

  static const headLine1 = TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: AppColor.title);
  static const headLine2 = TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColor.title);

  static const title = TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.title);
  static const subTitle = TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: AppColor.subtitle);
}