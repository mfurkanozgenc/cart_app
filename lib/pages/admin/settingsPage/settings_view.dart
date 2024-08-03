import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/admin/settingsPage/settings_controller.dart';
import 'package:proje/pages/publicPages/navbar/navbar_view.dart';

class SettingsView extends GetView<SettingsController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavbarView(),
      appBar: AppBar(
        title: Text('Ayarlar'.toUpperCase()),
        centerTitle: true,
        backgroundColor: constants.colors.generalColor,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      controller.clear();
                      _displayModal(context, false, '');
                    },
                    icon: const Icon(Icons.add)),
              ),
            ],
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('settings').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var setting = snapshot.data!.docs[index];
                var icon = setting['icon'];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      String imageBase64 = (setting['icon'] != null &&
                              setting['icon'].toString().isNotEmpty)
                          ? setting['icon']
                          : '';

                      controller.name.value.text = setting['name'];
                      controller.base64Image.value = imageBase64;
                      _displayModal(context, true, setting.id);
                    },
                    shape: ContinuousRectangleBorder(
                        side: BorderSide(
                            color: constants.colors.generalColor, width: 1)),
                    leading: icon.length > 0
                        ? Image.memory(
                            base64Decode(icon),
                            width: Get.height * .05,
                            height: Get.height * .05,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.settings),
                    title: Text(
                      setting['name'].toString(),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                          onPressed: () =>
                              controller.deleteSetting(setting.id.toString()),
                          icon: Icon(
                            Icons.delete,
                            color: constants.colors.generalColor,
                          )),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future _displayModal(BuildContext context, bool isUpdate, String id) {
    print(isUpdate);
    return showModalBottomSheet(
        context: context,
        backgroundColor: constants.colors.generalColor,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: Get.height * 0.40,
                child: Form(
                  key: controller.formKey.value,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 10),
                          child: SizedBox(
                            height: Get.height * .15,
                            width: Get.height * .15,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Card(
                                  shape:
                                      const CircleBorder(), // Yuvarlak sınır tanımlıyoruz
                                  elevation: 10,
                                  child: Obx(
                                    () => ClipOval(
                                      child: controller
                                              .base64Image!.value!.isNotEmpty!
                                          ? Image.memory(
                                              base64Decode(controller
                                                  .base64Image.value!),
                                              width: Get.height *
                                                  .15, // Resmin genişliğini belirtiyoruz
                                              height: Get.height *
                                                  .15, // Resmin yüksekliğini belirtiyoruz
                                              fit: BoxFit
                                                  .cover, // Resmi alana sığdırmak için
                                            )
                                          : Image.asset(
                                              'assets/images/user.png',
                                              width: Get.height * .15,
                                              height: Get.height * .15,
                                              fit: BoxFit
                                                  .cover, // Resmi alana sığdırmak için
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                      hoverColor: Colors.transparent,
                                      icon: Icon(Icons.add,
                                          color: constants.colors.generalColor),
                                      onPressed: () async {
                                        await controller.pickAndUploadImage();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(
                                color: constants.colors.titleTextColor),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen İsim Giriniz';
                              }
                              if (value.length < 3) {
                                return 'En Az 3 Karakter Olacak Şekilde Giriniz';
                              }
                            },
                            controller: controller.name.value,
                            decoration: InputDecoration(
                                label: Text(
                                  'İsim',
                                  style: TextStyle(
                                      color: constants.colors.titleTextColor),
                                ),
                                errorStyle: TextStyle(
                                    color: constants.colors.titleTextColor),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: constants.colors.focusedBorder)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color:
                                            constants.colors.titleTextColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: constants.colors.enabledBorder)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color:
                                            constants.colors.titleTextColor))),
                          ),
                        ),
                        !isUpdate
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () =>
                                      controller.addSetting(context),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(
                                          Get.width * .7, Get.height * .06),
                                      backgroundColor:
                                          constants.colors.titleTextColor),
                                  child: Text(
                                    'Kaydet',
                                    style: TextStyle(
                                        color: constants.colors.generalColor),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () =>
                                      controller.updateSetting(context, id),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(
                                          Get.width * .7, Get.height * .06),
                                      backgroundColor:
                                          constants.colors.titleTextColor),
                                  child: Text(
                                    'Güncelle',
                                    style: TextStyle(
                                        color: constants.colors.generalColor),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
