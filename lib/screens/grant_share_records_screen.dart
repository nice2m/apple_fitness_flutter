import 'package:apple_fitness_flutter/components/welcome_screen_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class GrantShareRecordsScreen extends StatelessWidget {
  final VoidCallback continueCallBack;
  const GrantShareRecordsScreen({super.key, required this.continueCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBg2,
        body: Container(
          
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                child: Column(children: [
                  SizedBox(height: 72),
                  //TODO: 生成动画
                  Placeholder(
                    fallbackHeight: 192,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26,left: 40,right: 40),
                    child: Text(
                      "共享“健身记录”",
                      style: AppTextStyle.headLine0.copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 40, bottom: 12, right: 40),
                    child: Text(
                      "邀请朋友与您互相支持、共同挑战并为彼此加油。通过“健身”App即可轻松共享体能训练、接收进度通知并发送信息。",
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.subtitle3.copyWith(fontWeight: FontWeight.w300,fontSize: 20),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                child: Column(children: [
                  Icon(
                    Icons.handshake,
                    color: AppColor.primary,
                    size: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,left: 8,bottom: 0,right: 8),
                    child: Text(
                      "体能训练类型和名称、动态卡路里或千焦、锻炼分钟数、站立或转动小时数、步数以及时区等健身记录数据将与你选择的用户安全共享。",
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.subtitle5,
                    ),
                  ),
                  GestureDetector(
                    onTap: knowDataManagement,
                    child: Text(
                      "了解数据的管理方式...",
                      style: AppTextStyle.subtitle5
                          .copyWith(color: AppColor.primary),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32,left: 16,bottom: 32,right: 16),
                    child: GestureDetector(
                      onTap: continueCallBack,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColor.gray0,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "开始使用",
                                style: AppTextStyle.subtitle3,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ),
                        ),
                    ),
                  ),
                ]),
              )
            ]),
          
        ));
  }

  void continueOnTap() {
    continueCallBack();
  }

  void knowDataManagement() {
    print("data management");
  }
}
