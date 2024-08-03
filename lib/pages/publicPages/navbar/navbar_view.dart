import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/publicPages/navbar/navbar_controller.dart';
import 'package:proje/routes/routes.dart';

class NavbarView extends GetView<NavbarController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: constants.colors.generalColor,
                      ),
                      accountName: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      accountEmail: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            controller.user.value.fullName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )),
                ),
                ListTile(
                  leading: const Icon(Icons.groups, color: Colors.black),
                  title: const Text(
                    'Kullanıcılar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed(Routes.CustomersPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.black),
                  title: const Text(
                    'Ayarlar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed(Routes.SettingPage);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: controller.exitToApp,
              style: ElevatedButton.styleFrom(
                  backgroundColor: constants.colors.generalColor,
                  minimumSize: Size(MediaQuery.of(context).size.width * .7, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: const Text(
                'Çıkış Yap',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
