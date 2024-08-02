import 'package:proje/services/database_service.dart';

class ServicesState {
  static final ServicesState _instance = ServicesState._internal();
  factory ServicesState() => _instance;
  ServicesState._internal();

  final databaseService = DatabaseService();
}
