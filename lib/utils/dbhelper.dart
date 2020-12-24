import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:student_data/models/student.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String studentTable = 'student_table';
  String colId = 'id';
  String colName = 'name';
  String colsclname = 'School_name';
  String colnum = 'number';
  String colstd = 'class_std';
  String coladd = 'address';
  String colbatch = 'batch';
  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $studentTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT,$colsclname TEXT '
        '$coladd TEXT, $colnum TEXT, $colstd TEXT,$colbatch TEXT)');
  }

  Future<List<Map<String, dynamic>>> getStudentMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(studentTable, orderBy: '$colName ASC');
    return result;
  }

  Future<int> insetStudent(student s1) async {
    Database db = await this.database;
    var result = await db.insert(studentTable, s1.toMap());
    return result;
  }

  Future<int> updateStudent(student s1) async {
    var db = await this.database;
    var result = await db.update(studentTable, s1.toMap(),
        where: '$colId = ?', whereArgs: [s1.id]);
    return result;
  }

  Future<int> deleteStudent(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $studentTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $studentTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<student>> getStudentList() async {
    var noteMapList = await getStudentMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<student> noteList = List<student>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(student.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

  Future<List<student>> getStudenFiltertList(String s1) async {
    var noteMapList =
        await getStudenFilterMaptList(s1); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<student> noteList = List<student>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(student.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

  Future<List<Map<String, dynamic>>> getStudenFilterMaptList(String s1) async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(studentTable,
        where: ' $colbatch = $s1 ', orderBy: '$colName ASC');
    return result;
  }
}
