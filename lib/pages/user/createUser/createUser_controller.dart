import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/routes/routes.dart';

class CreateUserController extends GetxController with BaseState {
  final formKey = GlobalKey<FormState>().obs;
  final fulName = TextEditingController().obs;
  final description = TextEditingController().obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final againPassword = TextEditingController().obs;

  var base64Image = Rxn<String>();
  var imageUrl = Rxn<String>();
  UploadTask? uploadTask;

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      String fileName = pickedFile.name;
      base64Image.value = base64Encode(fileBytes);
    }
  }

  Future<void> createUser() async {
    if (formKey.value.currentState!.validate()) {
      String imageBase64 = base64Image.value ?? '';
      var result = await services.actionService.addUser(
          fullName: fulName.value.text,
          image: imageBase64,
          isAdmin: false,
          email: email.value.text,
          password: password.value.text,
          description: description.value.text);

      if (result) {
        Get.snackbar('Başarılı', 'Kayıt İşlemi Başarıyla Tamamlandı !',
            backgroundColor: Colors.white, colorText: Colors.deepOrange);
        Get.toNamed(Routes.LoginPage);
      } else {
        Get.snackbar('Hata', 'Kayıt İşlemi Tamamlanamadı !',
            backgroundColor: Colors.white, colorText: Colors.deepOrange);
      }
    }
  }

  void openLoginPage() {
    Get.toNamed(Routes.LoginPage);
  }
}
