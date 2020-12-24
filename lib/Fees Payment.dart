import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_data/models/student.dart';
import 'InputDeco_design.dart';
import 'utils/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class feespay extends StatefulWidget {

  @override

  _feespayState createState() => _feespayState();
}

class _feespayState extends State<feespay> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<student> noteList;
  List<String> student_name = [];
  List<String> s2;
  int count = 0;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autovalidate = false;
  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<student>();
      updateListView();

      print(noteList[2].name);
    }

    print(noteList);
    return Scaffold(
      // resizeToAvoidBottomInset : true,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.payment_sharp),
            SizedBox(width: 10),
            Text('Add Fees '),
          ],
        ),
        backgroundColor: Colors.deepOrangeAccent[200],
      ),
      // body: Text(s2[1]),

      body: Center(
        child: Form(
          key: _formkey,
          autovalidate: _autovalidate,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/fees.jpeg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 13, right: 13),
              child: DropdownButtonFormField<String>(
                  autofocus: true,
                  focusColor: Colors.white,
                  dropdownColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.blue[200]),
                  hint: Text('SELECT STUDENT NAME',
                      style: TextStyle(color: Colors.grey[800])),
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (String newValue) {
                    setState(() {
                      //selectedvalue= newValue;
                      //updateclasStd();
                    });
                  },
                  // validator: (value) => value == null ? 'Select Class ' : null,
                  //checking whether the list is empty or not
                  items: student_name!= []
                      ? student_name
                          .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList()
                      : Text('No record found')),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 13, right: 13),
              child: DropdownButtonFormField<String>(
                autofocus: true,
                focusColor: Colors.white,
                dropdownColor: Colors.black,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.blue[200]),

                hint: Text('SELECT MONTH',
                    style: TextStyle(color: Colors.grey[800])),
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  setState(() {
                    //selectedvalue= newValue;
                    //updateclasStd();
                  });
                },
                //validator: (value) => value == null ? 'Select Class ' : null,
                items: <String>[
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 13, right: 13),
              child: DropdownButtonFormField<String>(
                autofocus: true,
                focusColor: Colors.white,
                dropdownColor: Colors.black,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.blue[200]),

                hint: Text('SELECT Fees payment',
                    style: TextStyle(color: Colors.grey[800])),
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  setState(() {
                    //selectedvalue= newValue;
                    //updateclasStd();
                  });
                },
                //validator: (value) => value == null ? 'Select Class ' : null,
                items: <String>['400', '500', '600']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value + '/-',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 200,
                height: 70,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent[200],
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      //_save();
                      print("successful");
                      return;
                    } else {
                      print("UnSuccessfull");
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.blue[500], width: 2)),
                  textColor: Colors.white,
                  child: Text(
                    "Add Payment",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List getlist() {
    String check;

    for (var i = 0; i < count; i++) {
      student_name.add(this.noteList[i].name);
    }

    return student_name;
  }

  void updateListView() {
    int i;
    final Future<Database> dbFuture = databaseHelper.database;
    dbFuture.then((database) {
      Future<List<student>> noteListFuture = databaseHelper.getStudentList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;

          s2 = getlist();
          print('helo');
          print(count);
          print(s2);
          print(student_name);
        });
      });
    });
  }
}
