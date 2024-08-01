import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:proje/pages/homePage/home_controller.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class Basebindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        HomeController()); // Sayfada controller kullanılmadan oluşturmaz ramde yer kaplamaz
    Get.lazyPut(() => LoginController());
  }
}
