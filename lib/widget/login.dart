import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget buildLogin() {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Image.asset(
            "images/login_logo.png",
            width: 150.0,
            height: 150.0,
          ),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 50.0),
        ),
        new Container(
          margin: const EdgeInsets.all(12.0),
          child: new Column(
            children: <Widget>[
              new Container(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(
                    hintText: "请输入手机号码",
                    hintStyle: new TextStyle(fontSize: 16.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
              ),
              new Divider(),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(
                    hintText: "请输入密码",
                    hintStyle: new TextStyle(fontSize: 16.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
              ),
            ],
          ),
          decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
              color: Colors.white),
        ),
        new Container(
          child: new Text(
            "忘记密码",
            style: new TextStyle(color: Colors.white),
          ),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(right: 15.0),
        ),
        new FittedBox(
          child: new Container(
            width: 250.0,
            height: 60.0,
            padding: const EdgeInsets.only(top: 15.0),
            child: new RaisedButton(
              onPressed: null,
              child: new Text(
                "登录",
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue),
              ),
              disabledColor: Colors.yellowAccent,
              shape: new StadiumBorder(),
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 90.0),
          child: new OutlineButton(
            onPressed: null,
            child: new Text(
              "出来报到?注册请戳这里",
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w200),
            ),
            highlightElevation: 5.0,
            shape: new StadiumBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new FittedBox(
            child: new Image.asset("images/img_record_bg.png"),
          ),
          buildLogin()
        ],
      ),
    );
  }
}
