import 'package:dio/dio.dart';
import 'package:magazine/shared/components/constants.dart';

class MagazineDioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true
    ));
  }
  static Future<Response> getArticles({required String url , required Map<String , dynamic> query}){
    return dio.get(url,queryParameters: query);
  }
}