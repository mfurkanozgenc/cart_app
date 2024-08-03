import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/routes/routes.dart';

class LoginController extends GetxController with BaseState {
  var userName = TextEditingController().obs;
  var password = TextEditingController().obs;

  Future<void> login() async {
    var result = await services.actionService
        .login(userName.value.text, password.value.text);
    if (result) {
      if (services.databaseService.isAdmin) {
        Get.toNamed(Routes.SettingPage);
      } else {
        Get.toNamed(Routes.UserHomePage);
      }
    } else {
      Get.snackbar('HATA', 'Giriş Yapılamadı !',
          backgroundColor: Colors.white, colorText: Colors.deepOrange);
    }
  }

  void openCreatePage() {
    Get.toNamed(Routes.CreateUserPage);
  }
}


    // services.actionService.addUser(
    //     fullName: 'Mustafa Furkan Özgenç',
    //     email: 'furkanozgenc@hotmail.com',
    //     password: '397249',
    //     isAdmin: true,
    //     image: '');