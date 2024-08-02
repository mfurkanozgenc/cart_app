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
      services.databaseService.loginInfo = 'Giriş Başarılı,Hoşgeldiniz';
      Get.toNamed(Routes.HomePage);
    } else {
      Get.snackbar('HATA', 'Giriş Yapılamadı !',
          backgroundColor: Colors.white, colorText: Colors.deepOrange);
    }
  }
}
