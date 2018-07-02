import 'dart:async';
import 'package:flutter_igan/modle/fl_modle.dart';

abstract class FLRepository{
  Future<List<FLMode>> fetch(int pageNum , int pageSize);
}