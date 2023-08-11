import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

enum AccountAction {
  userInfo(value: 10),

  healthDetail(value: 20),
  changeTarget(value: 21),
  measureUnit(value: 22),

  notification(value: 30),

  checkInChargeCode(value: 40),
  checkInChargeByEmail(value: 41),

  appleFitnessPrivacy(value:50);

  const AccountAction({Key? key, required this.value});
  final int value;

}

class _AccountViewState extends State<AccountView>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: Scaffold(
        backgroundColor: AppColor.gray0,
        appBar:  AppBar(
          elevation: 0,
          backgroundColor: AppColor.gray0,
          automaticallyImplyLeading: false,
          title: const Text(
            "帐户",
            style: AppTextStyle.title,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "完成",
                  style: AppTextStyle.title.copyWith(color: AppColor.primary),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // head line section 1
              Card(
                elevation: 0,
                color: AppColor.gray1,
                shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(AppLayout.height(8)))),
                margin: EdgeInsets.only(top: AppLayout.height(24),left: AppLayout.height(16),bottom: 0,right: AppLayout.height(16)),
                child: Container(
                  padding: EdgeInsets.all(AppLayout.height(12)),
                  child: GestureDetector(
                    onTap: ()=> _onTap(AccountAction.userInfo),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22))
                          ),
                          child: const Icon(Icons.face, size: 44,color: Colors.white),
                        ),
                        SizedBox(width: AppLayout.height(4),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("谢xx",
                            style: AppTextStyle.title
                              ,),
                            Text("xxxx@xxx.com",
                              style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                      ],
                    ),
                  ),
                ),
              ),
              // section 2
              Card(
                elevation: 0,
                color: AppColor.gray1,
                shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(AppLayout.height(8)))),
                margin: EdgeInsets.only(top: AppLayout.height(24),left: AppLayout.height(16),bottom: 0,right: AppLayout.height(16)),
                child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.healthDetail),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("健康详细信息",
                                    style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                                ],
                              ),
                            ),
                            Divider(height: 1,color: AppColor.primaryContainerBg,indent: AppLayout.height(8),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.changeTarget),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("更改活动目标",
                                    style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                                ],
                              ),
                            ),
                            Divider(height: 1,color: AppColor.primaryContainerBg,indent: AppLayout.height(8),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.measureUnit),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("测量单位",
                                    style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
    
              // section 3
              Card(
                  elevation: 0,
                  color: AppColor.gray1,
                  shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(AppLayout.height(8)))),
                  margin: EdgeInsets.only(top: AppLayout.height(24),left: AppLayout.height(16),bottom: 0,right: AppLayout.height(16)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.notification),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("通知",
                                    style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
    
              // section 4
              Card(
                  elevation: 0,
                  color: AppColor.gray1,
                  shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(AppLayout.height(8)))),
                  margin: EdgeInsets.only(top: AppLayout.height(24),left: AppLayout.height(16),bottom: 0,right: AppLayout.height(16)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.checkInChargeCode),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("兑换充值卡或代码",
                                    style: AppTextStyle.subtitle15.copyWith(color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1,color: AppColor.primaryContainerBg,indent: AppLayout.height(8),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.checkInChargeByEmail),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("通过电子邮件发送充值卡",
                                    style: AppTextStyle.subtitle15.copyWith(color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
    
              // section 5
              Card(
                  elevation: 0,
                  color: AppColor.gray1,
                  shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(AppLayout.height(8)))),
                  margin: EdgeInsets.only(top: AppLayout.height(24),left: AppLayout.height(16),bottom: 0,right: AppLayout.height(16)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _onTap(AccountAction.appleFitnessPrivacy),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Apple\"健身\"隐私",
                                    style: AppTextStyle.subtitle15.copyWith(color: Colors.white),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,size: 20,color: AppColor.gray2,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(AccountAction action){
    print(action);

    switch (action) {
      case AccountAction.userInfo:
        // TODO: Handle this case.
        Navigator.of(context).pushNamed("/login/");
        break;
      case AccountAction.healthDetail:
        // TODO: Handle this case.
        break;
      case AccountAction.changeTarget:
        // TODO: Handle this case.
        break;
      case AccountAction.measureUnit:
        // TODO: Handle this case.
        break;
      case AccountAction.notification:
        // TODO: Handle this case.
        break;
      case AccountAction.checkInChargeCode:
        // TODO: Handle this case.
        break;
      case AccountAction.checkInChargeByEmail:
        // TODO: Handle this case.
        break;
      case AccountAction.appleFitnessPrivacy:
        // TODO: Handle this case.
        break;
    }
  }
}
