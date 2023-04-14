import 'package:apple_fitness_flutter/components/welcome_screen_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback continueCallBack;
  const WelcomeScreen({super.key, required this.continueCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg,
      body: SizedBox(
        width: AppLayout.widthOf(context),
        height: AppLayout.heightOf(context),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: AppLayout.height(96),
            ),
            Row(
              children: const [
                Expanded(
                    child: Center(
                        child: Text(
                  "欢迎使用“健身”",
                  style: AppTextStyle.headLine1,
                )))
              ],
            ),
            SizedBox(
              height: AppLayout.height(68),
            ),
            const WelcomeScreenRow(
                assetImgUri: "assets/images/ring_icon.png",
                title: "查看健身记录",
                des: "密切了解圆环、体能训练、奖章和趋势状况。"),
            SizedBox(
              height: AppLayout.height(22),
            ),
            const WelcomeScreenRow(
                assetImgUri: "assets/images/share_icon.png",
                title: "与他人共享",
                des: "所有人都合上圆环时，为好友喝彩。"),
            const Spacer(),
            GestureDetector(
              onTap: continueOnTap,
              child: Container(
                height: AppLayout.height(44),
                width: AppLayout.widthOf(context) - AppLayout.height(16 * 2),
                margin: EdgeInsets.only(
                    left: AppLayout.height(16), right: AppLayout.height(16)),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E2C31),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppLayout.height(12))),
                ),
                child: const Center(
                    child: Text(
                  "继续",
                  style: AppTextStyle.headLine2,
                )),
              ),
            ),
            SizedBox(
              height: AppLayout.height(82),
            )
          ],
        ),
      ),
    );
  }

  continueOnTap() {
    print("continueOnTap");
    continueCallBack();
  }
}
