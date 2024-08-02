import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/routes/routes.dart';

class LoginController extends GetxController with BaseState {
  var userName = TextEditingController().obs;
  var password = TextEditingController().obs;

  void Login() {
    userName.value.text = 'Mustafa Furkan Özgenç';
    // Get.to(HomeView(), transition: Transition.downToUp);
    services.databaseService.loginInfo = 'Giriş Başarılı,Hoşgeldiniz';
    // Get.toNamed(Routes.HomePage);
    Get.offNamedUntil(
        Routes.HomePage, (route) => route.settings.name == Routes.HomePage);
    // Get.snackbar('Başarılı', 'Anasayfa Gidildi',
    //     backgroundColor: Colors.deepOrange, colorText: Colors.white);
  }
}
