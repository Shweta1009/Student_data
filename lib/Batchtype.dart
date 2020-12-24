import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_data/Batch.dart';
import 'Batch.dart';

class Batchtype extends StatefulWidget {
  @override
  _BatchtypeState createState() => _BatchtypeState();
}

class _BatchtypeState extends State<Batchtype> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Batch List",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.redAccent[200],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Image(image: AssetImage('assets/teacher.jpg'), height: 300),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      var batchidd = '1';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => batch_list(
                            guestname: batchidd,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Batch 1',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.group_add_rounded)),
                      ],
                    ),
                    color: Colors.redAccent[200],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      var batchidd = '2';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => batch_list(
                            guestname: batchidd,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Batch 2',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.group_add_rounded)),
                      ],
                    ),
                    color: Colors.redAccent[200],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      var batchidd = '3';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => batch_list(guestname: batchidd),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Batch 3',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.group_add_rounded)),
                      ],
                    ),
                    color: Colors.redAccent[200],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
