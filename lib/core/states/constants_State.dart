import 'package:proje/core/constants/constants.dart';

class ConstantsState {
  static final ConstantsState _instance = ConstantsState._internal();
  factory ConstantsState() => _instance;
  ConstantsState._internal();
  final colors = ColorConstants();
  final globalConstants = GlobalConstants();
}
