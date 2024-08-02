import 'package:cloud_firestore/cloud_firestore.dart';

class ActionService {
  late CollectionReference response;
  static final ActionService _instance = ActionService._internal();
  ActionService._internal();
  factory ActionService() {
    _instance.response = FirebaseFirestore.instance.collection('users');
    return _instance;
  }
  Future<bool> login(String userName, String Password) async {
    return await true;
  }

  Future<bool> add({
    required String name,
    required num unitPrice,
    required num quantity,
    required String userId,
    num? targetPrice,
  }) async {
    try {
      await response.add({
        'name': name,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'targetPrice': targetPrice,
        'userId': userId,
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
