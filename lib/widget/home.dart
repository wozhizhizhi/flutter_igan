import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/drawer_page.dart';
import 'tab_gril_page.dart';
import 'tab_android_page.dart';
import 'tab_ios_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var _body;
  var tabTitle = ["美女" , "Android" , "IOS"];
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
  @override
  Widget build(BuildContext context) {
    _initPage();
    return Scaffold(
      appBar: new AppBar(
        title:getTabTitle(_currentIndex),
        centerTitle: true,
      ),
      body: _body,
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("美女")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.phone_android), title: new Text("Android")),
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
    );
  }
}
