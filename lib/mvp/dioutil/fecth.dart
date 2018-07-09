import 'package:dio/dio.dart';
import 'package:flutter_igan/mvp/dioutil/apis.dart';
/**
 * dio的单例模式
 */
class Fecth {
  static Fecth _instance;
  Options options;
  Dio dio;

  static Fecth getInstance() {
    if (_instance == null) {
      _instance = new Fecth();
    }
    return _instance;
  }

  Fecth() {
    options = new Options(
      baseUrl: Apis.BASE_URL,
      connectTimeout: 15000,
      receiveTimeout: 5000,
    );

    dio = new Dio(options);
  }

  getDio() {
    return dio;
  }


//  Future<dynamic> _analyzing(Response response, {dynamic targetBean}) async {
//    print('response: ${response.data}');
//    JsonDecoder decoder = new JsonDecoder();
//    Map map = decoder.convert(response.data);
//    print('map: $map');
//    dynamic baseBean = targetBean ?? new BaseDataBean();
//    baseBean.convert(map);
//    print('baseBean: $baseBean');
//    if (baseBean.code == 0) {
//      print('successful');
//      return baseBean.data;
//    } else {
//      throw baseBean.detail ?? '数据获取失败';
//    }
//  }
//
//  Future<dynamic> _get(String path, {dynamic data, dynamic targetBean}) async {
//    print('fetch: get=$path, data=$data');
////    Dio dio = new Dio(options);
//    return await _analyzing(await dio.get(path, data: data),
//        targetBean: targetBean);
//  }
//
//  Future<dynamic> _post(String path, {dynamic data, dynamic targetBean}) async {
//    print('fetch: post=$path, data=$data');
////    Dio dio = new Dio(options);
//    return await _analyzing(await dio.post(path, data: data),
//        targetBean: targetBean);
//  }
}
