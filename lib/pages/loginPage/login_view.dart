import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => TextField(
              controller: controller.userName.value,
            ),
          ),
          ElevatedButton(
              onPressed: controller.Login, child: const Text('Giriş Yap'))
        ],
      ),
    );
  }
}
