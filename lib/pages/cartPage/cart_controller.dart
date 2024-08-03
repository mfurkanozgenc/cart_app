import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/core/base/base_state.dart';

class CartController extends GetxController with BaseState {
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
      // services.actionService.addUser(
      //     fullName: 'Mustafa Furkan Özgenç', image: base64Image.value!);
    }
  }
}
