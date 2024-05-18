import 'package:dio/dio.dart';

import 'endPoints.dart';

class DioHelper {
  static Dio? dio;

  static Future<void> init() async {
    dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          },
        ));
  }

  static Future<Response> get({
    required String endPoint,
    String ?token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      dio?.options.headers={
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZjViMzBiYmEzZmU2MTFmNTA5NGMxMzdiOGJiYTk5OCIsInN1YiI6IjY1ZWY4OTcxYTM1YzhlMDE2MzljMWNjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0whhQjm-dGY2Ip0-gxDP24fsaR8BgPkKfxoH0V_vCpg"
      };
      Response? response =await dio?.get(
        endPoint,
        data: body,
        queryParameters: parameters,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response>put({
    required String endPoints,
    String?token,
    Map<String, dynamic>? body,
  })async{
    try {
      dio?.options.headers={
        "Authorization":"Bearer $token"
      };
      Response ?response =await dio?.put(
          endPoints,
          data:body,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> post({
    required String endPoint,
    String ?token,
    Map<String, dynamic>? body,
    FormData ?formData,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      dio?.options.headers={
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZjViMzBiYmEzZmU2MTFmNTA5NGMxMzdiOGJiYTk5OCIsInN1YiI6IjY1ZWY4OTcxYTM1YzhlMDE2MzljMWNjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0whhQjm-dGY2Ip0-gxDP24fsaR8BgPkKfxoH0V_vCpg"
      };
      Response? response =await dio?.post(
        endPoint,
        data: body ?? formData,
        queryParameters: parameters,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> delete({
    required String endPoint,
    String ?token,
    Map<String, dynamic>? body,
    FormData ?formData,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      dio?.options.headers={
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZjViMzBiYmEzZmU2MTFmNTA5NGMxMzdiOGJiYTk5OCIsInN1YiI6IjY1ZWY4OTcxYTM1YzhlMDE2MzljMWNjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0whhQjm-dGY2Ip0-gxDP24fsaR8BgPkKfxoH0V_vCpg"
      };
      Response? response =await dio?.delete(
        endPoint,
        data: body ?? formData,
        queryParameters: parameters,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }

}