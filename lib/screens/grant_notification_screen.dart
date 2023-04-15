import 'package:apple_fitness_flutter/components/welcome_screen_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class GrantNotificationScreen extends StatelessWidget {
  final VoidCallback continueCallBack;
  const GrantNotificationScreen({super.key, required this.continueCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg2,
      body: SizedBox(
        width: AppLayout.widthOf(context),
        height: AppLayout.heightOf(context),
        child: Flex(
          direction: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 395,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: 88,
                        left: 32,
                        right: 32),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColor.gray0,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32),
                              topLeft: Radius.circular(32))),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16),
                        child: Column(children: [
                          SizedBox(
                            height: 88,
                          ),
                          const Text(
                            "09:41",
                            style: AppTextStyle.title2,
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColor.gray1,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor.primaryBg,
                                      offset: const Offset(10, 10),
                                      blurRadius: 5)
                                ],
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppLayout.width(16))),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(AppLayout.width(12)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/ring_icon.png",
                                      height: AppLayout.width(44),
                                      width: AppLayout.width(44),
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: AppLayout.width(12),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            height: AppLayout.height(12),
                                            width: AppLayout.width(70),
                                            decoration: BoxDecoration(
                                              color: AppColor.gray2,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      AppLayout.height(4))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppLayout.height(6),
                                          ),
                                          Container(
                                            height: AppLayout.height(6),
                                            width: AppLayout.width(200),
                                            decoration: BoxDecoration(
                                              color: AppColor.gray2,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      AppLayout.height(4))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppLayout.height(6),
                                          ),
                                          Container(
                                            height: AppLayout.height(6),
                                            width: AppLayout.width(200),
                                            decoration: BoxDecoration(
                                              color: AppColor.gray2,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      AppLayout.height(4))),
                                            ),
                                          ),
                                        ])
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 49,
                          ),
                        ]),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 390,
              child: Container(
                padding: EdgeInsets.only(
                    top: AppLayout.height(16),
                    left: AppLayout.width(16),
                    right: AppLayout.width(16)),
                color: AppColor.primaryBg3,
                child: Column(children: [
                  SizedBox(
                    child: Text(
                      "接收“健身”通知，保持活力",
                      style: AppTextStyle.headLine0,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.height(16),
                  ),
                  SizedBox(
                    width: AppLayout.width(305),
                    child: const Text(
                      "通知可助你合上圆环、查看趋势和为朋友加油。",
                      style: AppTextStyle.subTitle2,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: continueOnTap,
                    child: Container(
                      height: 48,
                      width:
                          AppLayout.widthOf(context) - 16 * 2,
                      margin: const EdgeInsets.only(
                          left: 16,
                          right: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2C31),
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppLayout.height(12))),
                      ),
                      child: const Center(
                          child: Text(
                        "继续",
                        style: AppTextStyle.headLine2,
                      )),
                    ),
                  ),
                  const SizedBox(height: 50,)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  continueOnTap() {
    continueCallBack();
  }
}
