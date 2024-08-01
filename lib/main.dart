import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:proje/pages/loginPage/login_view.dart';
import 'package:proje/routes/pages.dart';
import 'package:proje/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      getPages: Pages.pages,
      initialRoute: Routes.LoginPage,
    );
  }
}
