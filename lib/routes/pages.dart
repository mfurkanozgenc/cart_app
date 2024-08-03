import 'package:get/get.dart';
import 'package:proje/pages/admin/customersPage/customers_binding.dart';
import 'package:proje/pages/admin/customersPage/customers_view.dart';
import 'package:proje/pages/admin/settingsPage/settings_binding.dart';
import 'package:proje/pages/admin/settingsPage/settings_view.dart';
import 'package:proje/pages/cartPage/cart_binding.dart';
import 'package:proje/pages/cartPage/cart_view.dart';
import 'package:proje/pages/publicPages/navbar/navbar_binding.dart';
import 'package:proje/pages/publicPages/navbar/navbar_view.dart';
import 'package:proje/pages/user/createUser/createUser_bingind.dart';
import 'package:proje/pages/user/createUser/createUser_view.dart';
import 'package:proje/pages/loginPage/login_binding.dart';
import 'package:proje/pages/loginPage/login_view.dart';
import 'package:proje/pages/user/userHomePage/userHome_binding.dart';
import 'package:proje/pages/user/userHomePage/userHome_view.dart';
import 'package:proje/routes/routes.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.LoginPage,
        page: () => LoginView(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.CartPage, page: () => CartView(), binding: CartBinding()),
    GetPage(
        name: Routes.SettingPage,
        page: () => SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: Routes.CustomersPage,
        page: () => CustomersView(),
        binding: CustomersBinding()),
    GetPage(
        name: Routes.CreateUserPage,
        page: () => CreateUserView(),
        binding: CreateUserBingind()),
    GetPage(
        name: Routes.UserHomePage,
        page: () => UserHomeView(),
        binding: UserHomeBinding()),
  ];
}
