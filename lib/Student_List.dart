import 'dart:async';
import 'package:flutter/material.dart';
import 'models/student.dart';
import 'utils/dbhelper.dart';
import 'Add_Student.dart';
import 'package:sqflite/sqflite.dart';

class studentList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return studentListState();
  }
}

class studentListState extends State<studentList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<student> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<student>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon((Icons.list_alt_outlined)),
            SizedBox(
              width: 10,
            ),
            Text('Student List'),
          ],
        ),
        backgroundColor: Colors.redAccent[200],
      ),
      body: getStudentListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(student('', '', '', '', ''), 'Add Student');
        },
        tooltip: 'Add Details',
        backgroundColor: Colors.redAccent[200],
        child: Icon(Icons.add),
      ),
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
            title: Row(
              children: [
                Text(
                  this.noteList[position].name,
                  style: TextStyle(
                      color: Colors.red[800], backgroundColor: Colors.white),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  this.noteList[position].class_std + 'th',
                  style: TextStyle(
                      color: Colors.red[800], backgroundColor: Colors.white),
                ),
              ],
            ),
            subtitle: Text(
                this.noteList[position].School_name +
                    " School" +
                    " \n" +
                    this.noteList[position].number,
                style: TextStyle(
                  color: Colors.blueAccent[700],
                )),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    _delete(context, noteList[position]);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.edit,
                    color: Colors.red,
                  ),
                  onTap: () {
                    debugPrint("ListTile Tapped");
                    navigateToDetail(this.noteList[position], 'Edit Details');
                  },
                ),
              ],
            ),
            onTap: () {},
          ),

          //Text(this.noteList[position].address),
        );
      },
    );
  }

  // Returns the priority color

  // Returns the priority icon

  void _delete(BuildContext context, student note) async {
    int result = await databaseHelper.deleteStudent(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Student Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(student note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Addstudent_details(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.database;
    dbFuture.then((database) {
      Future<List<student>> noteListFuture = databaseHelper.getStudentList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
