import 'package:flutter/material.dart';

class FLMode{
  final String url;
  FLMode({this.url});
  factory FLMode.fromJson(Map<String , dynamic> json){
    return new FLMode(url: json['url']);
  }
}