import 'package:get/get.dart';
import 'package:proje/pages/homePage/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
