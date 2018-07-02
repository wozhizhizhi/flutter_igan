import 'package:flutter/material.dart';
import 'package:flutter_igan/modle/ai_modle.dart';
import 'package:flutter_igan/common/common_progress_dialog.dart';
import 'package:flutter_igan/common/common_webview.dart';
import 'package:flutter_igan/mvp/repository/android_data.dart';
import 'dart:async';

class TabiOSPage extends StatefulWidget {
  @override
  _TabiOSPageState createState() => _TabiOSPageState();
}

class _TabiOSPageState extends State<TabiOSPage> {
  List<AIModle> aiModes = [];
  String type = "iOS";
  int pageSize = 10;
  int pageNum = 1;
  GetAndroidData getAndroidData;
  ScrollController _scrollController = new ScrollController();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndroidData = new GetAndroidData();
    _refreshData();
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  Future<Null> _refreshData() async {
     if (!mounted) return; //异步处理，防止报错
    aiModes.clear();
    List<AIModle> datas = await getAndroidData.getData(type, pageNum, pageSize);
    setState(() {
      aiModes = datas;
    });
  }

  Future<Null> _loadData() async {
     if (!mounted) return; //异步处理，防止报错
    pageNum = pageNum + 1;
    List<AIModle> datas = await getAndroidData.getData(type, pageNum, pageSize);
    setState(() {
      aiModes.addAll(datas);
    });
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (aiModes.isEmpty) {
      content = new CommonProgressDialog();
    } else {
      content = new ListView.builder(
        controller: _scrollController,
        itemCount: aiModes.length * 2,
        itemBuilder: _getItem,
      );
    }
    return new RefreshIndicator(
      onRefresh: _refreshData,
      child: content,
    );
  }

  // 通过路由跳转网页
  void _gotoWeb(String url) {
    Navigator.push(
        context,
        new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return new CommomWebView(
                title: "IOS",
                url: url,
              );
            },
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new RotationTransition(
                  turns: new Tween<double>(begin: 0.5, end: 1.0)
                      .animate(animation),
                  child: child,
                ),
              );
            }));
  }

  Widget _getItem(BuildContext context, int index) {
    if (index.isOdd) {
      return new Divider();
    }
    final pos = index ~/ 2;
    String url = aiModes[pos].url;
    return new ListTile(
      onTap: () => _gotoWeb(url),
      title: new Text("${aiModes[pos].desc}"),
      subtitle: new Text("${aiModes[pos].publishedAt}"),
      trailing: new Icon(Icons.arrow_right),
    );
  }
}
