import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  int step = 0;
  int score = 0;
  onstartclick(){
    setState(() {
      step++;
    });
    Timer.periodic(new Duration(seconds:1), (timer) {
      setState(() {
        score++;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    String lorem =
        "      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            .toLowerCase()
            .replaceAll(",", "")
            .replaceAll(".", "");
    var shown_widget;
    if (step==0)
      shown_widget = <Widget>[Text("WELCOME TO GAME"),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: RaisedButton(child: Text("Start Game!"),
          onPressed: onstartclick,
      ),
        ),
      ];
    else if(step == 1)
     shown_widget = <Widget>[Text("$score"),
      Container(
        margin: EdgeInsets.only(left: 100),
        height: 40,
        child: Marquee(
          text: lorem,
          velocity: 125,
          blankSpace: 20,
          style: TextStyle(fontSize: 24, letterSpacing: 2),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          startPadding: MediaQuery.of(context).size.width,
          accelerationDuration: Duration(seconds: 10),
          accelerationCurve: Curves.ease,
          decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),

              labelText: "Yaz Bakalım"),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Klavye Delikanlısı!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: shown_widget,
        ),
      ),
    );
  }
}