import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/homePage/home_controller.dart';

class HomeView extends GetView<HomeController> with BaseState {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(services.databaseService.loginInfo),
            ),
          ],
        ),
      ),
    );
  }
}
