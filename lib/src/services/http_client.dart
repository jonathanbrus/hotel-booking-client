import 'package:dio/dio.dart';

final BaseOptions _options = BaseOptions(
  baseUrl: "http://10.0.2.2:5000",
);

final Dio _dio = Dio(_options);

Future getHttp({required String path, Map<String, dynamic>? params}) async {
  try {
    final response = await _dio.get(path, queryParameters: params);

    if (response.data["status"] != 200) {
      throw response.data["message"];
    }

    return response.data["data"];
  } catch (e) {
    throw {"message": e};
  }
}

Future postHttp({required String path, Map<String, dynamic>? data}) async {
  try {
    final response = await _dio.post(path, data: data);

    if (response.data["status"] != 200 || response.data["status"] != 201) {
      throw response.data["message"];
    }

    return response.data["data"];
  } catch (e) {
    throw {"message": e};
  }
}

Future patchHttp({required String path, Map<String, dynamic>? data}) async {
  try {
    final response = await _dio.patch(path, data: data);

    if (response.data["status"] != 200 || response.data["status"] != 201) {
      throw response.data["message"];
    }

    return response.data["data"];
  } catch (e) {
    throw {"message": e};
  }
}
