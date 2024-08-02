import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class LoginView extends GetView<LoginController> with BaseState {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: constants.colors.generalColor,
        child: Column(
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
      ),
    );
  }
}
