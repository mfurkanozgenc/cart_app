import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/pages/admin/customersPage/customers_controller.dart';

class CustomersView extends GetView<CustomersController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcılar'.toUpperCase()),
        centerTitle: true,
        backgroundColor: constants.colors.generalColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: controller.exitToApp,
                icon: const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var user = snapshot.data!.docs[index];
                var date = DateTime.fromMicrosecondsSinceEpoch(user['date']);
                String formattedDate = DateFormat('dd/MM/yyyy').format(date);
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    shape: ContinuousRectangleBorder(
                        side: BorderSide(
                            color: constants.colors.generalColor, width: 1)),
                    leading: const Icon(Icons.person),
                    title: Text(
                      user['fullName'].toString(),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Column(
                      children: [
                        Text(user['description'].toString()),
                        Text(formattedDate),
                      ],
                    ),
                    trailing: user['isAdmin']
                        ? const Text('Admin')
                        : const Text('Müşteri'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
