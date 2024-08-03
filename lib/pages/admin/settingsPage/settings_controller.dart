import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/routes/routes.dart';

class SettingsController extends GetxController with BaseState {
  var base64Image = Rxn<String?>();
  var name = TextEditingController().obs;
  var imageUrl = Rxn<String>();
  var formKey = GlobalKey<FormState>().obs;
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

  void exitToApp() {
    Get.offAllNamed(Routes.LoginPage);
  }

  void clear() {
    name.value.text = '';
    base64Image.value = '';
  }

  Future<void> addSetting(BuildContext context) async {
    if (formKey.value.currentState!.validate()) {
      String imageBase64 = base64Image.value ?? '';
      var result = await services.actionService
          .addSetting(name: name.value.text, icon: imageBase64);
      if (result.isNotEmpty) {
        if (result == 'success') {
          Navigator.pop(context);
        } else {
          Get.snackbar('Hata', result,
              backgroundColor: constants.colors.titleTextColor,
              colorText: constants.colors.generalColor);
        }
      }
    }
  }

  Future<void> updateSetting(BuildContext context, String id) async {
    if (formKey.value.currentState!.validate()) {
      String imageBase64 = base64Image.value ?? '';
      var result = await services.actionService
          .updateSetting(name: name.value.text, icon: imageBase64, id: id);
      if (result.isNotEmpty) {
        if (result == 'success') {
          Navigator.pop(context);
        } else {
          Get.snackbar('Hata', result,
              backgroundColor: constants.colors.titleTextColor,
              colorText: constants.colors.generalColor);
        }
      }
    }
  }

  Future<void> deleteSetting(String id) async {
    var result = await services.actionService.deleteSetting(id: id);
  }
}
