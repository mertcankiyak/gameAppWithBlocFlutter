import 'package:dio/dio.dart';

class NetworkManager {
  final _baseUrl = "https://www.gamerpower.com/api";
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}