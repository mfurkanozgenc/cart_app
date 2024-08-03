import 'package:get/get.dart';
import 'package:proje/pages/admin/settingsPage/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
