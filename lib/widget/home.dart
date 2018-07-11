import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/drawer_page.dart';
import 'package:flutter/cupertino.dart';
import 'tab_gril_page.dart';
import 'tab_android_page.dart';
import 'tab_ios_page.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  var _body;
  var tabTitle = ["美女", "Android", "IOS"];
  int lastClickTime = 0;
  _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new TabGirlPage(),
        new TabAndroidPage(),
        new TabiOSPage(),
      ],
      index: _currentIndex,
    );
  }

  Text getTabTitle(int curIndex) {
    return new Text(
      tabTitle[curIndex],
    );
  }

  // 双击退出应用
  Future<bool> _doExitApp() {
    int nowTime = new DateTime.now().millisecondsSinceEpoch;
    if (nowTime - lastClickTime < 2000) {
      return new Future.value(true);
    } else {
      lastClickTime = new DateTime.now().millisecondsSinceEpoch;
      print("在按一次退出应用");
      // showDialog(
      //     context: context,
      //     child: new AboutDialog(
      //       applicationIcon: new Icon(Icons.exit_to_app),
      //       applicationName: "提示",
      //       children: <Widget>[new Text("您要退出应用吗?")],
      //     ));
      return new Future.value(false);
    }
  }

  // 单击机弹框退出应用
  Future<bool> _dialogExitApp(){
    showDialog(
        context: context,
        child: new AlertDialog(
          content: new Text("您要退出应用吗?"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.pop(context),
              
              child: new Text('取消')
            ),
            new FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/Login");
                },
                child: new Text('确定'))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    return new WillPopScope(
      onWillPop: _doExitApp,
      child: Scaffold(
        appBar: new AppBar(
          title: getTabTitle(_currentIndex),
          centerTitle: true,
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("美女")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.phone_android),
                title: new Text("Android")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.phone_iphone), title: new Text("Ios")),
          ],
          onTap: (index) {
            setState(() {
              print("$index");
              _currentIndex = index;
            });
          },
        ),
        drawer: new Drawer(
          child: new DrawerPage(),
        ),
      ),
    );
  }
}
