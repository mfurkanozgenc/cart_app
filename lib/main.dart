import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proje/firebase_options.dart';
import 'package:proje/pages/publicPages/navbar/navbar_controller.dart';
import 'package:proje/routes/pages.dart';
import 'package:proje/routes/routes.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    Get.put(NavbarController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        getPages: Pages.pages,
        navigatorKey: navigatorKey,
        initialRoute: Routes.LoginPage);
  }
}
