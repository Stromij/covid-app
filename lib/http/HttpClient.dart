import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

class HttpClient {
  static final HttpClient _singleton = new HttpClient._internal();
  Dio _dio;

  factory HttpClient() => _singleton;
  Alice alice = Alice(showNotification: true, showInspectorOnShake: true);

  HttpClient._internal() {
    _dio = new Dio();
    //TdDo add base url
    _dio.options.baseUrl = "";
    _dio.interceptors.add(alice.getDioInterceptor());
  }

  Dio get api {
    return _dio;
  }
}
