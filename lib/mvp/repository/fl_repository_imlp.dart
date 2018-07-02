import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'fl_repository.dart';
import 'package:flutter_igan/modle/fl_modle.dart';
import 'package:flutter_igan/common/common_url.dart';

class FLRepositoryImlp implements FLRepository {
  @override
  Future<List<FLMode>> fetch(int pageNum, int pageSize) {
    // TODO: implement fetch
    return _getData(pageNum, pageSize);
  }

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
        var json = await response.transform(UTF8.decoder).join();
        flModles = jsonDecode(json)['results'];
      } else {

      }
    } catch (exception) {}
    return flModles.map((modle){
        return new FLMode.fromJson(modle);
    }).toList();
  }
}
