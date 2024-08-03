import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/cartPage/cart_controller.dart';

class CartView extends GetView<CartController> with BaseState {
  CartView({super.key});

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
                          Text('Mustafa Furkan Özgenç'.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Text('Yazılım Mühendisi'.toUpperCase()),
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
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.8,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.deepOrange,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/foto.jfif',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
