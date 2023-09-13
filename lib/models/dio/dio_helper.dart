import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://metals-api.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response?> getData({
   required  String url,
     Map<String, dynamic>? query,
  }) async {
    return await dio
        ?.get(
      url,
      queryParameters: query,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print(value.toString());
      } else if (value.statusCode == 405) {
        print(value.statusCode.toString());
      }
      return null;
    }).catchError((onError) {
      print('api have error ${onError.toString()}');
    });
  }

}
