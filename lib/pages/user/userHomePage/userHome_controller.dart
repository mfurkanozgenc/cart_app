import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/models/userModel.dart';

class UserHomeController extends GetxController with BaseState {
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
}
