import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/models/userModel.dart';

class UserHomeController extends GetxController with BaseState {
  var base64Image = Rxn<String>();
  var imageUrl = Rxn<String>();
  late List<String> useList;
  UploadTask? uploadTask;

  Rx<UserModel> user = UserModel(
          password: '',
          image: '',
          email: '',
          date: DateTime.now(),
          isAdmin: false,
          fullName: '',
          description: '')
      .obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    user.value = (await services.storageService.refreshPage())!;
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      String fileName = pickedFile.name;
      base64Image.value = base64Encode(fileBytes);
    }
  }
}
