import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/star/StarRating.dart';

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Container(child: StarRating(rating: 4.0,size: 15.0,),alignment: Alignment.center,),
      
    );
  }
}