import 'package:flutter/material.dart';
import 'package:stack_nlp/util/AppConstants.dart';
import 'package:stack_nlp/util/ColorUtil.dart';

import 'SearchPage.dart';

class StackSearchHome extends StatefulWidget {
  @override
  StackSearchHomeState createState() => StackSearchHomeState();
}

class StackSearchHomeState extends State<StackSearchHome> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    AppConstants.deviceHeight = data.size.height;
    AppConstants.deviceWidth = data.size.width;

    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: _appTitle(AppConstants.appTitle,24),
          elevation: 2.0,
        ),
        backgroundColor: ColorUtil.backgroundColor(),
        body: SearchPage());
  }

  Widget _appTitle(String text, double textSize) {
    return Padding(
        padding: EdgeInsets.all(AppConstants.padding10),
        child: Text(
          AppConstants.appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textSize,
              fontStyle: FontStyle.normal,
              color: ColorUtil.appTextColor()),
        ));
  }
}
