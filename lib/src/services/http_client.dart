import 'package:dio/dio.dart';

class HttpClient {
  final BaseOptions _options = BaseOptions(
    baseUrl: "http://localhost:5000",
  );

  late Dio httpClient;

  void initialize() {
    httpClient = Dio(_options);
  }

  Future<void> getHttp({required String path, required params}) async {
    httpClient.get("path");
  }

  Future<void> postHttp({required String path, required body}) async {}
}
