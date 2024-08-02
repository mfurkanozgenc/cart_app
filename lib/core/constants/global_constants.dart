class GlobalConstants {
  static final _instance = GlobalConstants._internal();
  factory GlobalConstants() => _instance;
  GlobalConstants._internal();
  final appVersion = 'v24.0802';
}
