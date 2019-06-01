import 'package:flutter/material.dart';
import 'package:stack_nlp/util/ColorUtil.dart';

import 'StackSearchHome.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack NLP',
      theme: ThemeData(
          primaryColor: ColorUtil.backgroundColor()
      ),
      home: StackSearchHome(),
    );
  }
}



