import 'package:flutter_igan/mvp/dioutil/fecth.dart';
import 'package:flutter_igan/mvp/dioutil/apis.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_igan/mvp/dioutil/basemodle.dart';
import 'package:flutter_igan/mvp/dioutil/loginvo.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class getLogin {
  Future<BaseModel<LoginVo>> getLoginData(
      String account, String password, int loginType) async {
    int code;
    String errorMsg;
    Response response;
    Dio dio = Fecth.getInstance().getDio();
    BaseModel<LoginVo> model;
    LoginVo loginVo;
    String url = Apis.BASE_URL+Apis.URL_LOGIN;
    try {
      response = await dio.post(url, data:{
        "account":account,
        "password":password,
        "loginType":loginType,
      });
      print(url);
      print(response);
      code = response.statusCode;
      if (code == HttpStatus.OK) {
        print(response.data['statusMsg']);
        errorMsg = response.data['statusMsg'];
        loginVo = LoginVo.fromJson(response.data);
        print(loginVo);
      } else {
        errorMsg = '服务器异常';
      }
    } catch (e) {
      errorMsg = '您的网络似乎出了什么问题';
    } finally {
      model = new BaseModel(statusCode: code , statusMsg: errorMsg , data: loginVo);
    }
  }
}
