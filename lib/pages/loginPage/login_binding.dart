import 'package:get/get.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
