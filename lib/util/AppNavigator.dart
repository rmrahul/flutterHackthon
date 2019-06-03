import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_nlp/ui/DetailWebView.dart';

class AppNavigator {


  static navigateToDetailWebView(BuildContext context,String url,String title) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new DetailWebView(url: url,title: title,)));
  }

}
