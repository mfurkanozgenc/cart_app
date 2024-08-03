import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/user/userHomePage/userHome_controller.dart';

class UserHomeView extends GetView<UserHomeController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.user.value.fullName)),
      ),
    );
  }
}
