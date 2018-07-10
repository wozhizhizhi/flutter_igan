import 'package:flutter/material.dart';
import 'package:flutter_igan/widget/chat/chatScreen.dart';
import 'package:flutter_igan/widget/httpget/AwesomeTips.dart';
import 'package:flutter_igan/widget/star/StarPage.dart';

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
              // 通过定义别名跳转
              // Navigator.pushNamed(context, "/chat");

              // 利用系统MaterialPageRoute跳转
              // Navigator.push(context, new MaterialPageRoute(builder: (context){
              //         return new ChatScreen();
              // }));

              // PageRouteBuilder动态路由灵活灵活传递页面数据（下面这个是官方例子写法）运行效果是带了旋转动画
              Navigator.push(
                  context,
                  new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new Center(child: new ChatScreen());
                      },
                      transitionsBuilder: (___, Animation<double> animation,
                          ____, Widget child) {
                        return new FadeTransition(
                          opacity: animation,
                          child: new RotationTransition(
                            turns: new Tween<double>(begin: 0.5, end: 1.0)
                                .animate(animation),
                            child: child,
                          ),
                        );
                      }));
            }),
        new Divider(),
        new ListTile(
          title: new Text("实现底部导航,使用自带图片"),
          trailing: new Icon(Icons.arrow_right),
          onTap: () => Navigator.pushNamed(context, "/tabhomepage"),
        ),
        new Divider(),
        new ListTile(
          title: new Text("使用第三方http框架，现在貌似不用导包了,自带这个包"),
          trailing: new Icon(Icons.arrow_right),
          onTap: () {
            Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new AwesomeTips();
            }));
          },
        ),
        new Divider(),
        new ListTile(
          title: new Text("跳转到登录界面"),
          trailing: new Icon(Icons.arrow_right),
          onTap: () => Navigator.pushNamed(context, "/Login"),
        ),
        new Divider(),
        new ListTile(
          title: new Text("妹子页面使用dio框架进行请求(fl_repository_imlp.dart)"),
          trailing: new Icon(Icons.arrow_right),
          onTap: () => showDialog(
                context: context,
                child: SimpleDialog(
                  title: new Text("温馨提示"),
                  children: <Widget>[
                    new Center(
                      child: new Text("没有跳转,请直接看代码吧!"),
                    ),
                  ],
                ),
              ),
        ),
        //       Scaffold.of(context).showSnackBar(new SnackBar(
        //             content: new Text("没有跳转,请直接看代码吧!"),
        //           )),
        // ),
        new Divider(),
        new ListTile(
          title: new Text("自定义评论界面"),
          trailing: new Icon(Icons.arrow_right),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context){
            return new StarPage();
          })),
        ),
        new Divider(),
      ],
    );
  }
}
