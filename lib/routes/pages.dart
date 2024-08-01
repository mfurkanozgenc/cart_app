import 'package:get/get.dart';
import 'package:proje/pages/homePage/home_binding.dart';
import 'package:proje/pages/homePage/home_view.dart';
import 'package:proje/pages/loginPage/login_binding.dart';
import 'package:proje/pages/loginPage/login_view.dart';
import 'package:proje/routes/routes.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.LoginPage,
        page: () => const LoginView(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.HomePage,
        page: () => const HomeView(),
        binding: HomeBindings())
  ];
}
