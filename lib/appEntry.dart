import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ca/GoCustomPainterWidget.dart';

import 'GradientCircularProgressRoute.dart';
import 'config.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flavored flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          CustomPaintRoute(),
          Container(
            height: 280,
            width: 280,
            color: Colors.transparent,
            child: Stack(children: <Widget>[
              RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child: GradientCircularProgressRoute(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50, left: 90, top: 30),
                child: Icon(
                  Icons.check,
                  color: Color(0xffffc82c),
                  size: 160,
                ),
              ),
            ]),
          ),
          new Text(Config.helloMessage,
            style: Theme
                .of(context)
                .textTheme
                .display1,
          ),

        ],
      ),
      drawer: Container(
        width: width*0.7,
        height: height,
        color: Colors.transparent,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Opacity(//设置透明度
              opacity: 0.8,//半透明
              child: Container(
                width: width*0.8,
                height: height,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ),
        )
      )
    );
  }
}
