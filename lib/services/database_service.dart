import 'package:proje/models/userModel.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  late bool isAdmin = false;
  late UserModel loginUser = new UserModel(
      password: '',
      image: '',
      email: '',
      date: DateTime.now(),
      isAdmin: false,
      fullName: '',
      description: '');
}
