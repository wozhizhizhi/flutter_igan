import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'chatmessage.dart';
/*
 * 聊天的主界面 
 */
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textEditingController =
      new TextEditingController();
  AnimationController _animationController;
  List<ChatMessage> _messages = <ChatMessage>[];
  bool is_sending = false;

  // 发送后清除字段并且更新UI
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    // 当文本被清除时设置发送为false
    setState(() {
      is_sending = false;
    });
    ChatMessage chatMessage = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 700), vsync: this),
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

  // 发送文字的控件
  Widget _buildTextComposer() {
    return new Row(
      children: <Widget>[
        new Flexible(
          child: new Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new TextField(
              onSubmitted: _handleSubmitted,
              controller: _textEditingController,
              // collapsed可以去掉TextField的下划线
              decoration: new InputDecoration.collapsed(hintText: "发送消息"),
              onChanged: (String text) {
                setState(() {
                  // 如果文本的长度大于0为真能发送
                  is_sending = text.length > 0;
                });
              },
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          // 根据系统自己定义发送的按钮
          child: defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoButton(
                  child: new Text("发送"),
                  onPressed: is_sending
                      ? () => _handleSubmitted(_textEditingController.text)
                      : null,
                )
              : new IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: new Icon(Icons.send),
                  onPressed: is_sending
                      ? () => _handleSubmitted(_textEditingController.text)
                      : null,
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("星聊"),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: const EdgeInsets.all(8.0),
              // 反转使ListView从屏幕底部开始
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          // 下划线
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
}
