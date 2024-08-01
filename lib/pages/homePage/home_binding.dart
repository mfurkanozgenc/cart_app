import 'package:get/get.dart';
import 'package:proje/pages/homePage/home_controller.dart';
import 'package:proje/pages/loginPage/login_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        HomeController()); // Sayfada controller kullanılmadan oluşturmaz ramde yer kaplamaz
    Get.lazyPut(() => LoginController());
  }
}
