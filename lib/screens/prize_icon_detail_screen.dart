import 'package:apple_fitness_flutter/components/fapp_bar.dart';
import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class PrizeItemDetailScreen extends StatefulWidget {
  final PrizePageItemEntity? page;
  final PrizeItemEntity entity;

  const PrizeItemDetailScreen({super.key, this.page, required this.entity});

  @override
  State<PrizeItemDetailScreen> createState() => _PrizeItemDetailScreenState();
}

class _PrizeItemDetailScreenState extends State<PrizeItemDetailScreen> {
  double x = 0;
  bool isIdentity = true;
  bool initAnimated = false;
  bool gestureEnded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryContainerBg,
      appBar: FAppBar.backTitled("奖章", () {
        Navigator.of(context).pop();
      }, [
        IconButton(
            onPressed: () => _shareOnClick(),
            icon: const Icon(
              Icons.ios_share,
              size: 28,
              color: AppColor.primary,
            ))
      ]),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              Padding(
                padding: EdgeInsets.only(
                    left: AppLayout.width(4), right: AppLayout.width(4)),
                child: Column(
                  children: [
                    Text(
                      widget.entity.title,
                      style: AppTextStyle.subtitle4,
                    ),
                    Text(
                      widget.entity.archiveDes,
                      style: AppTextStyle.subtitle5,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage() {
    // 如果动画没有执行过，那么返回自动动画播放，否则进入常规展示
    if (!initAnimated) {
      initAnimated = true;
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: TweenAnimationBuilder(
            // curve: Curves.linearToEaseOut,
            tween: Tween(begin: -2.0, end: 2.0),
            duration: const Duration(milliseconds: 1000),
            onEnd: () {
              setState(() {});
            },
            builder: (BuildContext context, value, Widget? child) {
              return Transform(
                transform: Matrix4.identity()
                  // 沿着x轴旋转
                  ..rotateY(value),
                // Matrix4.identity(
                //   1, 0, 0, 0,
                //   0, 1, 0, 0,
                //   0, 0, 1, 0,
                //   0, 0, 0, 1,
                // )..rotateX(x),
                alignment: FractionalOffset.center,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(150)),
                      border:
                          Border.all(width: 1.5, color: AppColor.primaryRed),
                      image: DecorationImage(
                          image: AssetImage(widget.entity.iconName),
                          fit: BoxFit.contain)),
                ),
              );
            }),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Transform(
        transform: isIdentity ? Matrix4.identity() : Matrix4.identity()
          // 沿着x轴旋转
          ..rotateY(x),
        // Matrix4.identity(
        //   1, 0, 0, 0,
        //   0, 1, 0, 0,
        //   0, 0, 1, 0,
        //   0, 0, 0, 1,
        // )..rotateX(x),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanEnd: (details) {
            setState(() {
              isIdentity = true;
              gestureEnded = true;
              x = 0;
            });
          },
          onPanUpdate: (details) {
            setState(() {
              isIdentity = false;
              x = x + details.delta.dx / 50;
            });
          },
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(150)),
                border: Border.all(width: 1.5, color: AppColor.primaryRed),
                image: DecorationImage(
                    image: AssetImage(widget.entity.iconName),
                    fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }

  //TODO: 展示苹果分享弹框，分享页
  _shareOnClick() {
    // 点击分享按钮；
    print("_shareOnClick");
  }
}
