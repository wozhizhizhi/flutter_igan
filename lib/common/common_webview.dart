import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class CommomWebView extends StatefulWidget {
  final String title;
  final String url;

  CommomWebView({this.title, this.url});
  @override
  _CommomWebViewState createState() => _CommomWebViewState();
}

class _CommomWebViewState extends State<CommomWebView> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      url: widget.url,
      withLocalStorage: true,
      withZoom: false,
      withJavascript: true,
    );
  }
}
