import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_socket_io/flutter_socket_io.dart';

import 'MoveButton.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'klasApp',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}
  
class MyHomePageState extends State<MyHomePage> {
  SocketIO socketIO;
  String moveFlutter;
  bool forward = false;
  bool backward = false;
  bool left = false;
  bool right = false;

  _connectSocket() {
    socketIO = new SocketIO("http://192.168.1.216:8080", "/");
    socketIO.init();
    socketIO.connect();
  }
  MyHomePageState(){
    new Timer.periodic(Duration(seconds:3), (Timer t) {
      setState(() {
        moveFlutter = '{forward:'+forward.toString()+',backward:'+backward.toString()+',left:'+left.toString()+',right:'+right.toString()+'}';
      });
      socketIO.sendMessage("event", moveFlutter);
    });
  }
  @override
  void initState() {
    super.initState();
    _connectSocket();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF283149),
      //appBar: new AppBar(
      //  title: new Text('klasApp'),
      //),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // backward
              new MoveButton(
                move: backward,
                width: 100.0,
                height: 150.0,
                border: 10.0,
                pos: EdgeInsets.only(top: 80.0, left: 30.0),
              ),
              // forward
              new MoveButton(
                move: forward,
                width: 100.0,
                height: 200.0,
                border: 10.0,
                pos: EdgeInsets.only(top: 30.0, right: 30.0),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // left
              new MoveButton(
                move: left,
                width: 100.0,
                height: 100.0,
                border: 50.0,
                pos: EdgeInsets.only(bottom: 30.0, left: 30.0),
              ),
              // right
              new MoveButton(
                move: right,
                width: 100.0,
                height: 100.0,
                border: 50.0,
                pos: EdgeInsets.only(bottom: 30.0, right: 30.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
