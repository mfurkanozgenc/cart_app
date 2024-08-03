import 'package:get/get.dart';
import 'package:proje/pages/user/createUser/createUser_controller.dart';

class CreateUserBingind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateUserController());
  }
}
