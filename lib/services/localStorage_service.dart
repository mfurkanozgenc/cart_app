import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:proje/models/userModel.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  final _myBox = Hive.box('myBox');

  void WriteData(String key, String data) {
    _myBox.put(key, data);
  }

  String ReadData(String key) {
    try {
      return _myBox.get(key);
    } catch (e) {
      return '';
    }
  }

  void DeleteData(String key) {
    _myBox.delete(key);
  }

  Future<UserModel?> refreshPage() async {
    Map<String, dynamic> userMap = jsonDecode(ReadData('CartAppUserInfo'));
    var user = UserModel.fromJson(userMap);
    print('KULLANICI BİLGİSİ ${user.fullName}');
    return user;
  }
}
