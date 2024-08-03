import 'package:proje/models/userModel.dart';
import 'package:proje/services/localStorage_service.dart';

class DatabaseService {
  late LocalStorageService storage;
  static final DatabaseService _instance = DatabaseService._internal();
  DatabaseService._internal();

  factory DatabaseService() {
    _instance._initialize();
    return _instance;
  }
  void _initialize() {
    storage = LocalStorageService();
  }

  late bool isAdmin = false;
  late UserModel loginUser = new UserModel(
      password: '',
      image: '',
      email: '',
      date: DateTime.now(),
      isAdmin: false,
      fullName: '',
      description: '');

  Future<UserModel?> getUser() async {
    return await storage.refreshPage();
  }
}
