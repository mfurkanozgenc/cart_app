import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proje/core/base/base_state.dart';
import 'package:proje/models/userModel.dart';
import 'package:proje/services/database_service.dart';
import 'package:proje/services/localStorage_service.dart';

class ActionService {
  late CollectionReference response;
  late DatabaseService db;
  late LocalStorageService storage;
  static final ActionService _instance = ActionService._internal();
  ActionService._internal();
  factory ActionService() {
    _instance._initialize();
    return _instance;
  }
  void _initialize() {
    response = FirebaseFirestore.instance.collection('users');
    db = DatabaseService();
    storage = LocalStorageService();
  }

  Future<bool> login(String email, String password) async {
    var control = await response
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    if (control.docs.isNotEmpty) {
      db.isAdmin = control.docs.first['isAdmin'];
    }
    UserModel user =
        UserModel.fromJson(control.docs.first.data() as Map<String, dynamic>);
    db.loginUser = user;
    String userJson = jsonEncode(user!.toJson());
    storage.WriteData('CartAppUserInfo', userJson!);
    return control.docs.isNotEmpty;
  }

  Future<bool> addUser(
      {required String fullName,
      required String image,
      required bool isAdmin,
      required String email,
      required String description,
      required String password}) async {
    try {
      var exsistControl = await response.where('email', isEqualTo: email).get();

      if (exsistControl.docs.isNotEmpty) {
        return false;
      }
      await response.add({
        'fullName': fullName,
        'image': image,
        'isAdmin': isAdmin,
        'email': email,
        'password': password,
        'description': description,
        'date': DateTime.now().microsecondsSinceEpoch,
      });
      return true;
    } catch (error) {
      print('HATA : $error');
      return false;
    }
  }

  Future<bool> updateUser(
      {required String fullName,
      required String image,
      required String id}) async {
    try {
      await response.doc(id).update({
        'fullName': fullName,
        'image': image,
        'date': DateTime.now().microsecondsSinceEpoch,
      });
      print('Kayıt Güncelleme Başarılı');
      return true;
    } catch (error) {
      print('Kayıt Güncellenemedi : $error');
      return false;
    }
  }

  Future<bool> addIconAndUrl(
      {required String icon, required String name}) async {
    try {
      await response.add({
        'name': name,
        'icon': icon,
        'date': DateTime.now().microsecondsSinceEpoch,
      });
      print('Kayıt Ekleme Başarılı');
      return true;
    } catch (error) {
      print('Kayıt Eklenemedi : $error');
      return false;
    }
  }
}
