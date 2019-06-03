import 'package:flutter/material.dart';
import 'package:stack_nlp/util/ColorUtil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWebView extends StatefulWidget {
  final String url;
  final String title;

  DetailWebView({Key key, this.url,this.title}) : super(key: key);

  @override
  _DetailWebViewState createState() => _DetailWebViewState();
}

class _DetailWebViewState extends State<DetailWebView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(widget.title),
          elevation: 2.0,
        ),
        backgroundColor: ColorUtil.backgroundColor(),
        body: Container(
          child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
