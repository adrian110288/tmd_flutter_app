import 'package:flutter/material.dart';
import 'package:tmd_app/pages/HomePage.dart';

class TMDApp extends StatelessWidget {
  final _theme = new ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.0),
          subhead: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          body1: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.black38)));

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: HomePage(),
    );
  }
}
