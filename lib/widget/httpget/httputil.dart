import 'package:http/http.dart' as http;
import 'package:flutter_igan/modle/feed.dart';
import 'dart:convert';
import 'dart:async';

class HttpUtil {
  Future<List<Feed>> getFecth(int page) async {
    List feeds;
    var url =
        "https://app.kangzubin.com/iostips/api/feed/list?page=${page}&from=flutter-app&version=1.0";
    try {
      await http.get(url).then((reponse) {
        var json = jsonDecode(reponse.body);
        var code = json['code'];
        if (code == 0) {
          var data = json['data'];
          if(data != null)
          {
            feeds = json['data']['feeds'];
          }
          else
          {
            print("没有更多数据");
          }
          
        }
      }).catchError((error) {
        print(error.toString());
      }).whenComplete(() {
        print("请求完成");
      });
    } catch (e) {
      print(e);
    }

    return feeds.map((feed) {
      return new Feed.fromJson(feed);
    }).toList();
  }
}
