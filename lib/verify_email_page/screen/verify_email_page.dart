import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/app_layout.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 28, 33, 1),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColor.primary,
        backgroundColor: AppColor.primaryBg,
        title: const Text(
          "验证邮箱",
          style: AppTextStyle.title,
        ),

      ),
      body: Column(
        children: [
          const Center(child: Text("请验证您的邮箱地址",style: AppTextStyle.title,)),
          const SizedBox(height: 64,),
          TextButton(
              onPressed: _onResendVerifyEmail,
              child: const Text(
                "发送验证邮件",
                style: AppTextStyle.title,
              ))
        ],
      ),
    );
  }

  void _onResendVerifyEmail() {
    print("_onRegist");
    final user = FirebaseAuth.instance.currentUser;
    user?.sendEmailVerification();
  }
}
