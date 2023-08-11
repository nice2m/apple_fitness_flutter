import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  late TextEditingController _userName;
  late TextEditingController _password;

  @override
  void initState() {
    _userName = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 28, 33, 1),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColor.primary,
        backgroundColor: AppColor.primaryBg,
        title: const Text(
          "注册",
          style: AppTextStyle.title,
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _userName,
            style: AppTextStyle.title,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(AppLayout.height(12)),
              hintStyle: AppTextStyle.subtitle15,
              hintText: "请输入帐号",
              ),
          ),
          TextField(
            controller: _userName,
            keyboardType: TextInputType.visiblePassword,
            style: AppTextStyle.title,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(AppLayout.height(12)),
                hintStyle: AppTextStyle.subtitle15,
                hintText: "请输入密码"
              ),
          ),
          SizedBox(height: AppLayout.height(33),),

          TextButton(
            onPressed: _onRegist, child: const Text("注册",
          style: AppTextStyle.title,)),

        ],
      ),
    );
  }
  void _onRegist(){
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _userName.text, password: _password.text);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException$e");
    }
  }
}