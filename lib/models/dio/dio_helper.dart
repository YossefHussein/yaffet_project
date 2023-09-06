// import 'package:dio/dio.dart';

// class DioHelper {
//   static Dio? dio;

//   static init() async {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://api.yaffet.com/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }

//   static Future<Response?> getChartData({
//      String? url,
//      Map<String, dynamic>? query,
//      dynamic chart
//   }) async {
//     return await dio
//         ?.get(
//       url!,
//       queryParameters: query,
//     )
//         .then((value) {
//           chart = value.data['data']['metalPrice'];
//           print(chart);
//       if (value.statusCode == 200) {
//         print(value.statusCode.toString());
//       } else if (value.statusCode == 405) {
//         print('${value.statusCode.toString()}');
//       }
//       return null;
//     }).catchError((onError) {
//       print('api have error: {${onError.toString()}}');
//     });
//   }

//   static Future<Response?> postData({
//     required String url,
//     required Map<String, dynamic> query,
//   }) async {
//     return await dio
//         ?.post(
//       url,
//       queryParameters: query,
//     )
//         .then((value) {
//       if (value.statusCode == 200) {
//         print(value.toString());
//       } else if (value.statusCode == 405) {
//         print(value.statusCode.toString());
//       }
//       return null;
//     }).catchError((onError) {
//       print('api have error ${onError.toString()}');
//     });
//   }
// }
