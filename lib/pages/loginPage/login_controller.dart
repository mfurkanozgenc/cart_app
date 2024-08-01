import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/Base/BaseController.dart';
import 'package:proje/routes/routes.dart';

class LoginController extends BaseController {
  var userName = TextEditingController().obs;
  var password = TextEditingController().obs;

  void Login() {
    userName.value.text = 'Mustafa Furkan Özgenç';
    // Get.to(HomeView(), transition: Transition.downToUp);
    Get.toNamed(Routes.HomePage);
    // Get.snackbar('Başarılı', 'Anasayfa Gidildi',
    //     backgroundColor: Colors.deepOrange, colorText: Colors.white);
  }
}
