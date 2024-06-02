import 'package:dio/dio.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';

class DioServer {
  static Dio dio = Dio();

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>?data,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.get(url , data:data);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String?token
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.put(url, data:data);
  }

  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.delete(url, data:data);
  }
}
