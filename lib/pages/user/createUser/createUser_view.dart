import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/user/createUser/createUser_controller.dart';

class CreateUserView extends GetView<CreateUserController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: constants.colors.generalColor,
            width: Get.width,
            height: Get.height * .1,
            child: Center(
                child: Text(
              'Kayıt Olun'.toUpperCase(),
              style: TextStyle(color: constants.colors.titleTextColor),
            )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Form(
                  key: controller.formKey.value,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          height: Get.height * .25,
                          width: Get.height * .25,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Card(
                                shape: const CircleBorder(),
                                elevation: 10,
                                child: Obx(
                                  () => ClipOval(
                                    child: controller.base64Image.value != null
                                        ? Image.memory(
                                            base64Decode(
                                                controller.base64Image.value!),
                                            width: Get.height * .25,
                                            height: Get.height * .25,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/user.png',
                                            width: Get.height * .25,
                                            height: Get.height * .25,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    hoverColor: Colors.transparent,
                                    icon: Icon(Icons.add,
                                        color: constants.colors.generalColor),
                                    onPressed: () async {
                                      await controller.pickAndUploadImage();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen Ad-Soyad Giriniz';
                            }
                            if (value.length < 3) {
                              return 'En Az 3 Karakter Olacak Şekilde Giriniz';
                            }
                          },
                          controller: controller.fulName.value,
                          decoration: InputDecoration(
                              label: Text(
                                'Ad-Soyad',
                                style: TextStyle(
                                    color: constants.colors.enabledColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.focusedBorder)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledBorder)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller.description.value,
                          decoration: InputDecoration(
                              label: Text(
                                'Detay',
                                style: TextStyle(
                                    color: constants.colors.enabledColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.focusedBorder)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledBorder)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen Mail Giriniz';
                            }
                            String pattern =
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Lütfen Geçerli Bir Mail Giriniz';
                            }
                          },
                          controller: controller.email.value,
                          decoration: InputDecoration(
                              label: Text(
                                'Email',
                                style: TextStyle(
                                    color: constants.colors.enabledColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.focusedBorder)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledBorder)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen Şifre Giriniz';
                            }
                            if (value.length < 6) {
                              return 'En Az 6 Karakter Olacak Şekilde Giriniz';
                            }
                          },
                          controller: controller.password.value,
                          decoration: InputDecoration(
                              label: Text(
                                'Şifre',
                                style: TextStyle(
                                    color: constants.colors.enabledColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.focusedBorder)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledBorder)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen Şifre Tekrarı Giriniz';
                            }
                            if (controller.password.value.text !=
                                controller.againPassword.value.text) {
                              return 'Lütfen Şifreler Eşleşmemekte';
                            }
                          },
                          controller: controller.againPassword.value,
                          decoration: InputDecoration(
                              label: Text(
                                'Şifre Tekrar',
                                style: TextStyle(
                                    color: constants.colors.enabledColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.focusedBorder)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.enabledBorder)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: constants.colors.errorBorder))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: controller.createUser,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize:
                                  Size(Get.width * .7, Get.height * .06),
                              backgroundColor: constants.colors.generalColor),
                          child: const Text('Kayıt Ol'),
                        ),
                      ),
                      TextButton(
                          onPressed: controller.openLoginPage,
                          child: Text(
                            'Giriş Ekranına Geri Dön',
                            style:
                                TextStyle(color: constants.colors.enabledColor),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
