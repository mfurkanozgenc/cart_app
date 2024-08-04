import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/user/userHomePage/userHome_controller.dart';

class UserHomeView extends GetView<UserHomeController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: Get.height * .25,
                width: Get.height * .25,
                child: Card(
                  shape: const CircleBorder(),
                  elevation: 25,
                  clipBehavior: Clip.antiAlias,
                  child: Obx(
                    () => InkWell(
                      onTap: () async {
                        await controller.pickAndUploadImage();
                      },
                      child: controller.base64Image.value != null
                          ? Image.memory(
                              base64Decode(controller.base64Image.value!),
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/foto.jfif',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * .1,
                width: Get.width * .8,
                child: Card(
                  elevation: 10,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(
                            () => Text(
                                controller.user.value.fullName.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ),
                          Obx(() => Text(
                              controller.user.value.description.toUpperCase())),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('settings')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    final data = snapshot.requireData;
                    return GridView.builder(
                      itemCount: data.size,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 100,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.2, // Öğelerin oranını belirler.
                      ),
                      itemBuilder: (context, index) {
                        double size = MediaQuery.of(context).size.width / 2 -
                            10; // Her öğe için hesaplanan boyut.
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Card(
                                  color: constants.colors.titleTextColor,
                                  shape: const CircleBorder(),
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      // Tıklama işlemi.
                                    },
                                    child: data.docs[index]['icon']
                                            .toString()
                                            .isNotEmpty
                                        ? Image.memory(
                                            base64Decode(
                                                data.docs[index]['icon']),
                                            width: size,
                                            height: size,
                                            fit: BoxFit.fill,
                                          )
                                        : Icon(
                                            Icons.settings,
                                            color:
                                                constants.colors.generalColor,
                                            size: size / 2,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  right: 4,
                                  bottom: 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                data.docs[index]['name']
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: constants.colors.focusedBorder,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
