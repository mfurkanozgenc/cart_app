import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/pages/homePage/home_controller.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(loginController.userName.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
