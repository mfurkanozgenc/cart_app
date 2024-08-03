import 'package:get/get.dart';
import 'package:proje/pages/user/userHomePage/userHome_controller.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserHomeController());
  }
}
