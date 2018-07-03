import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/httpget/httputil.dart';
import 'package:flutter_igan/modle/feed.dart';
import 'dart:async';

class AwesomeTips extends StatefulWidget {
  @override
  _AwesomeTipsState createState() => _AwesomeTipsState();
}

class _AwesomeTipsState extends State<AwesomeTips> {
  int page = 1;
  HttpUtil httpUtil;
  List<Feed> feeds = [];
  ScrollController _scrollController = new ScrollController();
  void _scrollLintener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpUtil = new HttpUtil();
    _handleRefresh();
    _scrollController = new ScrollController()..addListener(_scrollLintener);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("新闻"),
        ),
        body: new RefreshIndicator(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12.0),
            itemCount: feeds.length * 2,
            itemBuilder: (BuildContext context, int index) {
              if (index.isOdd) {
                return new Divider();
              }
              final pos = index ~/ 2;
              return _buildRow(pos);
            },
          ),
          onRefresh: _handleRefresh,
        ));
  }

  // Future<Null> _handleRefresh() async {
  //   await loadData();
  // }

  // void loadData() async {
  //   String url =
  //       "https://app.kangzubin.com/iostips/api/feed/list?page=1&from=flutter-app&version=1.0";
  //   http.Response response = await http.get(url);

  //   final body = JSON.decode(response.body);
  //   var code = body["code"];
  //   if (code == 0) {
  //     final feeds = body["data"]["feeds"];
  //     var items = [];
  //     for (var item in feeds) {
  //       items.add(Feed(item["author"], item["title"], item["postdate"]));
  //     }

  //     setState(() {
  //       _items = items;
  //     });
  //   }
  // }
  Future<Null> _handleRefresh() async {
    if (!mounted) return; //异步处理，防止报错
    if (feeds.isNotEmpty) {
      feeds.clear();
    }
    List<Feed> list = await httpUtil.getFecth(page);
    setState(() {
      feeds = list;
    });
  }

  Future<Null> _loadData() async {
    if (!mounted) return; //异步处理，防止报错
    page = page + 1;
    List<Feed> list = await httpUtil.getFecth(page);
    setState(() {
        feeds.addAll(list);
        // Scaffold.of(context).showSnackBar(new SnackBar(
        //       content: new Text("没有更多数据"),
        //       duration: new Duration(milliseconds: 1000),
        //     ));
    });
  }

  Widget _buildRow(int i) {
    Feed feed = feeds[i];
    return new ListTile(
      title: new Text(feed.title),
      subtitle: new Text("${feed.author}@${feed.postdate}"),
      onTap: () {},
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_scrollLintener);
  }
}
