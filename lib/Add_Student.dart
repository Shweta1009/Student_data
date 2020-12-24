import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_data/models/student.dart';
import 'InputDeco_design.dart';
import 'utils/dbhelper.dart';
import 'Validator.dart';

class Addstudent_details extends StatefulWidget {
  final String appBarTitle;
  final student note;
  Addstudent_details(this.note, this.appBarTitle);
  @override
  _Addstudent_detailsState createState() =>
      _Addstudent_detailsState(note, appBarTitle);
}

class _Addstudent_detailsState extends State<Addstudent_details> {
  String appBarTitle;
  student note;
  String name, email, phone;
  DatabaseHelper helper = DatabaseHelper();
  //TextController to read text entered in text field
  TextEditingController fullNamecontoller = TextEditingController();
  TextEditingController schlcontroller = TextEditingController();
  String selectedvalue = 'one';
  String sel = '1';
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  _Addstudent_detailsState(this.note, this.appBarTitle);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String selectedSalutation;

  @override
  Widget build(BuildContext context) {
    fullNamecontoller.text = note.name;
    schlcontroller.text = note.School_name;
    selectedvalue = note.class_std;
    phoneController.text = note.number;
    addressController.text = note.address;
    sel = note.batch;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person_add),
            SizedBox(width: 10),
            Text(appBarTitle),
          ],
        ),
        backgroundColor: Colors.deepOrangeAccent[200],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            autovalidate: _autovalidate,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  fit: BoxFit.cover,
                  //alignment: Alignment.topRight,

                  height: 70,
                  width: double.infinity,

                  image: AssetImage('assets/d3.jpeg'),
                ),
                /*  CircleAvatar(
                  radius: 20,
                  backgroundImage:  AssetImage('assets/h2.jpg'),
                  backgroundColor: Colors.transparent,
                ),*/
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: fullNamecontoller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateName();
                    },
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                    validator: FieldValidator.Validate_name
                    /*(String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },*/
                    ,
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: schlcontroller,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.school, "School Name"),
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateSchlName();
                    },
                    validator: FieldValidator.Validate_schl_name

                    /*(String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter School Name';
                        }
                        return null;
                      }*/
                    ,
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 13, right: 13),
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
                    hint: Text('SELECT STUDENT CLASS',
                        style: TextStyle(color: Colors.grey[800])),
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedvalue = newValue;
                        updateclasStd();
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Select Class ' : null,
                    items: <String>[
                      'CLASS 1',
                      'CLASS 2',
                      'CLASS 3',
                      'CLASS 4',
                      'CLASS 5',
                      'CLASS 6',
                      'CLASS 7',
                      'CLASS 8',
                      'CLASS 9',
                      'CLASS 10'
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
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updatePhone();
                    },
                    validator: FieldValidator.Validate_number

                    /*(String value){
                      if(value.length!=10)
                      {
                        return 'Please enter valid phone no ';
                      }
                      return null;
                    },*/
                    ,
                    onSaved: (String value) {
                      phone = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.streetview_rounded, "Address"),
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateadd();
                    },
                    validator: FieldValidator.Validate_address
                    /*(String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter complete Address ';
                      }
                      return null;
                    },*/
                    ,
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 13, right: 13),
                  child: DropdownButtonFormField<String>(
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
                    hint: Text(
                      'Select Batch',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        sel = newValue;
                        updatebatch();
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Select Batch ' : null,
                    items: <String>['1', '2', '3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          'BATCH' + value,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent[200],
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        _save();
                        print("successful");
                        print(note.name);
                        print(note.address);
                        print(note.number);

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
                      "Add Student",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateName() {
    note.name = fullNamecontoller.text;
  }

  void updatebatch() {
    note.batch = sel;
    print(sel);
  }

  // Update the description of Note object
  void updateSchlName() {
    note.School_name = schlcontroller.text;
  }

  void updateclasStd() {
    note.class_std = selectedvalue;
  }

  // Update the description of Note object
  void updatePhone() {
    note.number = phoneController.text;
  }

  void updateadd() {
    note.address = addressController.text;
  }

  // Update the description of Note object

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteStudent(note.id);
    if (result != 0) {
      print(result);
      print(note.batch);
      _showAlertDialog('Status', 'Student Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _save() async {
    moveToLastScreen();

    int result;
    if (note.id != null) {
      // Case 1: Update operation
      print('dekho to');
      print(result);
      result = await helper.updateStudent(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insetStudent(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Student Added Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Student');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
