import 'dart:async';
import 'package:flutter/services.dart';
import 'utils/dbhelper.dart';
import 'Student_List.dart';
import 'models/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class batch_list extends StatefulWidget {
  @override
  final String guestname;

  batch_list({@required this.guestname});

  _batch_listState createState() => _batch_listState();
}

class _batch_listState extends State<batch_list> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<student> noteList;

  int count = 0;

  Widget build(BuildContext context) {
    String batch;

    if (noteList == null) {
      noteList = List<student>();
      updateListView(widget.guestname);
    }
    print(widget.guestname);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.group),
            Text(
              "  Batch Student List",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent[200],
      ),
      body: getStudentListView(),
    );
  }

  ListView getStudentListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent[200],
              child: Icon(Icons.person),
            ),
            title: Text(
              this.noteList[position].name +
                  "           " +
                  "Class-" +
                  this.noteList[position].class_std +
                  'th',
              style: TextStyle(
                  color: Colors.red[800], backgroundColor: Colors.white),
            ),
            subtitle: Text(
                this.noteList[position].School_name +
                    " School" +
                    " \n" +
                    this.noteList[position].number,
                style: TextStyle(
                  color: Colors.blueAccent[700],
                )),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
          ),

          //Text(this.noteList[position].address),
        );
      },
    );
  }

  void _delete(BuildContext context, student note) async {
    int result = await databaseHelper.deleteStudent(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Student Deleted Successfully');
      updateListView(widget.guestname);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView(String s1) {
    final Future<Database> dbFuture = databaseHelper.database;
    dbFuture.then((database) {
      Future<List<student>> noteListFuture =
          databaseHelper.getStudenFiltertList(s1);
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
