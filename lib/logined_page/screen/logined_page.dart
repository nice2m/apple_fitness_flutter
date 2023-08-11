import 'package:apple_fitness_flutter/firebase_options.dart';
import 'package:apple_fitness_flutter/login_page/screen/login_view.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

class LoginedPage extends StatefulWidget {
  const LoginedPage({super.key});

  @override
  State<LoginedPage> createState() => _LoginedPageState();
}

enum MenuAction {
  logout;
}

class _LoginedPageState extends State<LoginedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 28, 33, 1),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColor.primary,
        backgroundColor: AppColor.primaryBg,
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final navigator = Navigator.of(context);
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  FirebaseAuth.instance.signOut();
                  navigator.pushNamedAndRemoveUntil('/login/', (_) => false);
                }
                break;
            }
          }, itemBuilder: (contetxt) {
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text(
                  "退出登录",
                  style: AppTextStyle.subTitle,
                ),
              )
            ];
          }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Icon(Icons.heart_broken,size: 44,color: Colors.white,),),
          SizedBox(height: AppLayout.height(16),),
          const Text(
          "登录成功",
          style: AppTextStyle.title,
        ),
        ],
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: AppColor.primaryBg,
            title: const Text(
              "温馨提示",
              style: AppTextStyle.title,
            ),
            contentPadding: EdgeInsets.all(AppLayout.height(16)),
            content: const Text(
              "确认要退出登录？",
              style: AppTextStyle.subTitle,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    "退出登录",
                    style: AppTextStyle.subTitle2,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    "取消",
                    style: AppTextStyle.subTitle2,
                  ))
            ]);
      }).then((value) => value);
}
