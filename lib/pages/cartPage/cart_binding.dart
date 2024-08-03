import 'package:get/get.dart';
import 'package:proje/pages/cartPage/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
