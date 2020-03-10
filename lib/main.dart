import 'package:flutter/material.dart';
import 'package:sound/route/routing.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '사운드 방음문 MES.',
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
          fontFamily: 'NanumGothic'
      ),
      routes : routes,
    );
  }
}
