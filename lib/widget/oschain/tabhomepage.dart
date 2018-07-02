import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_igan/widget/oschain/DiscoveryPage.dart';
import 'package:flutter_igan/widget/oschain/MyInfoPage.dart';
import 'package:flutter_igan/widget/oschain/NewListPage.dart';
import 'package:flutter_igan/widget/oschain/TweetsListPage.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => new _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  int _tabIndex = 0;
  final textTabStyleNormal = new TextStyle(color: const Color(0xFF969696));
  final textTabStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  var tabImages;
  // 该变量以下划线（_）开头，在Dart语言中使用下划线前缀标识符，会强制其变成私有的
  var _body;
  var tabTitle = ["资讯", "动漫", "发现", "我的"];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }

    _body = new IndexedStack(
      children: <Widget>[
        new NewListPage(),
        new TweetsListPage(),
        new DiscoveryPage(),
        new MyInfoPage(),
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabStyle(int index) {
    if (index == _tabIndex) {
      return textTabStyleSelected;
    }
    return textTabStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(
      tabTitle[curIndex],
      style: getTabStyle(curIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(primaryColor: new Color(0xFF63CA6C)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            tabTitle[_tabIndex],
            style: new TextStyle(color: Colors.white),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
          leading: new GestureDetector(child: new Icon(Icons.arrow_back_ios),onTap: (){
            return Navigator.of(context).pop();
          },),
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        endDrawer: _drawer,
      ),
    );
  }
  var _drawer = new Drawer(
            child: new Column(children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(
                        "http://t2.hddhhn.com/uploads/tu/201612/98/st93.png"))),
            accountName: new Text("Nevergiveup"),
            accountEmail: new Text("xxxxxxxx.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://raw.githubusercontent.com/wozhizhizhi/wozhizhizhi.github.io/master/img/touxiang.jpg"),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.refresh),
            title: new Text("发布动弹"),
            trailing: new Image.asset(
              "images/ic_arrow_right.png",
              width: 16.0,
              height: 16.0,
            ),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.help),
            title: new Text("动弹小黑屋"),
            trailing: new Image.asset(
              "images/ic_arrow_right.png",
              width: 16.0,
              height: 16.0,
            ),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.chat),
            title: new Text("关于"),
            trailing: new Image.asset(
              "images/ic_arrow_right.png",
              width: 16.0,
              height: 16.0,
            ),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.settings),
            title: new Text("设置"),
            trailing: new Image.asset(
              "images/ic_arrow_right.png",
              width: 16.0,
              height: 16.0,
            ),
          ),
          new Divider(),
        ]));
}
