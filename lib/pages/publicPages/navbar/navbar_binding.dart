import 'package:get/get.dart';
import 'package:proje/pages/publicPages/navbar/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
  }
}
