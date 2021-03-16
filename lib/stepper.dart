import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'classes.dart';

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropdownValue = 'k';
  String dropper = '';
  var todo = Todo('fa', 'dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(
        child: Column(children: [
          RaisedButton(
            color: Colors.black,
            child: DropdownButton<String>(
              value: dropdownValue,
              underline: Container(),
              icon: Icon(Icons.arrow_downward),
              iconSize: 20.0, // can be changed, default: 24.0
              iconEnabledColor: Colors.red,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  todo.title = newValue;
                });
              },
              items: <String>['k', 'r', 'v', 'z']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            color: Colors.black,
            child: DropdownButton<String>(
              value: dropper,
              underline: Container(),
              icon: Icon(Icons.arrow_downward),
              iconSize: 20.0, // can be changed, default: 24.0
              iconEnabledColor: Colors.red,
              onChanged: (String newValue) {
                setState(() {
                  dropper = newValue;
                });
              },
              items: <String>['', 'Second']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  title: Text("red"),
                  // When a user taps the ListTile, navigate to the DetailScreen.
                  // Notice that you're not only creating a DetailScreen, you're
                  // also passing the current todo through to it.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(currentUserId: 'fdsdf', todo: todo),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
