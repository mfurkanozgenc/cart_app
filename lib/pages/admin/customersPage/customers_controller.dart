import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/routes/routes.dart';

class CustomersController extends GetxController with BaseState {
  void exitToApp() {
    Get.offAllNamed(Routes.LoginPage);
  }
}
