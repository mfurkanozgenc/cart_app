import 'package:get/get.dart';
import 'package:proje/pages/admin/customersPage/customers_controller.dart';

class CustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomersController());
  }
}
