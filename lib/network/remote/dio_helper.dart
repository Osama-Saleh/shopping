import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static dioInit() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  ///Send Data
  static Future<Response> postData({
    required String? url,
    required var data,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.post(url!, data: data, queryParameters: query);
  }

  ///Get Data
  static Future<Response> getData({
    required String? url,
    required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }
}
