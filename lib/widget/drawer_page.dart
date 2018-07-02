import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/chat/chatScreen.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new NetworkImage(
                    "http://t2.hddhhn.com/uploads/tu/201612/98/st93.png"),
                fit: BoxFit.fill),
          ),
          // 圆形控件与image搭配使用
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage(
                "http://img.soogif.com/e2d43a22-cbba-47ab-b1cc-e7ea0810aab3.gif"),
          ),
          accountName: new Text("z1988"),
          accountEmail: new Text("xxxxxxx.@qq.com"),
        ),
        new ListTile(
            title: new Text("跳转聊天界面"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new ChatScreen()),
              );
            }),
        new Divider(),
        new ListTile(
          title: new Text("待定"),
          trailing: new Icon(Icons.arrow_right),
        ),
        new Divider(),
        new ListTile(
          title: new Text("待定"),
          trailing: new Icon(Icons.arrow_right),
        ),
        new Divider(),
        new ListTile(
          title: new Text("待定"),
          trailing: new Icon(Icons.arrow_right),
        ),
        new Divider(),
      ],
    );
  }
}
