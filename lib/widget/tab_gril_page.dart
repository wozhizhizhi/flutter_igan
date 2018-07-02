import 'package:flutter/material.dart';
import 'package:flutter_igan/modle/fl_modle.dart';
import 'package:flutter_igan/mvp/repository/fl_repository_imlp.dart';
import 'dart:async';
import 'package:flutter_igan/common/common_webview.dart';
import 'package:flutter_igan/common/common_progress_dialog.dart';

class TabGirlPage extends StatefulWidget {
  @override
  _TabGirlPageState createState() => _TabGirlPageState();
}

class _TabGirlPageState extends State<TabGirlPage> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     new GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController = new ScrollController();
  List<FLMode> flModes = [];
  FLRepositoryImlp repositoryImlp;
  int curPageNum;
  bool isSlidup = false;

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
    repositoryImlp = new FLRepositoryImlp();
    _refreshData();
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (flModes.isEmpty) {
      content = new CommonProgressDialog();
    } else {
      content = new ListView.builder(
        controller: _scrollController,
        itemCount: flModes.length,
        itemBuilder: buildCard,
      );
    }
    return new RefreshIndicator(
      child: content,
      onRefresh: _refreshData,
      // key: _refreshIndicatorKey,
    );
  }

  Future<Null> _refreshData() async {
    flModes.clear();
    curPageNum = 2;
    List<FLMode> datas = await repositoryImlp.fetch(curPageNum, 10);
    setState(() {
      flModes = datas;
    });
  }

  Future<Null> _loadData() async {
    curPageNum = curPageNum + 1;
    List<FLMode> datas = await repositoryImlp.fetch(curPageNum, 10);
    setState(() {
      flModes.addAll(datas);
    });
  }

  // 通过路由跳转网页
  void _gotoWeb(String url) {
    Navigator.push(
        context,
        new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return new CommomWebView(
                title: "妹子",
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

  Widget buildCard(BuildContext context, int index) {
    final String item = flModes[index].url;
    return new GestureDetector(
      onTap: () {
        _gotoWeb(item);
      },
      child: new Card(
        child: new Image.network(item),
        
      ),
    );
  }
}
