import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class LoginView extends GetView<LoginController> with BaseState {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: constants.colors.generalColor,
                borderRadius: BorderRadius.circular(10)),
            height: Get.height * 0.2,
            width: Get.width,
            child: Center(
                child: Text(
              'HOŞGELDİNİZ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: constants.colors.titleTextColor),
            )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: Get.width * 0.8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text(
                                'Kullanıcı Adı',
                                style: TextStyle(
                                    color:
                                        constants.colors.textFieledLabelColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: constants.colors.generalColor),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledColor),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text(
                                'Şifre',
                                style: TextStyle(
                                    color:
                                        constants.colors.textFieledLabelColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: constants.colors.generalColor),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledColor),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: constants.colors.generalColor,
                                minimumSize: Size(Get.width * .7, 50)),
                            onPressed: controller.login,
                            child: const Text('Giriş Yap')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Kayıt Ol',
                            style:
                                TextStyle(color: constants.colors.enabledColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height * .05,
            width: Get.width,
            color: Colors.transparent,
            child: Center(child: Text(constants.globalConstants.appVersion)),
          ),
        ],
      ),
    );
  }
}
