import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class student {
  int _id;
  String _batch;
  String _Name;
  String _School_name;
  String _class_std;
  String _number;
  String _address;
  student(
      this._Name, this._School_name, this._class_std, this._number, this._batch,
      [this._address]);
  int get id => _id;
  String get name => _Name;
  String get School_name => _School_name;
  String get class_std => _class_std;
  String get number => _number;
  String get address => _address;
  String get batch => _batch;

  //student getById(int id) => student.withId(id,'','','');

  set name(String newName) {
    if (newName.length <= 255) {
      this._Name = newName;
    }
  }

  set School_name(String newSch_name) {
    if (newSch_name.length <= 255) {
      this._School_name = newSch_name;
    }
  }

  set batch(String newbatch) {
    this._batch = newbatch;
  }

  set class_std(String newClassstd) {
    if (newClassstd.length <= 255) {
      this._class_std = newClassstd;
    }
  }

  set number(String newNum) {
    if (newNum.length == 10) {
      this._number = newNum;
    }
  }

  set address(String newadd) {
    if (newadd.length <= 255) {
      this._address = newadd;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name '] = _Name;
    map[' School_name'] = _School_name;
    map['class_std'] = _class_std;
    map['number'] = _number;
    map['batch'] = _batch;
    return map;
  }

  student.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._Name = map['name'];
    this._School_name = map['School_name'];
    this._class_std = map['class_std'];
    this._number = map['number'];
    this._batch = map['batch'];
  }
}
