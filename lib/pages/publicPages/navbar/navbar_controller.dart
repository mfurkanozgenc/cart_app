import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/models/userModel.dart';
import 'package:proje/routes/routes.dart';

class NavbarController extends GetxController with BaseState {
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
    user.value = services.databaseService.loginUser;
    if (user.value.fullName.isEmpty) {
      user.value = (await services.storageService.refreshPage())!;
    }
  }

  void exitToApp() {
    services.storageService.DeleteData('CartAppUserInfo');
    Get.offAllNamed(Routes.LoginPage);
  }
}
