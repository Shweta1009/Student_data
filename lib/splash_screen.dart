import 'dart:async';
import 'package:flutter/material.dart';
import 'studentMenu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Student_data_Menu())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepOrangeAccent[200]),
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50.0,
              backgroundImage: AssetImage('assets/group.jpeg'),

              /* Icon(Icons.add_road_sharp,color: Colors.red,
              size: 50,)*/
            ),
          )
        ],
      ),
    );
  }
}
