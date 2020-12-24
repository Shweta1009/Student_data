import 'package:flutter/material.dart';
import 'package:student_data/Fees%20Payment.dart';
import 'package:student_data/fees.dart';

class fees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fees Details"),
        leading: Icon(Icons.format_align_center),
        backgroundColor: Colors.deepOrangeAccent[200],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/1.jpg')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 1',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '400/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/2.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 2',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '400/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/3.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 3',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '400/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/4.jpeg')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 4',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 170),
                  Text(
                    '400/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/5.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 5',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '400/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/6.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 6',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '500/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/7.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 7',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '500/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/8.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 8',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '500/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/9.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 9',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '600/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/10.png')),
              title: Row(
                children: [
                  Text(
                    'CLASS - 10',
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 10),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '600/-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
