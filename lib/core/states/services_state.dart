import 'package:proje/services/action_service.dart';
import 'package:proje/services/database_service.dart';
import 'package:proje/services/localStorage_service.dart';

class ServicesState {
  static final ServicesState _instance = ServicesState._internal();
  factory ServicesState() => _instance;
  ServicesState._internal();

  final databaseService = DatabaseService();
  final actionService = ActionService();
  final storageService = LocalStorageService();
}
