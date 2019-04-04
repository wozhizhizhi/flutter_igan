import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'fl_repository.dart';
import 'package:flutter_igan/modle/fl_modle.dart';
import 'package:flutter_igan/common/common_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_igan/mvp/dioutil/apis.dart';
import 'package:flutter_igan/mvp/dioutil/fecth.dart';

class FLRepositoryImlp implements FLRepository {
  @override
  Future<List<FLMode>> fetch(int pageNum, int pageSize) {
    // TODO: implement fetch
    return _getData(pageNum, pageSize);
  }
  // 使用的是原生的方法
   Future<List<FLMode>> _getData(int pageNum, int pageSize) async {
     // TODO: implement fetch
     var httpClient = new HttpClient();
     var url = CommonUrl.COMMON_URL + "福利/$pageNum/$pageSize";
     print(url);
     List flModles;
     try {
       var request = await httpClient.getUrl(Uri.parse(url));
       var response = await request.close();
       if (response.statusCode == HttpStatus.OK) {
         var json = await response.transform(utf8.decoder).join();
         flModles = jsonDecode(json)['results'];
       } else {

       }
     } catch (exception) {}
     return flModles.map((modle){
         return new FLMode.fromJson(modle);
     }).toList();
   }

  // 使用的dio网络框架进行的请求
//   Future<List<FLMode>> _getData(int pageNum, int pageSize) async {
//     Dio dio = Fecth.getInstance().getDio();
//     Response response;
//     String errorMsg;
//     List fLModes;
//     String url = CommonUrl.COMMON_URL + "福利/$pageNum/$pageSize";
//     try{
//       response = await dio.get(url);
//       print(response);
//       if (response.statusCode == HttpStatus.OK){
//            fLModes = response.data['results'];
//         }
//       else{
//         errorMsg = '服务器异常';
//       }
//
//     }
//     catch(e){
//        errorMsg = '您的网络似乎出了什么问题';
//     }
//     finally{
//          fLModes =fLModes.map((modle){
//          return new FLMode.fromJson(modle);
//      }).toList();
//     }
//     return fLModes;
//   }
}
