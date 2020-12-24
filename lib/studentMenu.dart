import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:student_data/Batch.dart';
import 'package:student_data/fees.dart';
import 'package:student_data/main.dart';
import 'Batchtype.dart';
import 'Fees Payment.dart';
import 'Add_Student.dart';
import 'package:student_data/models/student.dart';

import 'Student_List.dart';
import 'package:flutter/material.dart';
import 'Add_Student.dart';
class SecondScreen extends StatelessWidget {
  @override
  student note;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Student Data",style: TextStyle(fontSize: 30 ),),
        leading: Icon(Icons.list_alt_outlined),

        backgroundColor: Colors.deepOrangeAccent[200],
        actions: <Widget>[Text('ADD',textAlign:TextAlign.center),IconButton(iconSize: 40, icon: const Icon(Icons.add_circle),
      autofocus: true,
      onPressed: () {
        {Navigator.push(context,  MaterialPageRoute(builder:
            (context) =>FormPage(student('','','','',''), 'Add Student')

        ));}
      },
    ),SizedBox(width: 30,)],
      ),
      body:ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding:  const EdgeInsets.all(16.0),
            child: Container(
              child:FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(14.0),
                shadowColor: Color(0x802196F3),
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:Column(
                    children: [
                      Card(child:GestureDetector(onTap:(){Navigator.push(context,  MaterialPageRoute(builder:
                          (context) =>
                          studentList()
                      ));},
                        child: Row(
                        children: <Widget>[
                          

                          Icon(Icons.list,),
                          SizedBox(width: 20,),
                          Container(


                            child: Text('Student List'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 100,

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,

                                image: AssetImage('assets/h1.jpeg'),
                              ),
                            ),
                          )
                        ],
                      ),

                      ),),
                SizedBox(height: 20,child: Divider(thickness: 30,color: Colors.red,),),

                Card(child: GestureDetector(onTap: (){Navigator.push(context,  MaterialPageRoute(builder:
                    (context) =>Batchtype(),

                ));},child:Row(
                  children: <Widget>[

                    Icon(Icons.group_add_rounded),
                    SizedBox(width: 20,),
                    Container(


                      child: Text('Btach Details',),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,

                          image: AssetImage('assets/group.jpeg'),
                        ),
                      ),
                    )
                  ],
                ),
                ),
              ),

                      SizedBox(height: 20,child: Divider(thickness: 10,color: Colors.red,),),

                      Card(child: GestureDetector(onTap: (){Navigator.push(context,  MaterialPageRoute(builder:
                          (context) =>feespay()

                      ));},child:Row(
                  children: <Widget>[

                    Icon(Icons.details),
                    SizedBox(width: 20,),
                    Container(


                      child: Text('Class Details'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,

                          image: AssetImage('assets/book.jpeg'),
                        ),
                      ),
                    )
                  ],
                ),
                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
          ),

        ],
      )
      );


    }
  }
