import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: AppLayout.height(78),
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    "欢迎使用“健身”",
                    style: AppTextStyle.headLine1,
                  )))
                ],
              ),
              SizedBox(
                height: AppLayout.height(48),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/ring_icon.png',
                    width: AppLayout.height(64),
                    height: AppLayout.height(64),
                  ),
                  SizedBox(
                    width: AppLayout.height(8),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '查看健身记录',
                        style: AppTextStyle.title,
                      ),
                      Text(
                        '密切了解圆环、体能训练、奖章和趋势状况',
                        style: AppTextStyle.subTitle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: AppLayout.height(16),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/share_icon.png',
                    width: AppLayout.height(64),
                    height: AppLayout.height(64),
                  ),
                  SizedBox(
                    width: AppLayout.height(8),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '查看健身记录',
                        style: AppTextStyle.title,
                      ),
                      Text(
                        '密切了解圆环、体能训练、奖章和趋势状况',
                        style: AppTextStyle.subTitle,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                  child: Container(
                    height: AppLayout.height(44),
                    width:
                        AppLayout.screenSize.width - AppLayout.height(16 * 2),
                    margin: EdgeInsets.only(
                        left: AppLayout.height(16),
                        right: AppLayout.height(16)),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E2C31),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppLayout.height(6))),
                    ),
                    child: const Text(
                      "继续",
                      style: AppTextStyle.headLine2,
                    ),
                  ),
                  onTap: continueOnTap),
              SizedBox(height: AppLayout.height(88),)    
            ],
          ),
        ],
      ),
    );
  }

  continueOnTap() {
    print("continueOnTap");
  }
}
