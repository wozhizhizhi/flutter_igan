import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_igan/modle/ai_modle.dart';
import 'package:flutter_igan/common/common_url.dart';

class GetAndroidData{
  Future<List<AIModle>> getData(String type , int pageNum , int pageSize) async{
    var httpClient = new HttpClient();
    var url = CommonUrl.COMMON_URL + "$type/$pageSize/$pageNum";
    List aiModes;
    print("$url");
    try{
        var request = await httpClient.getUrl(Uri.parse(url));
        var reponse = await request.close();
        if (reponse.statusCode == HttpStatus.OK){
            String json = await reponse.transform(utf8.decoder).join();
            aiModes = jsonDecode(json)["results"];
        }
        else{

        }
        
    }
    catch (e){
      print(e);
    }
    return aiModes.map((aiMode){
          return new AIModle.fromJson(aiMode);
    }).toList();
  }
}